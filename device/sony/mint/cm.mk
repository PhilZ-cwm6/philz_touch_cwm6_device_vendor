$(call inherit-product, device/sony/mint/full_mint.mk)

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT30p BUILD_FINGERPRINT=Sony/LT30p/LT30p:4.3/9.2.A.1.205/Mvv_tg:user/release-keys PRIVATE_BUILD_DESC="LT30p-user 4.3 JB-MR2-BLUE-140313-0947 257 test-keys"

PRODUCT_NAME := cm_mint
PRODUCT_DEVICE := mint
