#inherit from the common blue definitions
include device/sony/blue-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/mint/include

TARGET_KERNEL_CONFIG := cm_blue_mint_defconfig

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 18

# the following two sizes are generous guesses
# since these partitions are not visible
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/mint/bluetooth

TARGET_LS_USE_ALS_NODE := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_OTA_ASSERT_DEVICE := LT30p,mint

BOARD_HARDWARE_CLASS := device/sony/mint/cmhw

# inherit from the proprietary version
-include vendor/sony/mint/BoardConfigVendor.mk
