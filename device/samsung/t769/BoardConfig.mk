# Copyright (C) 2012 The CyanogenMod Project
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
-include vendor/samsung/t769/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := MSM8660_SURF

# Assert
TARGET_OTA_ASSERT_DEVICE := SGH-T769,T769,sgh-t769,t769,Blaze4G,Blaze4g,blaze4G,blaze4g

# Kernel
TARGET_KERNEL_CONFIG        := cyanogenmod_t769_defconfig
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8660-common

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p22: 00A00000 00000200 "recovery"
#mmcblk0p8: 00A00000 00000200 "boot"
#mmcblk0p24: 22535000 00000200 "system"
#mmcblk0p26: 12E00000 00000200 "cache"
#mmcblk0p25: 48A00000 00000200 "userdata"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 575885312
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1218445312
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/t769/bluetooth

BOARD_NEEDS_MEMORYHEAPPMEM := true
