# Bootloader
PRODUCT_COPY_FILES += \
    ../u-boot/build/idbloader.img:idbloader.img \
    ../u-boot/build/u-boot.itb:u-boot.itb

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := ../kernel_android-15-6.6/out/orangepi3b/dist/Image.gz
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# DTB & DTBO
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := ../kernel_android-15-6.6/out/orangepi3b/dist/
BOARD_DTBO_FILES := \
    ../kernel_android-15-6.6/out/orangepi3b/dist/rk3566-orangepi-3b.dtb
DTBO_UNSIGNED := dtbo-unsigned.img
BOARD_PREBUILT_DTBOIMAGE = $(PRODUCT_OUT)/$(DTBO_UNSIGNED)

# System RO FS Type
TARGET_RO_FILE_SYSTEM_TYPE ?= erofs

# Partitions
PRODUCT_BUILD_BOOT_IMAGE := true
PRODUCT_BUILD_DTBO_IMAGE := true
PRODUCT_BUILD_RECOVERY_IMAGE := true
PRODUCT_BUILD_SYSTEM_IMAGE := true
PRODUCT_BUILD_VENDOR_IMAGE := true
PRODUCT_BUILD_PRODUCT_IMAGE := true
PRODUCT_BUILD_CACHE_IMAGE := true
PRODUCT_BUILD_USERDATA_IMAGE := true

# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# Add Fastboot
PRODUCT_PACKAGES += fastbootd
