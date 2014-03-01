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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# qcom common
$(call inherit-product, device/sony/qcom-common/qcom-common-42.mk)

COMMON_PATH := device/sony/blue-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(COMMON_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(COMMON_PATH)/rootdir/fstab.qcom:recovery/root/fstab.qcom \
    $(COMMON_PATH)/rootdir/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(COMMON_PATH)/rootdir/system/etc/init.sony.bt.sh:system/etc/init.sony.bt.sh \
    $(COMMON_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

# Key and touchscreen files

# hayabusa has its own screen calibration file and needs an extra keylayout file
ifeq ($(TARGET_DEVICE),hayabusa)
    PRODUCT_COPY_FILES += \
        $(COMMON_PATH)/rootdir/system/usr/idc/clearpad.idc:system/usr/idc/clearpad.idc \
        $(COMMON_PATH)/rootdir/system/usr/keylayout/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl
else
    PRODUCT_COPY_FILES += \
        $(COMMON_PATH)/rootdir/system/usr/idc/sensor00_f11_sensor0.idc:system/usr/idc/sensor00_f11_sensor0.idc
endif

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/simple_remote.kl:system/usr/keylayout/simple_remote.kl

# FM Radio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_PATH)/rootdir/system/etc/snd_soc_msm/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml

# GPS
PRODUCT_COPY_FILES += \
   $(COMMON_PATH)/rootdir/system/etc/gps.conf:system/etc/gps.conf

# WPA supplicant config
PRODUCT_COPY_FILES += \
   $(COMMON_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
   $(COMMON_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Prima wifi config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini

# Script for fixing perms on internal sdcard
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/bin/fix_storage_permissions.sh:system/bin/fix_storage_permissions.sh

# Post recovery script
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Thermal monitor configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/thermald.conf:system/etc/thermald.conf \
    $(COMMON_PATH)/rootdir/system/etc/disable_msm_thermal.sh:system/etc/disable_msm_thermal.sh

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Recovery
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# QCOM Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    memtrack.msm8960

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

# BT
PRODUCT_PACKAGES += \
    hci_qcomm_init

# Camera
PRODUCT_PACKAGES += \
    camera.sony \
    camera.msm8960 \
    libmmcamera_interface2 \
    libmmcamera_interface

# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8960

# WLAN
PRODUCT_PACKAGES += \
    libwfcu \
    mac-update

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Radio and Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    ro.ril.transmitpower=true \
    persist.radio.add_power_save=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.mode=endfire \
    persist.audio.handset.mic=analog \
    persist.audio.lowlatency.rec=false \
    af.resampler.quality=255 \
    ro.qc.sdk.audio.fluencetype=none \
    lpa.decode=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=0

# Include non-opensource parts
$(call inherit-product, vendor/sony/blue-common/blue-common-vendor.mk)
