# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_FOLDER := device/amazon/jem
TARGET_BOOTLOADER_BOARD_SUBTYPE := jem

$(call inherit-product, device/amazon/bowser-common/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Rootfs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/fstab.jem:/root/fstab.bowser \
    $(DEVICE_FOLDER)/init.bowser.rc:root/init.bowser.rc \
    $(DEVICE_FOLDER)/init.bowser.usb.rc:root/init.bowser.usb.rc \
    $(DEVICE_FOLDER)/ueventd.bowser.rc:root/ueventd.bowser.rc

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Device settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.sf.hwrotation=90 \
    persist.hwc.mirroring.region=0:0:1920:1200 \
    persist.hwc.mirroring.transform=2 \
    persist.demo.hdmirotationlock=true \
    persist.lab126.chargeprotect=1 \
    persist.lab126.touchnoisereject=1 \
    ro.nf.profile=2 \
    ro.nf.level=512 \
    omap.audio.mic.main=AMic0 \
    omap.audio.mic.sub=AMic1 \
    omap.audio.power=PingPong \
    dolby.audio.sink.info=speaker \
    sys.usb.vid=1949 \
    sys.usb.pid=0008 \
    ro.cwm.forbid_format=/bootloader,/xloader,/misc \
    ro.camera.sound.forced=0 \
    ro.camera.video_size=1280x720

# Set dirty regions on and disable framework optimization
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=true \
    ro.hwui.disable_scissor_opt=true

# temperature sys fs node properties to be used by ThermalValidation/StressTest
PRODUCT_PROPERTY_OVERRIDES += \
    pcb.temp.sensor.sysfs.node=/sys/devices/platform/omap/omap_i2c.3/i2c-3/3-0070/temp1_input \
    batt.temp.sensor.sysfs.node=/sys/class/power_supply/bq27541/temp \
    cpu.temp.sensor.sysfs.node=/sys/devices/platform/omap/omap_temp_sensor.0/temp1_input \
    hotspot.temp.sensor.sysfs.node=/sys/class/thermal_sensor/thermal_sensor0/device/hotspot_temp \
    charge.current.sysfs.node=/sys/class/power_supply/smb347_usb/device/charge_current

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=384m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

$(call inherit-product-if-exists, vendor/amazon/jem/jem-vendor.mk)
$(call inherit-product-if-exists, vendor/amazon/omap4-common/omap4-common-vendor-544_112.mk)
