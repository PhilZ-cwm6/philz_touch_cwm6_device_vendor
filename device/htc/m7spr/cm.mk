$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/m7spr/full_m7spr.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=sprint_wwe \
    BUILD_ID=KOT49H \
    BUILD_FINGERPRINT="htc/sprint_wwe/m7wls:4.4.2/KOT49H/303687.4:user/release-keys" \
    PRIVATE_BUILD_DESC="4.06.651.4 CL303687 release-keys"

PRODUCT_NAME := cm_m7spr
PRODUCT_DEVICE := m7spr
