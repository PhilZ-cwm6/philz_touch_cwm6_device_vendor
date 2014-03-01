# Copyright (C) 2013 The CyanogenMod Project
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

# inherit from the proprietary version
-include vendor/samsung/expressatt/BoardConfigVendor.mk

# inherit from common d2
-include device/samsung/d2lte/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG         := cyanogen_expressatt_defconfig
TARGET_KERNEL_VARIANT_CONFIG :=

# We are not a unified device :(
TARGET_UNIFIED_DEVICE :=
TARGET_INIT_VENDOR_LIB :=
TARGET_LIBINIT_DEFINES_FILE :=

# Asserts
TARGET_OTA_ASSERT_DEVICE := expressatt,expressziglteatt,SGH-I437,SGH-I437P
TARGET_BOARD_INFO_FILE ?= device/samsung/expressatt/board-info.txt

# Insert contents of file near end of updater-script
#TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./build/tools/releasetools/ota_from_target_files -e ./device/samsung/d2lte/apexq-common/installer_extra

# Wifi
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/prima_wlan.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/prima_wlan/parameters/fwpath"
WIFI_DRIVER_MODULE_NAME     := "prima_wlan"
WIFI_DRIVER_MODULE_ARG      :=
WIFI_DRIVER_MODULE_AP_ARG   :=
WIFI_DRIVER_FW_PATH_STA     := "sta"
WIFI_DRIVER_FW_PATH_AP      := "ap"
WIFI_DRIVER_FW_PATH_P2P     :=
BOARD_HAVE_SAMSUNG_WIFI     :=

# bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/expressatt/bluetooth
BOARD_BLUEDROID_VENDOR_CONF :=
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY :=
BOARD_HAVE_BLUETOOTH_BCM :=
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true

# sensors
BOARD_USE_LEGACY_SENSORS_FUSION := false

# Backlight notification
BOARD_USE_BLN := true

# Camera
TARGET_NEED_DISABLE_FACE_DETECTION_BOTH_CAMERAS := true
TARGET_NEED_DISABLE_AUTOFOCUS := true
# TARGET_NEED_PREVIEW_SIZE_FIXUP := true

