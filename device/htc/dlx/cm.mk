# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Release name
PRODUCT_RELEASE_NAME := dlx

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/dlx/full_dlx.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := dlx
PRODUCT_NAME := cm_dlx
PRODUCT_BRAND := Verizon
PRODUCT_MODEL := HTC6435LVW
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=dlx \
    BUILD_ID=JDQ39 \
    BUILD_FINGERPRINT=htc/verizon_wwe/dlx:4.2.2/JDQ39/277065.4:user/release-keys \
    PRIVATE_BUILD_DESC="3.06.605.4 CL277065 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon
