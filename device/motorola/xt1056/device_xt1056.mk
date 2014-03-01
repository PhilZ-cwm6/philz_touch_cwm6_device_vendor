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

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/motorola/msm8960dt-common/msm8960dt.mk)

LOCAL_PATH := device/motorola/xt1056

# xt1056 specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnCdmaDevice=1 \
	ro.config.svdo=true \
	persist.radio.dfr_mode_set=1 \
	persist.radio.eons.enabled= true \
	persist.rmnet.mux=disabled \
	ro.cdma.nbpcd=0 \
	ro.cdma.international.eri=2,74,124,125,126,157,158,159,193,194,195,196,197,198,228,229,230,231,232,233,234,235 \
	ro.telephony.default_network=8 \
	persist.data_netmgrd_mtu=1472 \
	telephony.rilV7NeedCDMALTEPhone=true \
	persist.timed.enable=true

#    ro.cdma.home.operator.numeric=310120
#    ro.cdma.home.operator.alpha=Sprint

$(call inherit-product, device/motorola/msm8960dt-common/keylayout/keylayout.mk)
$(call inherit-product, device/motorola/qcom-common/keylayout/keylayout.mk)
$(call inherit-product, device/motorola/qcom-common/modules/nfc/nfc.mk)
$(call inherit-product, vendor/motorola/xt1056/xt1056-vendor.mk)
