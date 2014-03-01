$(call inherit-product, device/samsung/t769/full_t769.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-T769 TARGET_DEVICE=SGH-T769 BUILD_FINGERPRINT="samsung/SGH-T769/SGH-T769:4.1.2/JZO54K/UVLH5:user/release-keys" PRIVATE_BUILD_DESC="SGH-T769-user 4.1.2 JZO54K UVLH5 release-keys"

TARGET_BOOTANIMATION_NAME := 480

PRODUCT_NAME := cm_t769
PRODUCT_DEVICE := t769
