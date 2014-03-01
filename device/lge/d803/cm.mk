## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/d803/d803.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d803
PRODUCT_NAME := cm_d803
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D803
PRODUCT_MANUFACTURER := lge


PRODUCT_PACKAGES += Torch
