## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 768

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/e973/full_e973.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := e973
PRODUCT_NAME := cm_e973
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-E973
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=google/occam/GEEB_CA:4.2.2/JDQ39/573038:user/release-keys PRIVATE_BUILD_DESC="gee-user 4.2.2 JDQ39 573038 release-keys"
