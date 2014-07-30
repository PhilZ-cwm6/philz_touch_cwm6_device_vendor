# Copyright (C) 2009 The CyanogenMod Project
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

# inherit from common msm8960
#-include device/samsung/msm8960-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/klte/include

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := klte

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE

# Architecture
TARGET_CPU_VARIANT := krait
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Kernel Configs
#TARGET_KERNEL_SOURCE := kernel/samsung/klte
#TARGET_KERNEL_CONFIG := msm8974_sec_defconfig
#TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig

TARGET_PREBUILT_KERNEL := device/samsung/klte/recovery/zImage-philz-v1

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --dt device/samsung/klte/recovery/dt.img --tags_offset 0x01e00000
#BOARD_KERNEL_SEPARATED_DT := true
#BOARD_CUSTOM_BOOTIMG_MK := device/samsung/klte/mkbootimg.mk

# Graphics
BOARD_EGL_CFG := device/samsung/klte/egl.cfg

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/samsung/klte/rootdir/etc/fstab.qcom

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651290624
BOARD_FLASH_BLOCK_SIZE := 131072

# Samsung's nonstandard csd-client
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true

# QCOM support
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_MEDIA_VARIANT := caf-new
TARGET_QCOM_DISPLAY_VARIANT := caf-new
BOARD_USES_LEGACY_ALSA_AUDIO := 
TARGET_QCOM_AUDIO_VARIANT := caf

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Assert
TARGET_OTA_ASSERT_DEVICE := kltexx,kltespr,kltetmo,SM-G900T,kltecan,klteatt,kltevzw,klte

# PowerHAL extension
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/klte/power/power_ext.c

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# The "new" GPS is really the old GPS, override it.
BOARD_HAVE_NEW_QC_GPS :=

# We don't use old-ass RPC
TARGET_NO_RPC := true

# Vendor Init
#TARGET_UNIFIED_DEVICE := true
#TARGET_INIT_VENDOR_LIB := libinit_msm
#TARGET_LIBINIT_DEFINES_FILE := device/samsung/klte/init/init_klte.c

TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/klte
