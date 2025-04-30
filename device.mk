DEVICE_PATH := device/brcm/rpi5
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Vendor blobs
$(call inherit-product, vendor/brcm/rpi5/rpi5-vendor.mk)

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# API level
PRODUCT_SHIPPING_API_LEVEL := 35

# AAPT
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Characteristics
PRODUCT_CHARACTERISTICS := tv

# Graphics
PRODUCT_PACKAGES += \
    hwcomposer.drm

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2024-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2024-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

    # Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ramdisk/fstab.rpi5:$(TARGET_COPY_OUT_RAMDISK)/fstab.rpi5 \
    $(DEVICE_PATH)/ramdisk/fstab.rpi5:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.rpi5 \
    $(DEVICE_PATH)/ramdisk/init.rpi5.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi5.rc \
