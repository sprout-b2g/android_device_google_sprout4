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

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# common sprout
$(call inherit-product, device/google/sprout-common/sprout.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/root/init.sprout.rc:root/init.sprout.rc \
    $(LOCAL_PATH)/rootdir/root/fstab.sprout:root/fstab.sprout

# for Gecko to use the correct resolution assets
# Valid options are: 1.5 | 2 | 2.25
GAIA_DEV_PIXELS_PER_PX := 1.5

# for Gecko to use the correct boot animation
# Valid options are: hvga | fwvga | qHD | 720p | 1080p
BOOTANIMATION_ASSET_SIZE := fwvga

+# for Gonk to support Camera blobs
PRODUCT_PACKAGES += \
 libandroid

# for Gecko to support usb mass storage
# You may need to add mass_storage to init.oem.usb.rc
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
 persist.sys.usb.config=mass_storage

# for Gecko to support virtual home button
PRODUCT_PROPERTY_OVERRIDES += \
 ro.moz.has_home_button=0

# for Gecko to support Dual SIM
PRODUCT_PROPERTY_OVERRIDES += \
 persist.radio.multisim.config=dsds \
 ro.moz.ril.numclients=2 \
 ro.moz.ril.subscription_control=true

# for locales
PRODUCT_LOCALES := en_US
