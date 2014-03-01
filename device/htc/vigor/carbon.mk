## Specify phone tech before including full_phone
$(call inherit-product, vendor/carbon/config/common_cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := vigor

# Inherit AOSP device configuration
$(call inherit-product, device/htc/vigor/vigor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common Carbon stuff.
$(call inherit-product, vendor/carbon/config/common_phone.mk)

PRODUCT_LOCALES := en_US

# Setup device specific product configuration.
PRODUCT_NAME := carbon_vigor
PRODUCT_BRAND := htc
PRODUCT_DEVICE := vigor
PRODUCT_MODEL := Rezound
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vigor BUILD_ID=JLS36C
