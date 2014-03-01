# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Release name
PRODUCT_RELEASE_NAME := DROID RAZR HD
PRODUCT_NAME := cm_xt926

$(call inherit-product, device/motorola/xt926/full_xt926.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_BRAND=motorola \
    PRODUCT_NAME=XT926_verizon \
    BUILD_PRODUCT=vanquish \
    BUILD_FINGERPRINT=motorola/XT926_verizon/vanquish:4.1.2/9.8.1Q-62_VQW_MR-2/6:user/release-keys
