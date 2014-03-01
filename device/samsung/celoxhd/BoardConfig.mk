# Copyright (C) 2009 The Android Open Source Project
#
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common celox
-include device/samsung/celox-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/celoxhd/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := celoxhd

# Assert
TARGET_OTA_ASSERT_DEVICE := SGH-I757M,SGH-I757,celoxhd,SGHI757M,SGHI757

# Kernel
#BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom msm_watchdog.appsbark=0 msm_watchdog.enable=1 loglevel=4 androidboot.selinux=permissive
BOARD_KERNEL_BASE           := 0x48000000
TARGET_PREBUILT_KERNEL      := device/samsung/celoxhd/kernel/zImage

KERNEL_EXTERNAL_MODULES:
	cp device/samsung/celoxhd/kernel/modules/*.ko $(KERNEL_MODULES_OUT)
TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES

# Assert minimum baseband version
TARGET_BOARD_INFO_FILE ?= device/samsung/celoxhd/board-info.txt

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044333056
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/celoxhd/bluetooth
