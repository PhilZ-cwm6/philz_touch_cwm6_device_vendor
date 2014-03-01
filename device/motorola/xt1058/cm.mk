# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Release name
PRODUCT_RELEASE_NAME := MOTO X
PRODUCT_NAME := cm_xt1058

$(call inherit-product, device/motorola/xt1058/full_xt1058.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_BRAND=motorola \
    PRODUCT_NAME=XT1058_gsm \
    BUILD_PRODUCT=ghost \
    BUILD_FINGERPRINT=motorola/XT1058_gsm/ghost:4.2.2/13.9.0Q2.X-116:user/release-keys
