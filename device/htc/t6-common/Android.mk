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

ifneq ($(filter t6 t6spr t6vzw,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)

# Create firmware links
FIRMWARE_MDM_IMAGES := \
    acdb.mbn \
    apps.mbn \
    dsp1.mbn dsp2.mbn dsp3.mbn \
    efs1.mbn efs2.mbn efs3.mbn \
    htccdma.mbn htcrfnv.mbn htcssmem.mbn \
    mdm_acdb.img \
    rpm.mbn \
    sbl1.mbn \
    sbl2.mbn

ifneq ($(filter t6,$(TARGET_DEVICE)),)
FIRMWARE_MDM_IMAGES += \
    htc61.mbn htc62.mbn htc63.mbn htc64.mbn htc65.mbn \
    htcnvbak.mbn htcrcust.mbn htcsmem.mbn \
    sbl1_82.mbn sbl1_92.mbn sbl1_96.mbn
endif

ifneq ($(filter t6spr t6vzw,$(TARGET_DEVICE)),)
FIRMWARE_MDM_IMAGES += \
    htccnv.mbn htcnvmfg.mbn htcuserd.mbn
endif

FIRMWARE_MDM_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(FIRMWARE_MDM_IMAGES)))
$(FIRMWARE_MDM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MDM Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/mdm/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MDM_SYMLINKS)

FIRMWARE_Q6_IMAGES := \
    q6.b00 q6.b01 q6.b03 q6.b04 q6.b05 q6.b06 q6.mdt

FIRMWARE_Q6_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(FIRMWARE_Q6_IMAGES)))
$(FIRMWARE_Q6_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Q6 Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/q6/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_Q6_SYMLINKS)

FIRMWARE_WCNSS_IMAGES := \
    wcnss.b00 wcnss.b01 wcnss.b02 wcnss.b04 wcnss.b05 wcnss.mdt

FIRMWARE_WCNSS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(FIRMWARE_WCNSS_IMAGES)))
$(FIRMWARE_WCNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/wcnss/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_WCNSS_SYMLINKS)

# Create a link for the WCNSS config file, which ends up as a writable
# version in /data/misc/wifi
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wlan/prima; \
    ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
        $(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini)

endif
