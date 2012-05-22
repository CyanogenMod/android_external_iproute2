LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  tc.c tc_qdisc.c q_cbq.c tc_util.c tc_class.c tc_core.c m_action.c \
                    m_estimator.c tc_filter.c tc_monitor.c tc_stab.c tc_cbq.c \
                    tc_estimator.c f_u32.c m_police.c q_ingress.c m_mirred.c q_htb.c \
                    q_sfq.c m_ematch.c em_cmp.c em_meta.c em_nbyte.c f_basic.c f_flow.c \
                    f_route.c f_rsvp.c f_tcindex.c m_gact.c m_ipt.c f_cgroup.c m_nat.c \
                    m_pedit.c m_skbedit.c q_drr.c q_dsmark.c q_fifo.c q_gred.c q_hfsc.c \
                    q_multiq.c q_prio.c q_red.c q_rr.c q_tbf.c tc_red.c q_sfb.c

LOCAL_MODULE := tc

LOCAL_SYSTEM_SHARED_LIBRARIES := \
	libc libm libdl

LOCAL_SHARED_LIBRARIES += libiprouteutil libnetlink

LOCAL_C_INCLUDES := $(KERNEL_HEADERS) external/iproute2/include

LOCAL_CFLAGS := -O2 -g -Wall -Wstrict-prototypes

include $(BUILD_EXECUTABLE)

