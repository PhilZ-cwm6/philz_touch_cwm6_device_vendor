$(call inherit-product, device/samsung/lt03wifi/full_lt03wifi.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_lt03wifi
PRODUCT_DEVICE := lt03wifi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-P600 \
    PRODUCT_NAME=lt03wifixx \
    PRODUCT_DEVICE=lt03wifi \
    BUILD_FINGERPRINT="samsung/lt03wifixx/lt03wifi:4.3/JSS15J/P600XXUBMJ6:user/release-keys" \
    PRIVATE_BUILD_DESC="lt03wifixx-user 4.3 JSS15J P600XXUBMJ6 release-keys"
