#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/motorola/msm8960-common/msm8960.mk)

LOCAL_PATH := device/motorola/xt925

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# xt925 specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Use common media profile
TARGET_USES_MOTOROLA_MSM8960_COMMON_MEDIA_PROFILES := true

# Nfc
PRODUCT_PACKAGES += \
    nfc.msm8960

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

#telephony
PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnGsmDevice=1 \
	telephony.lteOnCdmaDevice=0 \
	ro.telephony.default_network=9 \
	persist.radio.no_wait_for_card=1 \
	persist.radio.call_type=1 \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.dfr_mode_set=1

$(call inherit-product, device/motorola/qcom-common/idc/idc.mk)
$(call inherit-product, device/motorola/qcom-common/keychars/keychars.mk)
$(call inherit-product, device/motorola/qcom-common/keylayout/keylayout.mk)
$(call inherit-product, device/motorola/qcom-common/modules/nfc/nfc.mk)
$(call inherit-product, vendor/motorola/xt925/xt925-vendor.mk)
