$(call inherit-product, device/samsung/expressatt/full_expressatt.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=expressuc TARGET_DEVICE=expressatt BUILD_FINGERPRINT="samsung/expressuc/expressatt:4.1.2/JZO54K/I437UCDMG3:user/release-keys" PRIVATE_BUILD_DESC="expressuc-user 4.1.2 JZO54K I437UCDMG3 release-keys"

PRODUCT_NAME := cm_expressatt
PRODUCT_DEVICE := expressatt

