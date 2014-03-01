$(call inherit-product, device/samsung/serranodsub/full_serranodsub.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=serranodsub TARGET_DEVICE=serranods BUILD_FINGERPRINT="samsung/serranodsub/serranods:4.2.2/JDQ39/I9192UBUAMH2:user/release-keys" PRIVATE_BUILD_DESC="serranodsub-user 4.2.2 JDQ39 I9192UBUAMH2 release-keys"

PRODUCT_DEVICE := serranodsub
PRODUCT_NAME := cm_serranodsub
