# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Inherit common product files.
$(call inherit-product, vendor/rascarlo/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := stockui_grouper
PRODUCT_BRAND := google
PRODUCT_DEVICE := grouper
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=nakasi BUILD_FINGERPRINT=google/nakasi/grouper:4.4.2/KOT49H/937116:user/release-keys \
    PRIVATE_BUILD_DESC="nakasi-user 4.4.2 KOT49H 937116 release-keys"

# Inherit media effect blobs
-include vendor/rascarlo/products/common_media_effects.mk

# disable strictmode on boot
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1
