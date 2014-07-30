# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := l900

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/l900/full_l900.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := l900
PRODUCT_NAME := cm_l900
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SPH-L900
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t0ltespr TARGET_DEVICE=t0ltespr BUILD_FINGERPRINT="samsung/t0ltespr/t0ltespr:4.4.2/KOT49H/L900VPUCNE2:user/release-keys" PRIVATE_BUILD_DESC="t0ltespr-user 4.4.2 KOT49H L900VPUCNE2 release-keys"
