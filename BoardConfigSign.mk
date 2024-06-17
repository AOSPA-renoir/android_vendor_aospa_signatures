CERTIFICATE_DIRECTORY_ROOT ?= vendor/aospa/signatures
CERTIFICATE_COMMON := $(CERTIFICATE_DIRECTORY_ROOT)/common

ifeq ($(TARGET_BUILD_FULLY_SIGN),true)
AOSPA_AVB_KEY_PATH := $(CERTIFICATE_COMMON)/data/releasekey.pk8
endif
