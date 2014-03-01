#
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
-include device/samsung/smdk4412-common/BoardCommonConfig.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/n80xx-common/include

# Exynos4x12 Tablet
BOARD_EXYNOS4X12_TABLET := true

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6262

# Camera
BOARD_USES_PROPRIETARY_LIBCAMERA := true

# Filesystem
BOARD_NAND_PAGE_SIZE := 2048
BOARD_NAND_SPARE_SIZE := 128
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1468006400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12821987328
BOARD_FLASH_BLOCK_SIZE := 2048
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
# inherit from the proprietary version
-include vendor/samsung/n80xx-common/BoardConfigVendor.mk
