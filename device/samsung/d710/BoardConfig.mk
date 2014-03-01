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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
-include device/samsung/galaxys2-common/BoardCommonConfig.mk

TARGET_BOARD_INFO_FILE := device/samsung/d710/board-info.txt

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/d710/bluetooth

# Kernel Config
TARGET_KERNEL_SOURCE := kernel/samsung/smdk4412
TARGET_KERNEL_CONFIG := cyanogenmod_d710_defconfig

# Selinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/d710/selinux

BOARD_SEPOLICY_UNION += \
    device.te \
    file.te \
    file_contexts \
    mediaserver.te \
    system.te \
    wimax.te

# Notification LED
BOARD_HAS_LED_NOTIF := true

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MOBILEDATA_INTERFACE_NAME := "ppp0"

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/d710/recovery/recovery_keys.c
BOARD_UMS_LUNFILE := "/sys/devices/platform/s3c-usbgadget/gadget/lun%d/file"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"
TARGET_RECOVERY_FSTAB := device/samsung/d710/rootdir/fstab.smdk4210

# assert
TARGET_OTA_ASSERT_DEVICE := epic4gtouch,SPH-D710,d710,smdk4210,SPH-D710VMUB,SPH-D710BST

# Use the non-open-source parts, if they're present
-include vendor/samsung/d710/BoardConfigVendor.mk

BOARD_CUSTOM_BOOTIMG_MK := device/samsung/d710/shbootimg.mk
