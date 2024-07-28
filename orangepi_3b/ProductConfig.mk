$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_arm64.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Device info
PRODUCT_NAME := orangepi_3b
PRODUCT_DEVICE := orangepi_3b
PRODUCT_BRAND := OrangePi
PRODUCT_MODEL := OrangePi-3B
PRODUCT_MANUFACTURER := Xunlong

# Partitions
PRODUCT_BUILD_BOOT_IMAGE := true
PRODUCT_BUILD_DTBO_IMAGE := true
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