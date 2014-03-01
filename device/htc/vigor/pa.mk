$(call inherit-product, vendor/pa/config/cdma.mk)
$(call inherit-product, device/htc/vigor/vigor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Device naming
PRODUCT_NAME := pa_vigor
PRODUCT_BRAND := htc
PRODUCT_DEVICE := vigor
PRODUCT_MODEL := ADR6425LVW
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vigor BUILD_ID=IML74K BUILD_FINGERPRINT="verizon_wwe/htc_vigor/vigor:4.0.3/IML74K/570011.14:user/release-keys" PRIVATE_BUILD_DESC="4.05.605.14 CL570011 release-keys"

