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

LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),oppo)
ifeq ($(TARGET_BOARD_PLATFORM),msm8960)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# Create firmware links
FIRMWARE_IMAGES := \
    acdb.mbn mdm_acdb.img \
    apps.mbn \
    dsp1.mbn dsp2.mbn dsp3.mbn \
    dsps.b00 dsps.b01 dsps.b02 dsps.b03 dsps.b04 dsps.b05 dsps.mdt \
    efs1.mbn efs2.mbn efs3.mbn \
    mobicore.b00 mobicore.b01 mobicore.b02 mobicore.b03 mobicore.mdt \
    q6.b00 q6.b01 q6.b03 q6.b04 q6.b05 q6.b06 q6.mdt \
    rpm.mbn \
    sbl1.mbn sbl2.mbn \
    tzapps.b00 tzapps.b01 tzapps.b02 tzapps.b03 tzapps.mdt \
    wcnss.b00 wcnss.b01 wcnss.b02 wcnss.b04 wcnss.b05 wcnss.mdt
FIRMWARE_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_IMAGES)))
$(FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_SYMLINKS)

# Create a link for the WCNSS config file, which ends up as a writable
# version in /data/misc/wifi
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wlan/prima; \
    ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
	    $(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini)

endif
endif
