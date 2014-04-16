# Android fstab file.
#<src>			<mnt_point>	<type>	<mnt_flags>						<fs_mgr_flags>
# The filesystem that contains the filesystem checker binary (typically /system) cannot
# specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK

#/dev/block/mmcblk0p15  /firmware_dsps  vfat    ro,shortname=lower                                      wait
/dev/block/mmcblk0p16   /firmware_radio vfat    ro,shortname=lower                                      wait
/dev/block/mmcblk0p17   /firmware_q6    vfat    ro,shortname=lower                                      wait
#/dev/block/mmcblk0p18  /firmware_wcnss vfat    ro,shortname=lower                                      wait

/dev/block/mmcblk0p31	/boot		emmc	defaults						defaults
/dev/block/mmcblk0p32	/recovery	emmc	defaults						defaults
/dev/block/mmcblk0p24   /devlog         ext4    noatime,nosuid,nodev,noauto_da_alloc,barrier=0          wait
/dev/block/mmcblk0p33	/system		ext4	ro,noatime,barrier=0					wait
/dev/block/mmcblk0p34	/cache		ext4	nosuid,nodev,noatime,barrier=0				wait,check
/dev/block/mmcblk0p35	/data		ext4	noatime,nosuid,nodev,noauto_da_alloc,barrier=0,discard	wait,check,encryptable=/dev/block/mmcblk0p29

# USB Storage
/devices/platform/msm_hsusb_host/usb	auto	auto	defaults	voldmanaged=usbdisk:auto
