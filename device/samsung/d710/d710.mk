# Copyright (C) 2010 The Android Open Source Project
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

LOCAL_PATH := device/samsung/d710

# Init files
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/rootdir/fstab.smdk4210:root/fstab.smdk4210 \
    $(LOCAL_PATH)/rootdir/init.smdk4210.rc:root/init.smdk4210.rc \
    $(LOCAL_PATH)/rootdir/init.smdk4210.usb.rc:root/init.smdk4210.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4210.rc:root/ueventd.smdk4210.rc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/usr/keylayout/max8997-muic.kl:system/usr/keylayout/max8997-muic.kl \
    $(LOCAL_PATH)/usr/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
    $(LOCAL_PATH)/usr/keylayout/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/usr/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

#idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/melfas_ts.idc:system/usr/idc/melfas_ts.idc \
    $(LOCAL_PATH)/usr/idc/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc \
    $(LOCAL_PATH)/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Fix USB transfer speeds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Net
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/configs/ip-down:system/etc/ppp/ip-down

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf

# Sensors
PRODUCT_PACKAGES += \
    sensors.exynos4

# WIMAX
PRODUCT_PACKAGES += \
    AngryGPS \
    SprintMenu \
    SystemUpdateUI

#    WiMAXSettings \
#    WiMAXHiddenMenu \

# Screen density is actually considered a locale (since it is taken into account
# the the build-time selection of resources). The product definitions including
# this file must pay attention to the fact that the first entry in the final
# PRODUCT_LOCALES expansion must not be a density.
# This device is hdpi.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180 \
    ro.telephony.sends_barcount=1 \
    ro.ril.def.agps.mode=2 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=0 \
    hwui.render_dirty_regions=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.usb.setting=0 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mass_storage,adb \
    persist.service.usb.hubport=4

# Telephony property for CDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4 \
    ro.com.google.clientidbase=android-sprint-us \
    ro.cdma.home.operator.numeric=310120 \
    ro.cdma.home.operator.alpha=Sprint \
    net.cdma.pppd.authtype=require-pap \
    net.cdma.pppd.user=user[SPACE]SprintNextel \
    net.cdma.datalinkinterface=/dev/ttyCDMA0 \
    net.interfaces.defaultroute=cdma \
    net.cdma.ppp.interface=ppp0 \
    ro.wimax.interface=uwbr0 \
    net.connectivity.type=CDMA1 \
    mobiledata.interfaces=ppp0,wlan0,uwbr0 \
    ro.telephony.ril_class=SamsungCDMAv6RIL \
    ro.ril.samsung_cdma=true \
    ro.carrier=Sprint

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

# Include common makefile
$(call inherit-product, device/samsung/galaxys2-common/common.mk)
DEVICE_PACKAGE_OVERLAYS := \
    $(LOCAL_PATH)/overlay \
    device/samsung/galaxys2-common/overlay
$(call inherit-product-if-exists, vendor/samsung/d710/d710-vendor.mk)
