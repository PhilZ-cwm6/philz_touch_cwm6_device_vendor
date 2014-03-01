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

COMMON_PATH := device/samsung/lt01-common

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# No flashlight, no Torch app
TARGET_HAS_CAM_FLASH := false

# Init files
PRODUCT_COPY_FILES := \
    $(COMMON_PATH)/rootdir/init.smdk4x12.rc:root/init.smdk4x12.rc \
    $(COMMON_PATH)/rootdir/init.smdk4x12.usb.rc:root/init.smdk4x12.usb.rc \
    $(COMMON_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(COMMON_PATH)/rootdir/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    $(COMMON_PATH)/rootdir/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc

# Camera
PRODUCT_PACKAGES += \
    camera.smdk4x12

# IRDA
PRODUCT_PACKAGES += \
    consumerir.exynos4

# Lights
PRODUCT_PACKAGES += \
    lights.exynos4

# Sensors
PRODUCT_PACKAGES += \
    sensors.smdk4x12

# Packages
PRODUCT_PACKAGES += \
    tinyplay

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Include non-opensource parts
$(call inherit-product, vendor/samsung/lt01-common/common-vendor.mk)

$(call inherit-product, device/samsung/smdk4412-common/common.mk)
