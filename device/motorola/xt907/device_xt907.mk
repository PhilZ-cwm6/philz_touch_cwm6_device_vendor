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

LOCAL_PATH := device/motorola/xt907

# xt907 specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Nfc
PRODUCT_PACKAGES += \
    nfc.msm8960

# Stk
PRODUCT_PACKAGES += \
    Stk

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=1 \
    ro.config.svdo=true \
    persist.radio.eons.enabled= true \
    ro.cdma.nbpcd=1 \
    ro.cdma.home.operator.isnan=1 \
    ro.telephony.gsm-routes-us-smsc=1 \
    ro.cdma.otaspnumschema=SELC,1,80,99 \
    ro.cdma.data_retry_config=max_retries=infinite,0,0,10000,10000,100000,10000,10000,10000,10000,140000,540000,960000 \
    ro.gsm.data_retry_config=default_randomization=2000,max_retries=infinite,1000,1000,80000,125000,485000,905000 \
    ro.gsm.2nd_data_retry_config=max_retries=1,15000 \
    persist.radio.mode_pref_nv10=1 \
    persist.radio.vrte_logic=2 \
    persist.radio.0x9e_not_callname=1 \
    persist.radio.skip_data_check=1 \
    persist.ril.max.crit.qmi.fails=4 \
    ro.cdma.home.operator.numeric=310004 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.telephony.default_network=10 \
    ro.mot.ignore_csim_appid=true \
    telephony.rilV7NeedCDMALTEPhone=true \
    ro.cdma.subscribe_on_ruim_ready=true \
    persist.timed.enable=true

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/atmxt-i2c.idc:system/usr/idc/atmxt-i2c.idc \
    $(LOCAL_PATH)/idc/evfwd.idc:system/usr/idc/evfwd.idc \
    $(LOCAL_PATH)/idc/atmxt-i2c.idc:recovery/root/vendor/firmware/atmxt-i2c.idc \
    vendor/motorola/xt907/proprietary/etc/firmware/atmxt-r2.tdat:recovery/root/vendor/firmware/atmxt-r2.tdat

# MediaProfile for xt907
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

$(call inherit-product, device/motorola/qcom-common/keychars/keychars.mk)
$(call inherit-product, device/motorola/qcom-common/keylayout/keylayout.mk)
$(call inherit-product, device/motorola/qcom-common/modules/nfc/nfc.mk)
$(call inherit-product, vendor/motorola/xt907/xt907-vendor.mk)
