#!/bin/sh

BASE=../../../vendor/htc/enrc2b/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /system/$FILE $BASE/$FILE
    if [[ "$FILE" = "lib/hw/vendor-camera.tegra.so" && $? != 0 ]]; then
      echo "vendor-camera.tegra.so not found, looking for camera.tegra.so"
      adb pull /system/lib/hw/camera.tegra.so $BASE/lib/hw/vendor-camera.tegra.so
    fi
done

./setup-makefiles.sh

