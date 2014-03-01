philz_touch_cwm6_device_vendor
==============================


Changes you must do before using device trees:

extra.fstab support: You must add in device.mk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/extra.fstab:recovery/root/etc/extra.fstab


Custom init.rc for recovery: these are the "ini.philz*.rc" files in rootdir/etc
you must add a flag in BoardConfig.mk:
TARGET_RECOVERY_INITRC := vendor/samsung/common_init/init.philz*.rc


I did not add them because I just patched build/core/Makefile to auto copy them when they are present
It avoids stitching my changes to device tree when I sync to upstream
