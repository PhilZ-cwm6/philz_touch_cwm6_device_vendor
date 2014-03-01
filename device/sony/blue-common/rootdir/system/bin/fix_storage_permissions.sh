#!/sbin/sh
# Fix permissions on internal sdcard
find /sdcard -user 1023 -exec chown 2800:2800 {} \;
