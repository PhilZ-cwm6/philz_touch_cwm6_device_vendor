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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common S4 configs
$(call inherit-product, device/htc/s4-common/s4.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/fireball/overlay

# Boot ramdisk setup
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc \
    remount.qcom

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/fireball/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/fireball/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/fireball/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/fireball/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/fireball/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/fireball/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/fireball/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

PRODUCT_COPY_FILES += \
    device/htc/fireball/dsp/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x

# Media config
PRODUCT_COPY_FILES += \
    device/htc/fireball/configs/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/fireball/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/fireball/keylayout/dummy_keypad.kl:system/usr/keylayout/dummy_keypad.kl \
    device/htc/fireball/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/fireball/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/htc/fireball/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    device/htc/fireball/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    device/htc/fireball/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/fireball/keylayout/tv-touchscreen.kl:system/usr/keylayout/tv-touchscreen.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/fireball/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/fireball/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/fireball/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/fireball/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc

# Recovery
PRODUCT_COPY_FILES += \
    device/htc/fireball/rootdir/etc/fstab.qcom:recovery/root/fstab.qcom

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/htc/fireball/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/htc/fireball/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Torch
PRODUCT_PACKAGES += \
    Torch

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/fireball/fireball-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := fireball
PRODUCT_NAME := fireball
PRODUCT_BRAND := htc
PRODUCT_MODEL := Incredible 4G LTE
PRODUCT_MANUFACTURER := HTC
