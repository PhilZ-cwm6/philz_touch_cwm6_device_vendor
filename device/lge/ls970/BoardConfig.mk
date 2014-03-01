#
# Copyright (C) 2011 The Android Open-Source Project
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

BOARD_KERNEL_CMDLINE := vmalloc=600M console=null lpj=67677 user_debug=31 msm_rtb.filter=0x0 ehci-hcd.park=3 coresight-etm.boot_enable=0 androidboot.hardware=ls970
TARGET_KERNEL_CONFIG := cyanogenmod_e975_defconfig

# Recovery
TARGET_RECOVERY_FSTAB := device/lge/ls970/ramdisk/fstab.ls970
RECOVERY_FSTAB_VERSION := 2

# inherit from ls970-common
-include device/lge/ls970-common/BoardConfigCommon.mk

# assert
TARGET_OTA_ASSERT_DEVICE := geebus,geebusc,geehrc,geehrc4g,gee_sp,geehrc_sp,geehrc4g_spr_us,ls970,jeebus,jeebusc

# board-info
TARGET_BOARD_INFO_FILE := device/lge/ls970/board-info.txt

# inherit from the proprietary version
-include vendor/lge/e975/BoardConfigVendor.mk
