$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_arm64.mk)
$(call inherit-product, device/6xyun/orangepi_3b/device.mk)

# Device info
PRODUCT_NAME := orangepi_3b
PRODUCT_DEVICE := orangepi_3b
PRODUCT_BRAND := OrangePi
PRODUCT_MODEL := OrangePi-3B
PRODUCT_MANUFACTURER := Xunlong
PRODUCT_RESTRICT_VENDOR_FILES := true
