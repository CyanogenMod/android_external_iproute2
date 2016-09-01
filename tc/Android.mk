LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  tc.c tc_exec.c tc_qdisc.c q_cbq.c tc_util.c tc_class.c tc_core.c m_action.c \
                    m_estimator.c tc_filter.c tc_monitor.c tc_stab.c tc_cbq.c \
                    tc_estimator.c f_u32.c m_police.c q_ingress.c m_mirred.c q_htb.c

ifeq ($(call is-vendor-board-platform,QCOM),true)
LOCAL_SRC_FILES += f_fw.c q_prio.c q_fifo.c
endif

LOCAL_MODULE := tc

LOCAL_SYSTEM_SHARED_LIBRARIES := \
	libc libm libdl

LOCAL_SHARED_LIBRARIES += libiprouteutil libnetlink

ifeq ($(call is-vendor-board-platform,QCOM),true)
LOCAL_CFLAGS := -DFEATURE_PRIO
endif
LOCAL_C_INCLUDES := external/iproute2/include

LOCAL_CFLAGS += -O2 -g -W -Wall -Wno-pointer-arith -Wno-sign-compare -Werror \
    -Wno-unused-parameter \
    -Wno-missing-field-initializers

# This is a work around for b/18403920
LOCAL_LDFLAGS := -Wl,--no-gc-sections

include $(BUILD_EXECUTABLE)

