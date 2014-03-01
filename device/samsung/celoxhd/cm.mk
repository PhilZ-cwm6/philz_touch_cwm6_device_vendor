$(call inherit-product, device/samsung/celoxhd/full_celoxhd.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I757M TARGET_DEVICE=SGH-I757M BUILD_FINGERPRINT="samsung/SGH-I757M/SGH-I757M:4.4.2/KOT49H/UGMC5:user/release-keys" PRIVATE_BUILD_DESC="SGH-I757M-user 4.4.2 KOT49H UGMC5 release-keys"

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_NAME := cm_celoxhd
PRODUCT_DEVICE := celoxhd

