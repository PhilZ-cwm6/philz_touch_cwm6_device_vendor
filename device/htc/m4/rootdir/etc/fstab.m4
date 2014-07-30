# Android fstab file.
#<src>						<mnt_point>	<type>	<mnt_flags>						<fs_mgr_flags>
# The filesystem that contains the filesystem checker binary (typically /system) cannot
# specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK

/dev/block/platform/msm_sdcc.1/by-name/radio	/firmware_radio vfat    ro,shortname=lower                                      wait
/dev/block/platform/msm_sdcc.1/by-name/adsp	/firmware_q6    vfat    ro,shortname=lower                                      wait

/dev/block/platform/msm_sdcc.1/by-name/boot	/boot		emmc	defaults						defaults
/dev/block/platform/msm_sdcc.1/by-name/recovery	/recovery	emmc	defaults						defaults
/dev/block/platform/msm_sdcc.1/by-name/devlog	/devlog         ext4    noatime,nosuid,nodev,noauto_da_alloc,barrier=0          wait
/dev/block/platform/msm_sdcc.1/by-name/system	/system		ext4	ro,noatime,barrier=0					wait
/dev/block/platform/msm_sdcc.1/by-name/cache	/cache		ext4	nosuid,nodev,noatime,barrier=0				wait,check
/dev/block/platform/msm_sdcc.1/by-name/userdata	/data		ext4	noatime,nosuid,nodev,noauto_da_alloc,barrier=0		wait,check,encryptable=/dev/block/platform/msm_sdcc.1/by-name/extra

# USB Storage
/devices/platform/msm_hsusb_host/usb		auto		auto	defaults						voldmanaged=usbdisk:auto
