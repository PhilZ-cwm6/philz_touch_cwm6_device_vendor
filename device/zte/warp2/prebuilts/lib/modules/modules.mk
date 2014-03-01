# Kernel modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    $(LOCAL_PATH)/bluetooth-power.ko:system/lib/modules/bluetooth-power.ko \
    $(LOCAL_PATH)/cls_flow.ko:system/lib/modules/cis_flow.ko \
    $(LOCAL_PATH)/cpaccess.ko:system/lib/modules/cpaccess.ko \
    $(LOCAL_PATH)/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
    $(LOCAL_PATH)/dma_test.ko:system/lib/modules/dma_test.ko \
    $(LOCAL_PATH)/evbug.ko:system/lib/modules/evobug.ko \
    $(LOCAL_PATH)/librasdioif.ko:system/lib/modules/librasdioif.ko \
    $(LOCAL_PATH)/mtd_erasepart.ko:system/lib/modules/mtd_erasepart.ko \
    $(LOCAL_PATH)/mtd_nandecctest.ko:system/lib/modules/mtd_nandecctest.ko \
    $(LOCAL_PATH)/mtd_oobtest.ko:system/lib/modules/mtd_obbtest.ko \
    $(LOCAL_PATH)/mtd_pagetest.ko:system/lib/modules/mtd_pagetest.ko \
    $(LOCAL_PATH)/mtd_readtest.ko:system/lib/modules/mtd_readtest.ko \
    $(LOCAL_PATH)/mtd_speedtest.ko:system/lib/modules/mtd_speedtest.ko \
    $(LOCAL_PATH)/mtd_stresstest.ko:system/lib/modules/mtd_stresstest.ko \
    $(LOCAL_PATH)/mtd_subpagetest.ko:system/lib/modules/mtd_subpagetest.ko \
    $(LOCAL_PATH)/mtd_torturetest.ko:system/lib/modules/mtd_torturetest.ko \
    $(LOCAL_PATH)/oprofile.ko:system/lib/modules/oprofile.ko \
    $(LOCAL_PATH)/qce.ko:system/lib/modules/qce.ko \
    $(LOCAL_PATH)/qcedev.ko:system/lib/modules/qcedev.ko \
    $(LOCAL_PATH)/qcrypto.ko:system/lib/modules/qcrypto.ko \
    $(LOCAL_PATH)/reset_modem.ko:system/lib/modules/reset_modem.ko \
    $(LOCAL_PATH)/sch_dsmark.ko:system/lib/modules/sch_dsmark.ko \
    $(LOCAL_PATH)/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko
