#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FORCE_32_BIT := true

# Inherit from msm8909-common
include device/cyanogen/msm8909-common/BoardConfigCommon.mk

DEVICE_PATH := device/kido/k2

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/cameraserver=22 \
    /system/bin/mediaserver=22 \
    /vendor/bin/mm-qcamera-daemon=22

# Charger
# Do NOT enable charger-mode autosuspend on this device.
# With BOARD_CHARGER_ENABLE_SUSPEND the charger UI calls request_suspend(true)
# right after the animation finishes and the screen is blanked, i.e. the power
# key is supposed to wake the system up again.  This port never exercises
# suspend/resume otherwise (Android keeps wakelocks, /sys/kernel/debug/suspend_stats
# stays at 0/0 and the qpnp-power-on wakeup source is never activated), so the
# first real suspend happens here and the display never comes back on a power
# key press.  Keeping the CPU awake in charger mode makes the power key work.
BOARD_CHARGER_ENABLE_SUSPEND := false
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true

# Display
#TARGET_SCREEN_DENSITY := 240

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5939100672
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE      := 67108864
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT   := 4096
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE    := squashfs
BOARD_VENDORIMAGE_JOURNAL_SIZE        := 0
BOARD_VENDORIMAGE_SQUASHFS_COMPRESSOR := lz4
#PRODUCT_VENDOR_MOVE_ENABLED := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USE_VENDOR_IMAGE := true
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# GPS
TARGET_NO_RPC := true

# Kernel
#BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
#BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_SOURCE := kernel/kido/msm8909
TARGET_KERNEL_CONFIG := lineageos_kiic_defconfig
BOARD_KERNEL_CMDLINE += phy-msm-usb.floated_charger_enable=1 androidboot.selinux=permissive

# Low Memory Devices
MALLOC_SVELTE := true

# Power
TARGET_HAS_LEGACY_POWER_STATS := true
TARGET_HAS_NO_POWER_STATS := true
TARGET_HAS_NO_WLAN_STATS := true
#TARGET_USES_INTERACTION_BOOST := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
BOARD_NO_SECURE_DISCARD := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib/libmmcamera2_imglib_modules.so|libshim_camera.so

# inherit from the proprietary version
include vendor/kido/k2/BoardConfigVendor.mk
