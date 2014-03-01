#
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
-include device/samsung/smdk4412-common/BoardCommonConfig.mk

# Kernel
BOARD_KERNEL_BASE := 0x10000000

# Filesystem
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2235564032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12813598720

# Graphics
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := false

# Recovery
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
BOARD_RECOVERY_SWIPE := true

# Sensors
BOARD_USE_LEGACY_SENSORS_FUSION := false

# Legacy driver compatibility
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Button backlight
BOARD_EXYNOS4X12_TABLET_HAS_LED_BUTTONS := true

# inherit from the proprietary version
-include vendor/samsung/lt01-common/BoardConfigVendor.mk

# Selinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/lt01-common/selinux

BOARD_SEPOLICY_UNION += \
    file_contexts \
    te_macros \
    device.te \
    dhcp.te \
    domain.te \
    file.te \
    init.te \
    kickstart.te \
    mediaserver.te \
    netmgrd.te \
    qmux.te \
    rild.te \
    secril.te \
    system.te \
    ueventd.te \
    wpa_supplicant.te
