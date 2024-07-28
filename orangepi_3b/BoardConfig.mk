TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED ?= false
TARGET_USERIMAGES_SPARSE_F2FS_DISABLED ?= false
TARGET_USERIMAGES_SPARSE_EROFS_DISABLED ?= false

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USERDATAIMAGE_PARTITION_SIZE := 21474836480 # 20 GiB
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741824 # 1 GiB

# Enable AVB
BOARD_AVB_ENABLE := true

# Enable Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

# Boot image
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864 # 64 MiB
BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION) 

# DTBO image
BOARD_DTBOIMG_PARTITION_SIZE := 4194304 # 4 MiB

# Recovery image
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864 # 64 MiB

# Super partition
TARGET_USE_DYNAMIC_PARTITIONS := true
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
BOARD_SUPER_PARTITION_SIZE := 3229614080 # 3072 + 8 MiB
BOARD_SUPER_PARTITION_GROUPS := default_dynamic_partitions
BOARD_DEFAULT_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product
BOARD_DEFAULT_DYNAMIC_PARTITIONS_SIZE := 1610612736  # 1536 MiB, must less than BOARD_SUPER_PARTITION_SIZE / 2