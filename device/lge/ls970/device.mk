#
# Copyright (C) 2011 The Android Open-Source Project
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
$(call inherit-product-if-exists, vendor/lge/e975/e975-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/ls970/overlay

## common overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/ls970-common/overlay-cdma

# Inherit from ls970-common
$(call inherit-product, device/lge/ls970-common/ls970-common.mk)

# Enable for debugging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    persist.service.adb.enable=1



# Telephony Properties
PRODUCT_PROPERTY_OVERRIDES += \
        ro.cdma.home.operator.numeric=310120 \
        ro.cdma.home.operator.alpha=Sprint \
        telephony.lteOnCdmaDevice=1 \
        telephony.lte.cdma.device=1 \
        ro.telephony.default_network=8 \
        ro.ril.def.preferred.network=8 \
        ril.subscription.types=NV,RUIM \
        ro.cdma.subscribe_on_ruim_ready=true \
        persist.radio.no_wait_for_card=1 \
        keyguard.no_require_sim=true \
        telephony.sms.pseudo_multipart=1 \
        DEVICE_PROVISIONED=1

PRODUCT_CHARACTERISTICS := nosdcard  

# Ramdisk
PRODUCT_COPY_FILES += \
    device/lge/ls970/ramdisk/init.ls970.rc:root/init.ls970.rc \
    device/lge/ls970/ramdisk/ueventd.ls970.rc:root/ueventd.ls970.rc \
    device/lge/ls970/ramdisk/fstab.ls970:root/fstab.ls970

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml
