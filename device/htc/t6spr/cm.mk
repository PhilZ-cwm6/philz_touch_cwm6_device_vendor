$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/t6spr/full_t6spr.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=sprint_wwe BUILD_ID=KOT49H BUILD_FINGERPRINT="htc/sprint_wwe/t6whl:4.4.2/KOT49H/335898.5:user/release-keys" PRIVATE_BUILD_DESC="3.02.651.5 CL335898 release-keys"

PRODUCT_NAME := cm_t6spr
PRODUCT_DEVICE := t6spr
