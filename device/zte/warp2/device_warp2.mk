$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/cm/config/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/warp2/warp2-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/warp2/overlay

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Kernel Modules
$(call inherit-product-if-exists, $(LOCAL_PATH)/prebuilts/lib/modules/modules.mk)

## Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/root/init.warp2.rc:root/init.warp2.rc \
    $(LOCAL_PATH)/prebuilts/root/logo.bmp:root/logo.bmp \
    $(LOCAL_PATH)/prebuilts/root/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/prebuilts/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/prebuilts/root/init.qcom.usb.sh:root/init.qcom.usb.sh \
    $(LOCAL_PATH)/prebuilts/root/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/prebuilts/root/sbin/usbconfig:root/sbin/usbconfig \
    $(LOCAL_PATH)/prebuilts/root/ueventd.rc:root/ueventd.warp2.rc \
    $(LOCAL_PATH)/fstab.warp2:root/fstab.warp2

## Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/usbconfig:recovery/root/sbin/usbconfig \
    $(LOCAL_PATH)/recovery/rmt_storage_recovery:recovery/root/sbin/rmt_storage_recovery 

$(call inherit-product, build/target/product/full.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES+= dalvik.vm.execution-mode=int:jit \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=5000 \
    dalvik.vm.dexopt-flags=m=y,u=n,v=a,o=v \
    debug.enabletr=true \
    persist.sys.use_dithering=0 \
    ro.com.google.locationfeatures=1 \
    mobiledata.interfaces = wlan0,rmnet0 \
    ro.build.baseband_version=N861B01

# Provides overrides to configure the Dalvik heap for a standard tablet device.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m
    dalvik.vm.heapgrowthlimit=64m
    dalvik.vm.heapsize=256m

#LLVM for RenderScript
LLVM_ROOT_PATH := external/llvm

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

PRODUCT_PACKAGES += \
    applypatch \
    ast-mm-vdec-omx-test \
    com.android.future.usb.accessory \
    libdivxdrmdecrypt \
    libinvensense_hal \
    liblasic \
    liblinenoise \
    libmemalloc \
    libmllite \
    libmlplatform \
    libmmjpeg_interface \
    libmm-video \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidEnc \
    libOpenMAXAL \
    libOpenSLES \
    librs_jni \
    libmedia_jni \
    libstagefrighthw \
    mm-vdec-omx-property-mgr \
    mm-vdec-omx-test \
    mm-venc-omx-test \
    mm-venc-omx-test720p \
    mm-video-driver-test \
    mm-video-encdrv-test

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Display
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    liboverlay

## Bluetooth
PRODUCT_PACKAGES += \
    hciattach \
    hciconfig \
    hcitool \
    hdmid

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/prebuilts/etc/BCM4330B1_002.001.032.0518.0520.hcd:/system/etc/BCM4330.hcd

# Keychar, Keylayout, & touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    $(LOCAL_PATH)/prebuilts/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/warp2_keypad.kl:system/usr/keylayout/warp2_keypad.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/msm_tma300_ts.kl:system/usr/keylayout/msm_tma300_ts.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/syna-touchscreen.kl:system/usr/keylayout/syna-touchscreen.kl \
    $(LOCAL_PATH)/prebuilts/usr/idc/syna-touchscreen.idc:system/usr/idc/syna-touchscreen.idc

# APN
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/etc/apns-conf.xml:system/etc/apns-conf.xml	

# GPS
PRODUCT_PACKAGES += \
    gps.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/prebuilts/lib/libgps.so:system/lib/libgps.so \
    $(LOCAL_PATH)/prebuilts/lib/libloc_adapter.so:system/lib/libloc_adapter.so \
    $(LOCAL_PATH)/prebuilts/lib/libloc_api-rpc-qc.so:system/lib/libloc_api-rpc-qc.so \
    $(LOCAL_PATH)/prebuilts/lib/libloc_eng.so:system/lib/libloc_eng.so \
    $(LOCAL_PATH)/prebuilts/lib/libloc_ext.so:system/lib/libloc_ext.so

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    audio.a2dp.default \
    libaudioutils

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilts/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/prebuilts/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
    $(LOCAL_PATH)/prebuilts/lib/libaudioalsa.so:system/lib/libaudioalsa.so 

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x30 \
    libcamera

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/lib/liboemcamera.so:system/lib/liboemcamera.so \
    $(LOCAL_PATH)/prebuilts/lib/liboemcamera.so:obj/lib/liboemcamera.so

## liblights
PRODUCT_PACKAGES += \
    lights.msm7x30

## Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilts/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/prebuilts/etc/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
    $(LOCAL_PATH)/prebuilts/bin/hostapd:system/bin/hostapd \
    $(LOCAL_PATH)/prebuilts/bin/hostapd_cli:system/bin/hostapd_cli \
    $(LOCAL_PATH)/prebuilts/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.wlanprop.sh:system/etc/init.wlanprop.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    $(LOCAL_PATH)/prebuilts/etc/firmware/fw_bcmdhd.bin:system/etc/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/prebuilts/etc/firmware/fw_bcmdhd_apsta.bin:system/etc/firmware/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/prebuilts/etc/firmware/fw_bcmdhd_p2p.bin:system/etc/firmware/fw_bcmdhd_p2p.bin

PRODUCT_PACKAGES += \
    libwpa_client \
    libnetcmdiface

# Extra packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    Screenshot \
    Torch \
    Camera

## Media & Display Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/firmware/cyttsp_7630_fluid.hex:system/etc/firmware/cyttsp_7630_fluid.hex \
    $(LOCAL_PATH)/prebuilts/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    $(LOCAL_PATH)/prebuilts/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    $(LOCAL_PATH)/prebuilts/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    $(LOCAL_PATH)/prebuilts/lib/libC2D2.so:system/lib/libC2D2.so \
    $(LOCAL_PATH)/prebuilts/lib/libgsl.so:system/lib/libgsl.so \
    $(LOCAL_PATH)/prebuilts/lib/libOpenVG.so:system/lib/libOpenVG.so \
    $(LOCAL_PATH)/prebuilts/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilts/etc/media_codecs.xml:system/etc/media_codecs.xml

# iptables
PRODUCT_PACKAGES += \
    ip6tables \
    iptables

# extra stuff
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/bin/cnd:system/bin/cnd \
    $(LOCAL_PATH)/prebuilts/bin/akmd8962_new:system/bin/akmd8962_new \
    $(LOCAL_PATH)/prebuilts/bin/rmt_storage:system/bin/rmt_storage

# PhilZ
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/extra.fstab:recovery/root/etc/extra.fstab
    

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := full_warp2
PRODUCT_DEVICE := warp2
