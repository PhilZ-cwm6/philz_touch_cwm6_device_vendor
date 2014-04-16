$(call inherit-product, device/samsung/lt03ltexx/full_lt03ltexx.mk)

PRODUCT_NAME := cm_lt03ltexx
PRODUCT_DEVICE := lt03ltexx

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-P605 \
    PRODUCT_NAME=lt03ltexx \
    PRODUCT_DEVICE=lt03lte \
    BUILD_FINGERPRINT="samsung/lt03ltexx/lt03lte:4.3/JSS15J/P605XXUBMJ9:user/release-keys" \
    PRIVATE_BUILD_DESC="lt03ltexx-user 4.3 JSS15J P605XXUBMJ9 release-keys"
