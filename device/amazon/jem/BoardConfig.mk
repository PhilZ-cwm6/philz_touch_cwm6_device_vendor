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
TARGET_BOARD_OMAP_CPU := 4470

# inherit from common
-include device/amazon/bowser-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/amazon/jem/BoardConfigVendor.mk

# Kernel Build
TARGET_KERNEL_SOURCE := kernel/amazon/bowser-common
TARGET_KERNEL_CONFIG := jem_android_defconfig
BOARD_KERNEL_CMDLINE := mem=1G console=/dev/null rootdelay=2 init=/init androidboot.console=ttyO2 androidboot.hardware=bowser androidboot.selinux=permissive

# External SGX Module
SGX_MODULES:
	make clean -C $(COMMON_FOLDER)/pvr-source/eurasiacon/build/linux2/omap4430_android
	cp $(TARGET_KERNEL_SOURCE)/drivers/video/omap2/omapfb/omapfb.h $(KERNEL_OUT)/drivers/video/omap2/omapfb/omapfb.h
	make -j8 -C $(COMMON_FOLDER)/pvr-source/eurasiacon/build/linux2/omap4430_android ARCH=arm KERNEL_CROSS_COMPILE=arm-eabi- CROSS_COMPILE=arm-eabi- KERNELDIR=$(KERNEL_OUT) TARGET_PRODUCT="blaze_tablet" BUILD=release TARGET_SGX=544sc PLATFORM_VERSION=4.0
	mv $(KERNEL_OUT)/../../target/kbuild/pvrsrvkm_sgx544_112.ko $(KERNEL_MODULES_OUT)
	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/pvrsrvkm_sgx544_112.ko

TARGET_KERNEL_MODULES += SGX_MODULES

# OTA Packaging / Bootimg creation
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_FOLDER)/boot.mk

# Recovery/TWRP Config
TARGET_RECOVERY_FSTAB = $(DEVICE_FOLDER)/fstab.jem
RECOVERY_FSTAB_VERSION = 2
TARGET_RECOVERY_INITRC := $(DEVICE_FOLDER)/init.recovery.rc
TARGET_OTA_ASSERT_DEVICE := blaze_tablet,bowser,jem
DEVICE_RESOLUTION := 1920x1200
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_X := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/bowser/brightness
TW_IGNORE_DEVICE := MAX44007
