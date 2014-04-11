$(call inherit-product, device/samsung/klte/full_klte.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=KOT49H BUILD_FINGERPRINT="samsung/kltexx/klte:4.4.2/KOT49H/G900FXXU1ANCB:user/release-keys" PRIVATE_BUILD_DESC="kltexx-user 4.4.2 KOT49H G900FXXU1ANCB release-keys"

PRODUCT_DEVICE := klte
PRODUCT_NAME := cm_klte
