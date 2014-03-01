#!/sbin/sh

if [ ! -d "/sdcard/EFS_BACKUPS" ]; then
mkdir /sdcard/EFS_BACKUPS
fi
#Backup m9kefs1
if [ ! -f "/sdcard/EFS_BACKUPS/m9kefs1-backup.img" ]; then
dd if=/dev/block/platform/msm_sdcc.1/by-name/m9kefs1 of=/sdcard/EFS_BACKUPS/m9kefs1-backup.img
fi
#Backup m9kefs2
if [ ! -f "/sdcard/EFS_BACKUPS/m9kefs2-backup.img" ]; then
dd if=/dev/block/platform/msm_sdcc.1/by-name/m9kefs2 of=/sdcard/EFS_BACKUPS/m9kefs2-backup.img
fi
#Backup m9kefs3
if [ ! -f "/sdcard/EFS_BACKUPS/m9kefs3-backup.img" ]; then
dd if=/dev/block/platform/msm_sdcc.1/by-name/m9kefs3 of=/sdcard/EFS_BACKUPS/m9kefs3-backup.img
fi

