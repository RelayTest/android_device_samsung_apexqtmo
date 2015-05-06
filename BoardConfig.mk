# Copyright (C) 2014 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# >>> msm8960-common/BoardConfigCommon.mk

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_VARIANT := krait

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 zcache
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01500000
BOARD_KERNEL_PAGESIZE := 2048

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  WITH_DEXPREOPT := true
endif

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
QCOM_ADSP_SSR_ENABLED := false
QCOM_ANC_HEADSET_ENABLED := false
QCOM_FLUENCE_ENABLED := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGING_CMDLINE_NAME := "androidboot.bootchg"
BOARD_CHARGING_CMDLINE_VALUE := "true"
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/msm8960-common/cmhw

# Display
BOARD_USES_LEGACY_MMAP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_NO_ADAPTIVE_PLAYBACK := true
TARGET_NO_INITLOGO := true

# Use dlmalloc instead of jemalloc for mallocs
MALLOC_IMPL := dlmalloc

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Includes
TARGET_SPECIFIC_HEADER_PATH += device/samsung/msm8960-common/include

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/samsung/msm8960-common/sepolicy

BOARD_SEPOLICY_UNION += \
    bluetooth.te \
    bootanim.te \
    device.te \
    file.te \
    file_contexts \
    genfs_contexts \
    hostapd.te \
    init_shell.te \
    kernel.te \
    keypad_dev.te \
    macloader.te \
    mediaserver.te \
    mm-qcamerad.te \
    mpdecision.te \
    netd.te \
    netmgrd.te \
    orientationd.te \
    panel_dev.te \
    platform_app.te \
    power_dev.te \
    qmuxd.te \
    radio.te \
    rild.te \
    rmt_storage.te \
    surfaceflinger.te \
    sysinit.te \
    system_app.te \
    system_server.te \
    ueventd.te \
    vold.te \
    wpa.te

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Build our own PowerHAL
TARGET_POWERHAL_VARIANT :=
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/msm8960-common/power/power_ext.c

# <<< msm8960-common/BoardConfigCommon.mk

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5515509760

TARGET_SPECIFIC_HEADER_PATH += device/samsung/apexqtmo/include

# inherit from the proprietary version
-include vendor/samsung/apexqtmo/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := apexqtmo
TARGET_BOARD_INFO_FILE ?= device/samsung/apexqtmo/board-info.txt

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Kernel
TARGET_KERNEL_CONFIG := cyanogen_apexq_defconfig

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5515509760
TARGET_RECOVERY_FSTAB := device/samsung/apexqtmo/rootdir/etc/fstab.qcom

# Audio
BOARD_HAVE_DOCK_USBAUDIO := true
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
BOARD_USES_SEPERATED_VOIP := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/apexqtmo/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true

# Camera
TARGET_NEED_DISABLE_AUTOFOCUS := true
TARGET_NEED_DISABLE_FACE_DETECTION_BOTH_CAMERAS := true
TARGET_NEED_PREVIEW_SIZE_FIXUP := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/prima_wlan.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/prima_wlan/parameters/fwpath"
WIFI_DRIVER_MODULE_NAME     := "prima_wlan"
WIFI_DRIVER_FW_PATH_STA     := "sta"
WIFI_DRIVER_FW_PATH_AP      := "ap"

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/apexqtmo
