#
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
#

# overlays
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald-8064-find5.conf:system/etc/thermald.conf

# Init logos
PRODUCT_PACKAGES += \
    at.rle \
    fastboot.rle \
    initlogo.rle \
    tpupdate.rle \
    wlan.rle

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# call the proprietary setup
$(call inherit-product-if-exists, vendor/oppo/find5/find5-vendor.mk)

# Inherit from apq8064-common
$(call inherit-product, device/oppo/apq8064-common/apq8064.mk)
