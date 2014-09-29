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


$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8960 configs
$(call inherit-product, device/htc/msm8960-common/msm8960.mk)

# Inherit from dlx device
$(call inherit-product, device/htc/dlx/device.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += device/htc/dlx/gps/gps.conf:system/etc/gps.conf

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.dlx \
    init.qcom.firmware_links.sh \
    init.dlx.rc \
    init.dlx.usb.rc \
    ueventd.dlx.rc

# Post boot service
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.post_boot.sh:system/etc/init.post_boot.sh

# Recovery
PRODUCT_PACKAGES += \
    lpm.rc \
    choice_fn \
    detect_key \
    power_test \
    chargeled \
    offmode_charging \
    offmode_charging_res_images \
    offmode_charging_warn_res_images \
    init.recovery.dlx.rc

PRODUCT_PACKAGES += \
    libnetcmdiface

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/htc/dlx/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/htc/dlx/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml


# QC thernald config
PRODUCT_COPY_FILES += device/htc/dlx/configs/thermald.conf:/system/etc/thermald.conf

# Media configs
PRODUCT_COPY_FILES += device/htc/dlx/configs/AudioBTID.csv:system/etc/AudioBTID.csv
PRODUCT_COPY_FILES += device/htc/dlx/configs/AudioBTIDnew.csv:system/etc/AudioBTIDnew.csv

# wifi config
PRODUCT_COPY_FILES += \
    device/htc/dlx/configs/calibration:/system/etc/calibration \
    device/htc/dlx/configs/calibration.gpio4:/system/etc/calibration.gpio4

# Audio config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/dlx/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/dlx/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/dlx/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

PRODUCT_COPY_FILES += \
    device/htc/dlx/dsp/snd_soc_msm/snd_soc_msm_2x_Fusion3:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 

# Wifi
PRODUCT_COPY_FILES += \
    device/htc/dlx/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/htc/dlx/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/dlx/keylayout/dummy_keypad.kl:system/usr/keylayout/dummy_keypad.kl \
    device/htc/dlx/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    device/htc/dlx/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/dlx/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/htc/dlx/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    device/htc/dlx/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/dlx/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/dlx/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Audio
PRODUCT_PACKAGES += \
	libaudioamp

# Camera
PRODUCT_PACKAGES += \
	camera.msm8960

# GPS
PRODUCT_PACKAGES += \
        libloc_adapter \
        libloc_eng \
        libloc_api_v02 \
        libgps.utils \
        gps.msm8960

# NFC
PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_ndef \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Torch
PRODUCT_PACKAGES += \
    Torch

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := nosdcard

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi xxhdpi
PRODUCT_LOCALES += en_US

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
