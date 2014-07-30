#!/bin/sh

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

VENDOR=samsung
COMMON=omap4-common
COMMONOUTDIR=vendor/$VENDOR/$COMMON
COMMONBASE=../../../$COMMONOUTDIR/proprietary
COMMONMAKEFILE=../../../$COMMONOUTDIR/common-vendor-blobs.mk
COMMONPROPS=../$COMMON/proprietary-files.txt

mkdir -p ../../../vendor/$VENDOR/$COMMON/proprietary

adb root
adb wait-for-device

echo "Pulling common files..."
for FILE in `cat $COMMONPROPS | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $COMMONBASE/$DIR ]; then
        mkdir -p $COMMONBASE/$DIR
    fi
    adb pull /$FILE $COMMONBASE/$FILE
done


(cat << EOF) | sed s/__COMMON__/$COMMON/g | sed s/__VENDOR__/$VENDOR/g > $COMMONMAKEFILE
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

LOCAL_PATH := vendor/samsung/__COMMON__

PRODUCT_COPY_FILES += \\
EOF

LINEEND=" \\"
COUNT=`cat $COMMONPROPS | grep -v ^# | grep -v ^$ | wc -l | awk {'print $1'}`
for FILE in `cat $COMMONPROPS | grep -v ^# | grep -v ^$`; do
    COUNT=`expr $COUNT - 1`
    if [ $COUNT = "0" ]; then
        LINEEND=""
    fi
    echo "    \$(LOCAL_PATH)/proprietary/$FILE:$FILE$LINEEND" >> $COMMONMAKEFILE
done

(cat << EOF) | sed s/__COMMON__/$COMMON/g | sed s/__VENDOR__/$VENDOR/g > $COMMONBASE/Android.mk
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifneq (\$(filter i9100g p3100 p3110 p5100 p5110,\$(TARGET_DEVICE)),)

LOCAL_PATH := \$(call my-dir)

# Creating Gralloc SymLink
GRALLOC_SYMLINK := \$(TARGET_OUT_VENDOR)/lib/hw/gralloc.\$(TARGET_BOARD_PLATFORM).so
\$(GRALLOC_SYMLINK): GRALLOC_FILE := gralloc.omap\$(TARGET_BOARD_OMAP_CPU).so
\$(GRALLOC_SYMLINK): \$(LOCAL_INSTALLED_MODULE) \$(LOCAL_PATH)/Android.mk
	@echo "Symlink: \$@ -> \$(GRALLOC_FILE)"
	@rm -rf \$@
	\$(hide) mkdir -p \$(dir \$@)
	\$(hide) ln -fs \$(GRALLOC_FILE) \$@

ALL_DEFAULT_INSTALLED_MODULES += \$(GRALLOC_SYMLINK)

# for mm/mmm
all_modules: \$(GRALLOC_SYMLINK)

endif

EOF

(cat << EOF) | sed s/__COMMON__/$COMMON/g | sed s/__VENDOR__/$VENDOR/g > ../../../$COMMONOUTDIR/common-vendor.mk
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

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS += vendor/__VENDOR__/__COMMON__/overlay

\$(call inherit-product, vendor/__VENDOR__/__COMMON__/common-vendor-blobs.mk)
EOF

(cat << EOF) | sed s/__COMMON__/$COMMON/g | sed s/__VENDOR__/$VENDOR/g > ../../../$COMMONOUTDIR/BoardConfigVendor.mk
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

EOF

