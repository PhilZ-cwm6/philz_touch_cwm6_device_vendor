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

# This file includes all definitions that apply to ALL ls970-common devices, and
# are also specific to ls970-common devices
#
# Everything in this directory will become public
#
$(call inherit-product, device/lge/gproj-common/gproj.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Enable Torch
PRODUCT_PACKAGES += Torch

# Ramdisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/ramdisk/init.ls970-common.rc:root/init.ls970-common.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh

# WiFi
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
	$(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Audio SND SOC Config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/snd_soc_msm/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml

# Thermal Daemon
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/thermald-ls970-common.conf:system/etc/thermald.conf

# Non-Ramdisk Init Scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/scripts/init.ls970.bt.sh:system/etc/init.ls970.bt.sh \
	$(LOCAL_PATH)/scripts/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
 	$(LOCAL_PATH)/scripts/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
	$(LOCAL_PATH)/scripts/efsbackup.sh:system/bin/efsbackup.sh

# 
# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayouts/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
	$(LOCAL_PATH)/keylayouts/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
	$(LOCAL_PATH)/keylayouts/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
	$(LOCAL_PATH)/keylayouts/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
	$(LOCAL_PATH)/keylayouts/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
	$(LOCAL_PATH)/keylayouts/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
	$(LOCAL_PATH)/keylayouts/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
	$(LOCAL_PATH)/keylayouts/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm


# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += \
        packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

PRODUCT_PACKAGES += \
	lights.geehrc

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

# QC RIL path for rild
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so 

PRODUCT_PACKAGES += \
	hci_qcomm_init

#PRODUCT_PACKAGES += \
#	power.msm8960

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.ls970.bt.sh:system/etc/init.ls970.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

PRODUCT_PACKAGES += \
	camera.msm8960 \
	libmmcamera_interface2 \
	libmmcamera_interface

PRODUCT_PACKAGES += \
	libwfcu \
	conn_init

PRODUCT_PACKAGES += \
	keystore.msm8960

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
        media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	debug.prerotation.disable=1

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
