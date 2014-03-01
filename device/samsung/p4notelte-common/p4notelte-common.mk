#
# Copyright (C) 2012 The CyanogenMod Project
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
LOCAL_PATH := device/samsung/p4notelte-common

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-common

PRODUCT_AAPT_CONFIG := xlarge mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Torch
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/80torch:system/etc/init.d/80torch

# Packages
PRODUCT_PACKAGES += \
    tiny_hw \
    DeviceSettings \
    Stk \
    SamsungServiceMode \
    Mms

# Camera
PRODUCT_PACKAGES += \
    camera.smdk4x12

# IR packages
PRODUCT_PACKAGES += \
    consumerir.exynos4

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungQualcommRIL \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml
    
# Set product characteristic to tablet, needed for some ui elements
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, device/samsung/smdk4412-common/common.mk)
$(call inherit-product, device/samsung/smdk4412-qcom-common/common.mk)

$(call inherit-product-if-exists, vendor/samsung/p4notelte/p4notelte-vendor.mk)
