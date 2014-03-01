#
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
#

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/expressatt/expressatt-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/expressatt/overlay

# Boot Logo
PRODUCT_COPY_FILES += \
       device/samsung/expressatt/rootdir/initlogo.rle:root/initlogo.rle

# Media profile
PRODUCT_COPY_FILES += \
       device/samsung/expressatt/media/media_profiles.xml:system/etc/media_profiles.xml

# scripts
PRODUCT_PACKAGES += \
    50bluetooth \
    60sensors \
    wifimac.sh

# prima wlan
PRODUCT_PACKAGES += \
    WCNSS_cfg.dat \
    WCNSS_qcom_cfg.ini \
    WCNSS_qcom_wlan_nv.bin_

# d2-common
$(call inherit-product, device/samsung/d2lte/d2-common.mk)
