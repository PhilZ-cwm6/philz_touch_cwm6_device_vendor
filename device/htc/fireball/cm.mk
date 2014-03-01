# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/fireball/device_fireball.mk)

# Device naming
PRODUCT_DEVICE := fireball
PRODUCT_NAME := cm_fireball
PRODUCT_BRAND := htc
PRODUCT_MODEL := Incredible 4G LTE
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=fireball \
    BUILD_ID=IMM76D \
    BUILD_FINGERPRINT="verizon_wwe/fireball/fireball:4.0.4/IMM76D/278117.2:user/release-keys" \
    PRIVATE_BUILD_DESC="2.19.605.2 CL278117 release-keys"

# Access VZW apps in Play store
PRODUCT_GMS_CLIENTID_BASE := android-verizon

# Release name
PRODUCT_RELEASE_NAME := fireball

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
