$(call inherit-product, device/samsung/lt03wifiue/full_lt03wifiue.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_lt03wifiue
PRODUCT_DEVICE := lt03wifiue

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-P600 \
    PRODUCT_NAME=lt03wifiue \
    PRODUCT_DEVICE=lt03wifiue \
    BUILD_FINGERPRINT="samsung/lt03wifiue/lt03wifiue:4.3/JSS15J/P600UEUAMJ4:user/release-keys" \
    PRIVATE_BUILD_DESC="lt03wifiue-user 4.3 JSS15J P600UEUAMJ4 release-keys"
