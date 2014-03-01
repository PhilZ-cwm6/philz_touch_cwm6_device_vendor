#
# Copyright (C) 2012 The Android Open-Source Project
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

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    $(LOCAL_PATH)/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/recovery/sbin/power_test:recovery/root/sbin/power_test \
    $(LOCAL_PATH)/recovery/sbin/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Files needed for boot image
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/ramdisk/init.enrc2b.rc:root/init.enrc2b.rc \
    $(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/ramdisk/init.scripts.sh:root/init.scripts.sh \
    $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.enrc2b.rc:root/ueventd.enrc2b.rc \
    $(LOCAL_PATH)/ramdisk/fstab.enrc2b:root/fstab.enrc2b

# Prebuilt GPS/Camera/Wi-Fi configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvcamera_2nd.conf:system/etc/nvcamera_2nd.conf \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    $(LOCAL_PATH)/configs/gps/gpsconfig_release.xml:system/etc/gps/gpsconfig_release.xml \
    $(LOCAL_PATH)/configs/htcfs.conf:system/etc/htcfs.conf \
    $(LOCAL_PATH)/configs/hostapd.conf:system/etc/wifi/hostapd.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/configs/calibration:system/etc/calibration \
    $(LOCAL_PATH)/configs/sysctl.conf:system/etc/sysctl.conf

# BT
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

#Audio packages
PRODUCT_PACKAGES += \
    libinvensense_mpl

# Filesystem management tools
PRODUCT_PACKAGES += \
    sdcard \
    libmtp

# Hostapd   
PRODUCT_PACKAGES += \
    hostapd_cli \
    calibrator

#NFC
PRODUCT_PACKAGES += \
    libnfc_ndef
        
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    persist.sys.usb.config=mtp,adb

#Performance tuning (http://source.android.com/devices/tuning.html)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true \
    ro.hwui.texture_cache_size=32 \
    ro.hwui.layer_cache_size=24

# Tegra 3 spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1 \
    tf.enable=y

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_LOCALES += en_GB xhdpi

$(call inherit-product, vendor/htc/enrc2b/enrc2b-vendor.mk)

# common tegra3-HOX+ configs
$(call inherit-product, device/htc/tegra3-common/tegra3.mk)
