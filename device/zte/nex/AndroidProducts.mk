PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/zte_nex.mk

PRODUCT_COPY_FILES := \
    $(LOCAL_DIR)/rootdir/default.prop:root/default.prop \
    $(LOCAL_DIR)/rootdir/file_contexts:root/file_contexts \
    $(LOCAL_DIR)/rootdir/fstab.qcom:root/fstab.qcom \
    $(LOCAL_DIR)/rootdir/init:root/init \
    $(LOCAL_DIR)/rootdir/init.cm.rc:root/init.cm.rc \
    $(LOCAL_DIR)/rootdir/init.environ.rc:root/init.environ.rc \
    $(LOCAL_DIR)/rootdir/init.rc:root/init.rc \
    $(LOCAL_DIR)/rootdir/init.superuser.rc:root/init.superuser.rc \
    $(LOCAL_DIR)/rootdir/init.trace.rc:root/init.trace.rc \
    $(LOCAL_DIR)/rootdir/init.usb.rc:root/init.usb.rc \
    $(LOCAL_DIR)/rootdir/property_contexts:root/property_contexts \
    $(LOCAL_DIR)/rootdir/seapp_contexts:root/seapp_contexts \
    $(LOCAL_DIR)/rootdir/sepolicy:root/sepolicy

