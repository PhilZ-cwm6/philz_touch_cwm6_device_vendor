LOCAL_PATH := $(call my-dir)

ifeq ($(SENSORS_COMPASS_AK8973),true)

ifneq ($(TARGET_SIMULATOR),true)

# HAL module implemenation, not prelinked, and stored in
# hw/<SENSORS_HARDWARE_MODULE_ID>.<ro.product.board>.so
include $(CLEAR_VARS)

LOCAL_MODULE := sensors.warp2

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -DLOG_TAG=\"Sensors\"
LOCAL_SRC_FILES :=                                              \
                                sensors.c                       \
                                nusensors.cpp                   \
                                InputEventReader.cpp            \
                                SensorBase.cpp                  \
                                AkmSensor.cpp

LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

endif # !TARGET_SIMULATOR

endif # SENSORS_COMPASS_AK8973
