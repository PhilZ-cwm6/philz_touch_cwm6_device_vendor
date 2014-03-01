$(call inherit-product, device/htc/m7tmo/full_m7tmo.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m7 BUILD_ID=JZO54K BUILD_FINGERPRINT="tmous/m7/m7:4.1.2/JZO54K/170484.7:user/release-keys" PRIVATE_BUILD_DESC="1.27.531.7 CL170484 release-keys"

PRODUCT_NAME := cm_m7tmo
PRODUCT_DEVICE := m7tmo
