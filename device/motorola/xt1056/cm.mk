# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Release name
PRODUCT_RELEASE_NAME := MOTO X - XT1056
PRODUCT_NAME := cm_xt1056

$(call inherit-product, device/motorola/xt1056/full_xt1056.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_BRAND=motorola \
    PRODUCT_NAME=XT1056 \
    BUILD_PRODUCT=ghost_sprint \
    BUILD_FINGERPRINT=motorola/ghost_sprint/ghost:4.2.2/13.9.0Q2.X-116-MX-17-6-2/11:user/release-keys
