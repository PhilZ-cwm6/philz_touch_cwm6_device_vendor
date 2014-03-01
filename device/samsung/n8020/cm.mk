# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := n8020

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n8020/full_n8020.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n8020
PRODUCT_NAME := cm_n8020
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N8020
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=p4noteltexx TARGET_DEVICE=p4noteltexx BUILD_FINGERPRINT="samsung/p4noteltexx/p4notelte:4.1.2/JZO54K/N8020XXBMI3:user/release-keys" PRIVATE_BUILD_DESC="p4noteltexx-user 4.1.2 JZO54K N8020XXBMI3 release-keys"