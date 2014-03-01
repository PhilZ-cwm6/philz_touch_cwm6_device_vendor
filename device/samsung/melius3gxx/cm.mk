$(call inherit-product, device/samsung/melius3gxx/full_melius3gxx.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=melius3gxx TARGET_DEVICE=melius3g BUILD_FINGERPRINT="samsung/melius3gxx/melius3g:4.2.2/JDQ39/I9200XXUAMEA:user/release-keys" PRIVATE_BUILD_DESC="melius3gxx-user 4.2.2 JDQ39 I9200XXUAMEA release-keys"

PRODUCT_DEVICE := melius3gxx
PRODUCT_NAME := cm_melius3gxx
