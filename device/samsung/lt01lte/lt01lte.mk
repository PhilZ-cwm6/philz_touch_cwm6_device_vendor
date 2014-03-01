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

LOCAL_PATH := device/samsung/lt01lte

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.smdk4x12:root/fstab.smdk4x12 \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/tiny_hw.xml:system/etc/sound/lt01lte

# Gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf

# Product specific Packages
PRODUCT_PACKAGES += \
    Stk \
    SamsungServiceMode

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungQualcommRIL \
    mobiledata.interfaces=rmnet0,pdp0,wlan0,gprs,ppp0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

$(call inherit-product-if-exists, vendor/samsung/lt01lte/lt01lte-vendor.mk)

$(call inherit-product, device/samsung/lt01-common/common.mk)
