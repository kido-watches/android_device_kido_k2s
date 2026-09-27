# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

WITH_ADB_INSECURE := true

$(call inherit-product, device/kido/k2/full_k2.mk)

# Inherit common Android Go defaults.
$(call inherit-product, build/make/target/product/go_defaults_512.mk)

# Device was launched with L
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_l.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_mini_phone.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8909

# Assert
TARGET_OTA_ASSERT_DEVICE := kiic,kiis,k2,k2s,k2c

PRODUCT_NAME := lineage_k2
BOARD_VENDOR := kido
PRODUCT_DEVICE := k2

PRODUCT_GMS_CLIENTID_BASE := android-kido

# Build fingerprint
BUILD_FINGERPRINT="Zeusis/kiic/kiic:5.1.1/KIISCN00X1000DPX1709290/buildfarm09291123:user/test-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="kiic-user 5.1.1 KIISCN00X1000DPX1709290 eng.buildfarm.20170929.112217 test-keys"
