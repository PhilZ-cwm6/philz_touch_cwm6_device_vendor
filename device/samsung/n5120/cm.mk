# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := n5120

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n5120/full_n5120.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n5120
PRODUCT_NAME := cm_n5120
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N5120
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N5120 TARGET_DEVICE=GT-N5120 BUILD_FINGERPRINT="samsung/konaltexx/konalte:4.2.2/JDQ39/N5120XXCMI1:user/release-keys" PRIVATE_BUILD_DESC="konaltexx-user 4.2.2 JDQ39 N5120XXCMI1 release-keys"
