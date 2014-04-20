$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/m8vzw/full_m8vzw.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=KOT49H BUILD_FINGERPRINT="htc/HTCOneM8vzw/htc_m8wl:4.4.2/KOT49H/315044.11:user/release-keys" PRIVATE_BUILD_DESC="1.12.605.11 CL315044 release-keys"

PRODUCT_NAME := cm_m8vzw
PRODUCT_DEVICE := m8vzw
