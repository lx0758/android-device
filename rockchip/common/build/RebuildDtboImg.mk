# Use this file to generate dtb.img and dtbo.img instead of using
# BOARD_PREBUILT_DTBIMAGE_DIR. We need to keep dtb and dtbo files at the fixed
# positions in images, so that bootloader can rely on their indexes in the
# image. As dtbo.img must be signed with AVB tool, we generate intermediate
# dtbo.img, and the resulting $(PRODUCT_OUT)/dtbo.img will be created with
# Android build system, by exploiting BOARD_PREBUILT_DTBOIMAGE variable.

ifneq ($(filter orangepi_3b%, $(TARGET_DEVICE)),)

MKDTIMG := system/libufdt/utils/src/mkdtboimg.py
DTBOIMAGE := $(PRODUCT_OUT)/$(DTBO_UNSIGNED)

$(DTBOIMAGE): PRIVATE_MKDTIMG := $(MKDTIMG)
$(DTBOIMAGE): PRIVATE_DTBO_FILES := $(BOARD_DTBO_FILES)
$(DTBOIMAGE): $(BOARD_DTBO_FILES) $(MKDTIMG)
	$(PRIVATE_MKDTIMG) create $@ $(PRIVATE_DTBO_FILES)

include $(CLEAR_VARS)
LOCAL_MODULE := dtboimage
LOCAL_LICENSE_KINDS := legacy_restricted
LOCAL_LICENSE_CONDITIONS := restricted
LOCAL_ADDITIONAL_DEPENDENCIES := $(DTBOIMAGE)
include $(BUILD_PHONY_PACKAGE)

droidcore: dtboimage

$(call dist-for-goals, dist_files, $(DTBOIMAGE))

$(BUILT_TARGET_FILES_DIR): $(DTBOIMAGE)

endif
