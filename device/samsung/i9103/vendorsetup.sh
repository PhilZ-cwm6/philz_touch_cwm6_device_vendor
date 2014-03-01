#
# Copyright (C) 2008 The Android Open Source Project
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

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

add_lunch_combo cm_i9103-eng
add_lunch_combo full_i9103-eng
add_lunch_combo cm_i9103-userdebug

echo "Apply patch to frameworks/base"
echo -n "Apply patch 0001-framework-base-patch.patch"
(cd frameworks/base; git am ../../device/samsung/i9103/patches/0001-framework-base-patch.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/base; git am --abort)
	echo "     [FAIL]"
fi

echo -n "Apply patch 0002-DisplayDevice-Backwards-compatibility-with-old-EGL.patch"
(cd frameworks/native; git am ../../device/samsung/i9103/patches/0002-DisplayDevice-Backwards-compatibility-with-old-EGL.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/native; git am --abort)
	echo "     [FAIL]"
fi
echo -n "Apply patch 0002-Add-missing-functions-and-signatures-for-older-OMX-v.patch"
(cd frameworks/av; git am ../../device/samsung/i9103/patches/0002-Add-missing-functions-and-signatures-for-older-OMX-v.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/av; git am --abort)
	echo "     [FAIL]"
fi


echo -n "Apply patch 0001-external-skia-patch.patch"
(cd external/skia; git am ../../device/samsung/i9103/patches/0001-external-skia-patch.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/av; git am --abort)
	echo "     [FAIL]"
fi

echo "Apply patch to external/chromium_org"
echo -n "Apply patch 0001-Work-around-broken-GL_TEXTURE_BINDING_EXTERNAL_OES-q.patch"
(cd external/chromium_org; git am ../../device/samsung/i9103/patches/0001-Work-around-broken-GL_TEXTURE_BINDING_EXTERNAL_OES-q.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
  echo "     [DONE]"
else
  (cd external/chromium_org; git am --abort)
  echo "     [FAIL]"
fi

