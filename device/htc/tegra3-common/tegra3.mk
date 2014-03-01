#
# Copyright (C) 2013 Copyright
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/tegra3-common/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Prebuilt Alsa configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf

# Prebuilt Audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvcamera.conf:system/etc/nvcamera.conf \
    $(LOCAL_PATH)/configs/enctune.conf:system/etc/enctune.conf

# misc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/model_frontal.xml:system/etc/model_frontal.xml \
    $(LOCAL_PATH)/configs/nvram_4329.txt:system/etc/nvram_4329.txt \
    $(LOCAL_PATH)/configs/nvram_4330.txt:system/etc/nvram_4330.txt

# Input config files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl

# Common ramdisk files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.tegra3-common.rc:root/init.tegra3-common.rc

# Lights
PRODUCT_PACKAGES += \
    lights.tegra

# Camera wrapper
PRODUCT_PACKAGES += \
    camera.tegra

PRODUCT_PACKAGES += \
    hostapd_cli

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libtinyalsa \
    libaudioutils

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs


# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Other apps
PRODUCT_PACKAGES += \
    Torch \
    com.android.future.usb.accessory

# Video
PRODUCT_PACKAGES += \
    libstagefrighthw

# iw
PRODUCT_PACKAGES += \
    iw

# Configs
PRODUCT_COPY_FILES += \
    device/htc/tegra3-common/configs/egl.cfg:system/lib/egl/egl.cfg

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=HTCTegra3RIL

# don't preload OpenGL in Zygote, the Tegra drivers do not like it
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
