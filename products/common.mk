# Generic product
PRODUCT_NAME := stockui
PRODUCT_BRAND := stockui
PRODUCT_DEVICE := generic

# Inherit kitkat audio package.
$(call inherit-product, vendor/rascarlo/products/kitkataudio.mk)

# Common overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Launcher3 supported devices
ifneq ($(filter stockui_mako stockui_hammerhead,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    Launcher3 \
# Auto-rotate
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/rascarlo/overlay
endif

# STK: overlay common to all devices with telephony
ifneq ($(filter stockui_mako stockui_hammerhead,$(TARGET_PRODUCT)),)
# Build SimToolKit
PRODUCT_PACKAGES += \
    Stk
endif

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/rascarlo/overlay

# Latin IME lib
PRODUCT_COPY_FILES += \
    vendor/rascarlo/proprietary/common/system/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/rascarlo/prebuilt/bin/sysinit:system/bin/sysinit 

# userinit support
PRODUCT_COPY_FILES += \
    vendor/rascarlo/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Gapps backup script
PRODUCT_COPY_FILES += \
    vendor/rascarlo/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/rascarlo/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/rascarlo/prebuilt/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# Additional packages
-include vendor/rascarlo/products/packages.mk

# SU Support
PRODUCT_COPY_FILES += \
    vendor/rascarlo/prebuilt/bin/su:system/xbin/daemonsu \
    vendor/rascarlo/prebuilt/bin/su:system/xbin/su \
    vendor/rascarlo/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon \
    vendor/rascarlo/prebuilt/apk/Superuser.apk:system/app/Superuser.apk

# Dashclock
PRODUCT_COPY_FILES += \
    vendor/rascarlo/prebuilt/apk/DashClock.apk:system/app/DashClock.apk
