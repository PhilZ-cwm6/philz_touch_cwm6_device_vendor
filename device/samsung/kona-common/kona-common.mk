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

LOCAL_PATH := device/samsung/kona-common

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

TARGET_HAS_CAM_FLASH := false

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.smdk4x12.usb.rc:root/init.smdk4x12.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/rootdir/fstab.smdk4x12:root/fstab.smdk4x12

# Packages
PRODUCT_PACKAGES += \
    libsecril-client \
    tiny_hw \
    SamsungServiceMode \
    VoicePlus

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml \
    $(LOCAL_PATH)/configs/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    $(LOCAL_PATH)/configs/nvram_mfg.txt_murata:system/etc/wifi/nvram_mfg.txt_murata \
    $(LOCAL_PATH)/configs/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    $(LOCAL_PATH)/configs/nvram_net.txt_murata:system/etc/wifi/nvram_net.txt_murata \
    $(LOCAL_PATH)/configs/80mac:system/etc/init.d/80mac

# Camera
PRODUCT_PACKAGES += \
    camera.smdk4x12

# Sensors
PRODUCT_PACKAGES += \
    sensors.smdk4x12

# IR packages
PRODUCT_PACKAGES += \
    consumerir.exynos4

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc

# Set product characteristic to tablet, needed for some ui elements
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, vendor/samsung/kona-common/kona-vendor.mk)

$(call inherit-product, device/samsung/smdk4412-common/common.mk)
