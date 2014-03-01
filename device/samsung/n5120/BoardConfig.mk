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
-include device/samsung/kona-common/BoardConfigCommon.mk
-include device/samsung/smdk4412-qcom-common/BoardCommonConfig.mk

LOCAL_PATH := device/samsung/n5120

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/samsung/smdk4412
TARGET_KERNEL_CONFIG := cyanogenmod_n5120_defconfig

# RIL
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{ "ril.ks.status", AID_SYSTEM, 0 },'

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/n5120/rootdir/fstab.smdk4x12
RECOVERY_FSTAB_VERSION := 2
BOARD_RECOVERY_SWIPE := true
BOARD_RECOVERY_SWIPE_SWAPXY := true

# inherit from the proprietary version
-include vendor/samsung/n5120/BoardConfigVendor.mk

# assert
TARGET_OTA_ASSERT_DEVICE := konawifi,konaltexx,n5120,GT-N5120,konalte
