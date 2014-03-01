$(call inherit-product, device/lge/iprj-common/iprj.mk)

$(call inherit-product-if-exists, vendor/lge/vs920/vs920-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/vs920/overlay

## These are different between models
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(LOCAL_PATH)/fstab.iprj:root/fstab.iprj

## Model specific files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.iprj.rc:root/init.iprj.rc

## LTE on CDMA
PRODUCT_PACKAGES += \
    Stk

PRODUCT_NAME := full_vs920
PRODUCT_DEVICE := vs920
PRODUCT_MODEL := VS920 4G
PRODUCT_BRAND := Verizon
