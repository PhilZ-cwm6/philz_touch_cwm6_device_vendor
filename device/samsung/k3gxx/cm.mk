$(call inherit-product, device/samsung/k3gxx/full_k3gxx.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_k3gxx
PRODUCT_DEVICE := k3gxx

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-G900H \
    PRODUCT_NAME=k3gxx \
    PRODUCT_DEVICE=k3g \
    BUILD_FINGERPRINT="samsung/k3gxx/k3g:4.4.2/KOT49H/G900HXXU1ANCI:user/release-keys" \
    PRIVATE_BUILD_DESC="k3gxx-user 4.4.2 KOT49H G900HXXU1ANCI release-keys"
