## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := nex

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/nex/device_nex.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nex
PRODUCT_NAME := zte_nex
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Awe
PRODUCT_MANUFACTURER := zte
