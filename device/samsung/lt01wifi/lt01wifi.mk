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

LOCAL_PATH := device/samsung/lt01wifi

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.smdk4x12:root/fstab.smdk4x12 \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/tiny_hw.xml:system/etc/sound/lt01wifi

# Gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=wlan0

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

$(call inherit-product-if-exists, vendor/samsung/lt01wifi/lt01wifi-vendor.mk)

$(call inherit-product-if-exists, vendor/samsung/lt013g/lt013g-vendor.mk)

$(call inherit-product, device/samsung/lt01-common/common.mk)
