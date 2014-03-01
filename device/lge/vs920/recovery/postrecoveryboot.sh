#!/sbin/sh

sleep 3

# This script is ran right after recovery is launched.
# also, launch this script if you're stuck in a bootloop!

# Zero out boot recovery and wipe data command
busybox dd if=/dev/zero bs=1 seek=7864320 count=84 conv=notrunc of=/dev/block/mmcblk0p25

