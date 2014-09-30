# Copyright (C) 2013 The Android Open Source Project
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

# inherit from common msm8960
-include device/htc/msm8960-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/t6-common/include

# Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01800000
TARGET_KERNEL_CONFIG := t6_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8960

# Audio
BOARD_USES_FLUENCE_INCALL := true  # use DMIC in call only
BOARD_USES_SEPERATED_AUDIO_INPUT := true  # use distinct voice recognition use case
BOARD_USES_SEPERATED_VOICE_SPEAKER := true  # use distinct voice speaker use case
BOARD_USES_SEPERATED_VOIP := true  # use distinct VOIP use cases
BOARD_AUDIO_AMPLIFIER := device/htc/t6-common/libaudioamp
BOARD_HAVE_HTC_CSDCLIENT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/t6-common/bluetooth

# Camera
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
USE_DEVICE_SPECIFIC_CAMERA := true

# Graphics
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE := false

# RIL
BOARD_PROVIDES_LIBRIL := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# We have the new GPS driver
BOARD_HAVE_NEW_QC_GPS := true

# Tuning
BOARD_HARDWARE_CLASS := device/htc/t6-common/cmhw

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
TARGET_USES_QCOM_WCNSS_QMI := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/wlan/parameters/fwpath"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2550136832
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26843545600
BOARD_FLASH_BLOCK_SIZE := 131072

# dev:        size     erasesize name
# mmcblk0p21: 000ffa00 00000200 "misc"
# mmcblk0p38: 00fffe00 00000200 "recovery"
# mmcblk0p37: 01000000 00000200 "boot"
# mmcblk0p39: 98000000 00000200 "system"
# mmcblk0p28: 00140200 00000200 "local"
# mmcblk0p41: 3ffffe00 00000200 "cache"
# mmcblk0p42: 640000000 00000200 "userdata"
# mmcblk0p24: 01400000 00000200 "devlog"
# mmcblk0p26: 00040000 00000200 "pdata"
# mmcblk0p29: 00010000 00000200 "extra"
# mmcblk0p34: 05000000 00000200 "radio"
# mmcblk0p16: 03c00400 00000200 "adsp"
# mmcblk0p15: 00100000 00000200 "dsps"
# mmcblk0p18: 00500000 00000200 "wcnss"
# mmcblk0p17: 007ffa00 00000200 "radio_config"
# mmcblk0p22: 00400000 00000200 "modem_st1"
# mmcblk0p23: 00400000 00000200 "modem_st2"
# mmcblk0p31: 00040000 00000200 "skylink"
# mmcblk0p32: 01900000 00000200 "carrier"
# mmcblk0p30: 00100000 00000200 "cdma_record"
# mmcblk0p20: 016ffc00 00000200 "reserve_1"
# mmcblk0p35: 02fffc00 00000200 "reserve_2"
# mmcblk0p36: 05fffc00 00000200 "reserve_3"
# mmcblk0p40: 03fffa00 00000200 "reserve_4"
# mmcblk0p33: 04729a00 00000200 "reserve"

# Custom Recovery
TARGET_RECOVERY_FSTAB := device/htc/t6-common/rootdir/etc/fstab.qcom
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_BLDRMSG_OFFSET := 2048

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# inherit from the proprietary version
-include vendor/htc/t6-common/BoardConfigVendor.mk
