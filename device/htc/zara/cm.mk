## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := zara

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/zara/device_zara.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := zara
PRODUCT_NAME := cm_zara
PRODUCT_BRAND := htc
PRODUCT_MODEL := zara
PRODUCT_MANUFACTURER := htc
