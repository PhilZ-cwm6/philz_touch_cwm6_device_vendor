# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/sony/togari/full_togari.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6833 BUILD_FINGERPRINT=Sony/C6833/C6833:4.3/14.2.A.0.290/eng.hudsonslave:user/release-keys PRIVATE_BUILD_DESC="C6833-user 4.3 RHINE-1.1-131125-1201 eng.hudsonslave test-keys"

PRODUCT_NAME := cm_togari
PRODUCT_DEVICE := togari
