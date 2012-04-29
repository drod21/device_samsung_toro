# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Add packages for full_toro build
PRODUCT_PACKAGES := \
    Basic \
    Camera \
    FileManager \
    Galaxy4 \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    QuickDash \
    Superuser \
    Superuser.apk \
    su

#if we do this after the full_base_telephony is included some of these don't get picked up..
PRODUCT_COPY_FILES += \
    device/samsung/toro/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/sample/etc/apns-conf_verizon.xml:system/etc/apns-conf.xml \
    device/samsung/toro/prebuilt/bootanimation.zip:system/media/bootanimation.zip \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-verizon \
    ro.com.google.locationfeatures=1 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.mode=OPTIONAL \
    ro.cdma.home.operator.numeric=310004 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
    ro.gsm.2nd_data_retry_config=max_retries=infinite,default_randomization=2000,0,0,80000,125000,485000,905000 \
    ro.cdma.otaspnumschema=SELC,1,80,99 \
    ro.com.android.dataroaming=false \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.setupwizard.enterprise_mode=1 \
    ro.config.ringtone=Girtab.ogg \
    ro.config.notification_sound=Proxima.ogg \
    ro.config.alarm_alert=Rooster.ogg \
    ro.modversion=rubiX-v.0.1 \
    ro.kernel.android.checkjni=0 \
    windowsmgr.max_events_per_sec=240

# Override some toro specific build information
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=mysid \
    BUILD_ID=ICL53F \
    BUILD_DISPLAY_ID=IML74K \
	BUILD_FINGERPRINT="google/mysid/toro:4.0.2/ICL53F/235179:user/release-keys" \
	PRIVATE_BUILD_DESC="mysid-user 4.0.2 ICL53F 235179 release-keys"

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
# Inherit from toro device
$(call inherit-product, device/samsung/toro/device_vzw.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_toro
PRODUCT_DEVICE := toro
PRODUCT_BRAND := google
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := Samsung
