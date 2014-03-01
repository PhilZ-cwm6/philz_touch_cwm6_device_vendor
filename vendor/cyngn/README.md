This repository contains a stub APK with no code with the
sharedUserId="com.cyanogenmod.uid.cms". This APK is signed with a private key
and holds the uid from being used by other rogue apps.

This, in conjunction with /system/etc/permissions/cms.xml and the change
http://review.cyanogenmod.org/#/c/55332/ allows CyanogenMod apps that require
extra permissions to be installed via Google Play. Google Play does not
allow distribution of apps with "well known" keys such as the default
test or platform key found in the Android build system.
