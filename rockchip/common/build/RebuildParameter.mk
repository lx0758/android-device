ifneq ($(filter orangepi_3b%, $(TARGET_DEVICE)),)

PRODUCT_PARAMETER_TEMPLATE ?= device/6xyun/rockchip/common/scripts/parameter_tools/parameter.in

$(info build parameter.txt with $(PRODUCT_PARAMETER_TEMPLATE)...)

partition_list := idbloader:8160K,uboot:4M,dtbo:$(BOARD_DTBOIMG_PARTITION_SIZE),misc:4M,vbmeta:4M
partition_list := $(partition_list),boot:$(BOARD_BOOTIMAGE_PARTITION_SIZE),recovery:$(BOARD_RECOVERYIMAGE_PARTITION_SIZE)
partition_list := $(partition_list),cache:$(BOARD_CACHEIMAGE_PARTITION_SIZE),super:$(BOARD_SUPER_PARTITION_SIZE)

ROCKCHIP_PARAMETER_TXT := $(PRODUCT_OUT)/parameter.txt
ROCKCHIP_PARAMETER_TOOLS := $(SOONG_HOST_OUT_EXECUTABLES)/parameter_tools

$(ROCKCHIP_PARAMETER_TXT): $(PRODUCT_PARAMETER_TEMPLATE) $(ROCKCHIP_PARAMETER_TOOLS)
	@echo "Building parameter.txt $@."
	$(ROCKCHIP_PARAMETER_TOOLS) \
	--input $(PRODUCT_PARAMETER_TEMPLATE) \
	--start-offset 64 \
	--firmware-version $(PLATFORM_VERSION_LAST_STABLE).0 \
	--machine-model $(PRODUCT_MODEL) \
	--manufacturer $(PRODUCT_MANUFACTURER) \
	--machine $(PRODUCT_DEVICE) \
	--partition-list $(partition_list) \
	--output $@

include $(CLEAR_VARS)
LOCAL_MODULE := parameter.txt
LOCAL_LICENSE_KINDS := legacy_notice
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_ADDITIONAL_DEPENDENCIES := $(ROCKCHIP_PARAMETER_TXT)
include $(BUILD_PHONY_PACKAGE)

droidcore: parameter.txt

endif