#
# Copyright (C) 2015 The CyanogenMod Project
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
#

# Inherit from common exynos5420-common
-include device/samsung/exynos5420-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/lt03wifi

# Bionic Tuning
ARCH_ARM_USE_MEMCPY_ALIGNMENT := true
BOARD_MEMCPY_ALIGNMENT := 64
BOARD_MEMCPY_ALIGN_BOUND := 32768

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Bootloader
TARGET_OTA_ASSERT_DEVICE := lt03wifi,lt03wifiue

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_lt03wifi_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/lt03wifi

# Charger/Healthd
BOARD_CHARGER_ENABLE_SUSPEND := true
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"

# Graphics
OVERRIDE_RS_DRIVER := libRSDriverArm.so

# HDMI
BOARD_USES_GSC_VIDEO := true
BOARD_USES_CEC := true

# GSC
BOARD_USES_ONLY_GSC0_GSC1 := true

# Hardware
BOARD_HARDWARE_CLASS += device/samsung/lt03wifi/cmhw

# Samsung Gralloc
TARGET_SAMSUNG_GRALLOC_EXTERNAL_USECASES := true

# Partitions
# 12863930368 - 16384 <encryption footer>
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12863913984

# PowerHAL
TARGET_POWERHAL_VARIANT := universal5420

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.universal5420

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/lt03wifi/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    mediaserver.te 

# inherit from the proprietary version
-include vendor/samsung/lt03wifi/BoardConfigVendor.mk
