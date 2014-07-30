# Copyright (C) 2013 The CyanogenMod Project
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

# Camera and Gallery
PRODUCT_PACKAGES := \
        Gallery

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers \
        librs_jni

PRODUCT_PROPERTY_OVERRIDES += \
    telephony.sms.send=false \
    ro.radio.noril=yes

# Inherit from those products. Most specific first.
$(call inherit-product, device/amazon/jem/device.mk)

# wifi-only device -- set here so that jemlte can keep telephony settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_NAME := full_jem
PRODUCT_DEVICE := jem
PRODUCT_BRAND := google
PRODUCT_MODEL := Amazon Jem
PRODUCT_MANUFACTURER := android
