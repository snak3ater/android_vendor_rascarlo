# Inherit AOSP device configuration for manta.
$(call inherit-product, device/samsung/manta/full_manta.mk)

# Inherit common product files.
$(call inherit-product, vendor/rascarlo/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := stockui_manta
PRODUCT_BRAND := google
PRODUCT_DEVICE := manta
PRODUCT_MODEL := Nexus 10
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=mantaray \
    BUILD_FINGERPRINT=google/mantaray/manta:4.4.2/KOT49H/937116:user/release-keys \
    PRIVATE_BUILD_DESC="mantaray-user 4.4.2 KOT49H 937116 release-keys"

# Inherit media effect blobs
-include vendor/rascarlo/products/common_media_effects.mk

# boot animation
PRODUCT_COPY_FILES += \
    vendor/rascarlo/proprietary/manta/system/media/bootanimation.zip:system/media/bootanimation.zip
