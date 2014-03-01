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

include device/lge/gproj-common/BoardConfigCommon.mk

#Include our own header for camera hal
TARGET_SPECIFIC_HEADER_PATH := device/lge/ls970-common/include

BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_BOOTLOADER_BOARD_NAME := geehrc
TARGET_BOOTLOADER_NAME=ls970

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/ls970-common/bluetooth

# FIXME: HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_UI_LIB := librecovery_ui_$(PRODUCT_DEVICE)
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

#Preload Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true

TARGET_RELEASETOOLS_EXTENSIONS := device/lge/ls970-common

-include vendor/lge/e975/BoardConfigVendor.mk

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_SEPOLICY_DIRS += \
        device/lge/ls970-common/sepolicy

BOARD_SEPOLICY_UNION := \
        app.te \
        bluetooth.te \
        device.te \
        domain.te \
        drmserver.te \
        file.te \
        file_contexts \
        hci_init.te \
        init_shell.te \
        keystore.te \
        mediaserver.te \
        kickstart.te \
        nfc.te \
        rild.te \
        surfaceflinger.te \
        system.te \
        ueventd.te \
        wpa.te
