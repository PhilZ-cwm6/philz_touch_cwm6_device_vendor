$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/m8/full_m8.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=KOT49H BUILD_FINGERPRINT="htc/htc_europe/htc_m8:4.4.2/KOT49H/325784.5:user/release-keys" PRIVATE_BUILD_DESC="1.54.401.5 CL325784 release-keys"

PRODUCT_NAME := cm_m8
PRODUCT_DEVICE := m8
