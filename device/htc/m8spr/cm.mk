$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/m8spr/full_m8spr.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=KOT49H BUILD_FINGERPRINT="htc/sprint_wwe/htc_m8whl:4.4.2/KOT49H/318427.17:user/release-keys" PRIVATE_BUILD_DESC="1.12.651.17 CL318427 release-keys"

PRODUCT_NAME := cm_m8spr
PRODUCT_DEVICE := m8spr
