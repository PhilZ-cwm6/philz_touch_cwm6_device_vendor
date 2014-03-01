#
# Copyright (C) 2011 The CyanogenMod Project
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

# Inherit the blue-common definitions
$(call inherit-product, device/sony/blue-common/blue.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/mint/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Configuration scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/sensors.conf:system/etc/sensors.conf \
    $(LOCAL_PATH)/rootdir/system/etc/sysmon.cfg:system/etc/sysmon.cfg \
    $(LOCAL_PATH)/rootdir/system/etc/pre_hw_config.sh:system/etc/pre_hw_config.sh \
    $(LOCAL_PATH)/rootdir/system/etc/hw_config.sh:system/etc/hw_config.sh

# Device specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.device.rc:root/init.device.rc

# USB function switching
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/bootrec-device:recovery/bootrec-device

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Include non-opensource parts
$(call inherit-product, vendor/sony/mint/mint-vendor.mk)
