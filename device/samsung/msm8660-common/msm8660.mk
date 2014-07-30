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


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Media config
PRODUCT_COPY_FILES += \
    device/samsung/msm8660-common/configs/media_profiles.xml:system/etc/media_profiles.xml

# libnetcmdiface
PRODUCT_PACKAGES += \
    libnetcmdiface

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \

# HALs
PRODUCT_PACKAGES += \
    camera.msm8660 \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    lights.msm8660 \
    gps.msm8660 \
    memtrack.msm8660 \
    power.msm8660

# Audio
PRODUCT_PACKAGES += \
    audio_policy.conf \
    audio.a2dp.default \
    audio_policy.msm8660 \
    audio.primary.msm8660 \
    libaudio-resampler \
    libaudioutils

# GalaxyS2Settings
PRODUCT_PACKAGES += \
     GalaxyS2Settings \
     SamsungServiceMode

ifeq ($(BOARD_HAVE_NFC),true)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/samsung/msm8660-common/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/samsung/msm8660-common/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

endif # BOARD_HAVE_NFC

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/msm8660-common/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/samsung/msm8660-common/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# keylayouts
PRODUCT_COPY_FILES += \
    device/samsung/msm8660-common/keylayout/8660_handset.kl:system/usr/keylayout/8660_handset.kl\
    device/samsung/msm8660-common/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/msm8660-common/keylayout/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
    device/samsung/msm8660-common/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    device/samsung/msm8660-common/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/msm8660-common/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/msm8660-common/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl\
    device/samsung/msm8660-common/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
    device/samsung/msm8660-common/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/samsung/msm8660-common/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/samsung/msm8660-common/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/samsung/msm8660-common/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/samsung/msm8660-common/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/samsung/msm8660-common/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    device/samsung/msm8660-common/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    device/samsung/msm8660-common/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/samsung/msm8660-common/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/samsung/msm8660-common/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/samsung/msm8660-common/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/samsung/msm8660-common/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/samsung/msm8660-common/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# IDC
PRODUCT_COPY_FILES += \
    device/samsung/msm8660-common/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/samsung/msm8660-common/idc/qwerty2.idc:system/usr/idc/qwerty2.idc

# Needed to reset bootmode when leaving recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/system/bin/postrecoveryboot.sh

# Support for testing the baseband version
PRODUCT_COPY_FILES += \
	device/samsung/msm8660-common/test_radio_version.sh:/system/etc/test_radio_version.sh

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Common properties
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    com.qc.hardware=true \
    ro.vendor.extension_library=/system/lib/libqc-opt.so \
    debug.mdpcomp.maxlayer=3 \
    debug.hwc.dynThreshold=1.9 \
    lpa.decode=false

# Common overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/msm8660-common/overlay

# Common Qualcomm hardware
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

