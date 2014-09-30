$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/t6vzw/full_t6vzw.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=HTCOneMaxVZW BUILD_ID=KOT49H BUILD_FINGERPRINT="VERIZON/HTCOneMaxVZW/t6wl:4.4.2/KOT49H/333209.2:user/release-keys" PRIVATE_BUILD_DESC="3.09.605.2 CL333209 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon

PRODUCT_NAME := cm_t6vzw
PRODUCT_DEVICE := t6vzw
