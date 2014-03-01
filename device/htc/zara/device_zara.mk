$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/zara/zara-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/zara/overlay

LOCAL_PATH := device/htc/zara
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_COPY_FILES += \
    device/htc/zara/recovery/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/zara/recovery/detect_key:recovery/root/sbin/detect_key \
    device/htc/zara/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    device/htc/zara/recovery/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/zara/recovery/power_test:recovery/root/sbin/power_test \
    device/htc/zara/twrp.fstab:recovery/root/etc/twrp.fstab \
    device/htc/zara/rootdir/fstab.zara:recovery/root/fstab.zara

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_zara
PRODUCT_DEVICE := zara
