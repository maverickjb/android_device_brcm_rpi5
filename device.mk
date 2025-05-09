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

# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm-service.clearkey

# Gatekeeper
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0-service.software

# Graphics
PRODUCT_PACKAGES += \
	android.hardware.graphics.composer3-V3-ndk \
	android.hardware.graphics.allocator@2.0 \
	android.hardware.graphics.allocator@3.0 \
	android.hardware.graphics.allocator@4.0 \
	android.hardware.graphics.allocator-V2-ndk \
	android.hardware.graphics.mapper@2.0 \
	android.hardware.graphics.mapper@2.1 \
	android.hardware.graphics.mapper@3.0 \
	android.hardware.graphics.mapper@4.0 \
	android.hardware.graphics.common@1.0 \
	android.hardware.graphics.common@1.1 \
	android.hardware.graphics.common@1.2 \
	android.hardware.graphics.common-V5-ndk \
	libgralloctypes \
	libdmabufheap \
	libdrm

# HIDL
PRODUCT_PACKAGES += \
	android.hidl.allocator@1.0-service \
	hwservicemanager

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service

#PRODUCT_COPY_FILES += \
#    hardware/interfaces/keymaster/4.1/default/android.hardware.hardware_keystore.km41.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hardware_keystore.km41.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ramdisk/fstab.rpi5:$(TARGET_COPY_OUT_RAMDISK)/fstab.rpi5 \
    $(DEVICE_PATH)/ramdisk/fstab.rpi5:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.rpi5 \
    $(DEVICE_PATH)/ramdisk/init.rpi5.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi5.rc \
