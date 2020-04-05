#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

### INHERIT FROM YOSHIRO
include device/samsung/exynos9820-common/BoardConfigPlatform.mk
include vendor/samsung/beyond2lte/BoardConfigVendor.mk

DEVICE_PATH := device/samsung/beyond2lte

TARGET_OTA_ASSERT_DEVICE := beyond2,beyond2lte,beyond2ltexx

PRODUCT_PLATFORM := exynos9820

### KERNEL
TARGET_KERNEL_CONFIG := exynos9820-beyond2lte_defconfig

### PARTITIONS
# /proc/partitions shows the size in 1024-byte blocks
BOARD_BOOTIMAGE_PARTITION_SIZE := 57671680 # 56 MB
BOARD_DTBOIMG_PARTITION_SIZE := 8388608 # 8 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67633152 # 66 MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600 # 614 MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5976883200 # 5 GB
BOARD_VENDORIMAGE_PARTITION_SIZE := 1153433600 # 1 GB
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 650117120 # 634 MB

# Reserve space for data encryption (119126622208 - 20480)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 119126601728

# blockdev --getbsz /dev/block/sda
BOARD_FLASH_BLOCK_SIZE := 4096

# Workaround: Use the dtbo we built
BOARD_PREBUILT_DTBOIMAGE     := $(DEVICE_PATH)/prebuilts/recovery_dtbo

### VNDK
BOARD_VNDK_VERSION := current

### SYSTEM PROPS
# Add device-specific ones
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
