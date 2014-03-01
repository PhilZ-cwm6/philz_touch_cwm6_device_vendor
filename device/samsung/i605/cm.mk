# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := i605

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/i605/full_i605.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := i605
PRODUCT_NAME := cm_i605
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SCH-I605
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-verizon

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t0ltevzw TARGET_DEVICE=t0ltevzw BUILD_FINGERPRINT="Verizon/t0ltevzw/t0ltevzw:4.3/JSS15J/I605VRUEMJ9:user/release-keys" PRIVATE_BUILD_DESC="t0ltevzw-user 4.3 JSS15J I605VRUEMJ9 release-keys"

