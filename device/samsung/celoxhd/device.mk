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

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/celoxhd/celoxhd-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/celoxhd/overlay

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/celoxhd/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc

# BT firmware
PRODUCT_COPY_FILES += \
    device/samsung/celoxhd/firmware/bcm4330B1.hcd:system/etc/firmware/bcm4330B1.hcd
    
# Needed for vibrator to work in recovery
PRODUCT_COPY_FILES += \
	device/samsung/celoxhd/recovery/root/lib/modules/vibrator.ko:recovery/root/lib/modules/vibrator.ko \
	device/samsung/celoxhd/recovery/root/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc

# Inherit from celox-common
$(call inherit-product, device/samsung/celox-common/celox-common.mk)

## TARGET_SCREEN_HEIGHT/TARGET_SCREEN_WIDTH are being overwritten by celox-common.mk. Reset them here
#  to correct the device dimensions
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

$(call inherit-product-if-exists, vendor/samsung/celoxhd/celoxhd-vendor.mk)
