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

# inherit from tegra3-common
-include device/htc/tegra3-common/BoardConfigCommon.mk

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/firmware/fw_bcm4334_p2p.bin"

# BT
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/htc/enrc2b/bluetooth/vnd_enrc2b.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/htc/enrc2b/bluetooth

# HTC ril compatability
TARGET_PROVIDES_LIBRIL := device/htc/enrc2b/proprietary/lib/libhtc-ril.so

# Kernel / Ramdisk
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896 
BOARD_FLASH_BLOCK_SIZE := 131072

# Boot/Recovery image settings
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/htc/enrc2b
TARGET_KERNEL_CONFIG := cyanogenmod_enrc2b_defconfig

# dont build docs
DISABLE_DROIDDOC := true

# Recovery
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/enrc2b/recovery/recovery_kernel
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/htc/enrc2b/ramdisk/fstab.enrc2b
RECOVERY_FSTAB_VERSION := 2 

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
