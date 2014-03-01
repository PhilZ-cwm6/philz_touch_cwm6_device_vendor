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

# Include p4notelte BoardConfigCommon
-include device/samsung/p4notelte-common/BoardConfigCommon.mk

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/samsung/smdk4412
TARGET_KERNEL_CONFIG := cyanogenmod_i925_defconfig

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/n8020/rootdir/fstab.smdk4x12
RECOVERY_FSTAB_VERSION := 2
BOARD_RECOVERY_SWIPE := true

# assert
TARGET_OTA_ASSERT_DEVICE := p4notelte,p4noteltexx,n8020,GT-N8020
