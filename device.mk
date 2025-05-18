DEVICE_PATH := device/brcm/rpi5
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

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

## Configstore
PRODUCT_PACKAGES += \
	disable_configstore

# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm-service.clearkey

# Gatekeeper
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0-service.software

# Audio
PRODUCT_PACKAGES += \
	android.hardware.audio.service \
	android.hardware.audio@7.1-impl \
	android.hardware.audio.effect@7.0-impl \
	audio.primary.rpi \
	audio.primary.rpi_hdmi

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/audio/conf/alsa.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/alsa.conf \
	$(DEVICE_PATH)/audio/conf/cards/aliases.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/cards/aliases.conf \
	$(DEVICE_PATH)/audio/conf/cards/vc4-hdmi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/cards/vc4-hdmi.conf \
	$(DEVICE_PATH)/audio/conf/ctl/default.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/ctl/default.conf \
	$(DEVICE_PATH)/audio/conf/pcm/center_lfe.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/center_lfe.conf \
	$(DEVICE_PATH)/audio/conf/pcm/default.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/default.conf \
	$(DEVICE_PATH)/audio/conf/pcm/dmix.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/dmix.conf \
	$(DEVICE_PATH)/audio/conf/pcm/dpl.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/dpl.conf \
	$(DEVICE_PATH)/audio/conf/pcm/dsnoop.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/dsnoop.conf \
	$(DEVICE_PATH)/audio/conf/pcm/front.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/front.conf \
	$(DEVICE_PATH)/audio/conf/pcm/hdmi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/hdmi.conf \
	$(DEVICE_PATH)/audio/conf/pcm/iec958.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/iec958.conf \
	$(DEVICE_PATH)/audio/conf/pcm/modem.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/modem.conf \
	$(DEVICE_PATH)/audio/conf/pcm/rear.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/rear.conf \
	$(DEVICE_PATH)/audio/conf/pcm/side.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/side.conf \
	$(DEVICE_PATH)/audio/conf/pcm/surround21.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/surround21.conf \
	$(DEVICE_PATH)/audio/conf/pcm/surround40.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/surround40.conf \
	$(DEVICE_PATH)/audio/conf/pcm/surround41.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/surround41.conf \
	$(DEVICE_PATH)/audio/conf/pcm/surround50.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/surround50.conf \
	$(DEVICE_PATH)/audio/conf/pcm/surround51.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/surround51.conf \
	$(DEVICE_PATH)/audio/conf/pcm/surround71.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/pcm/surround71.conf \
	$(DEVICE_PATH)/audio/conf/smixer.conf:$(TARGET_COPY_OUT_VENDOR)/etc/alsa/smixer.conf

# Graphics
PRODUCT_PACKAGES += \
	android.hardware.composer.hwc3-service.drm \
	android.hardware.graphics.allocator-service.minigbm_gbm_mesa \
	mapper.minigbm_gbm_mesa \
	libgbm_mesa_wrapper

PRODUCT_PACKAGES += \
	libEGL_mesa \
	libGLESv1_CM_mesa \
	libGLESv2_mesa \
	libgallium_dri

PRODUCT_PACKAGES += \
	dri_gbm \
	libgbm_mesa

#PRODUCT_PACKAGES += \
#	android.hardware.graphics.composer3-V3-ndk \
#	android.hardware.graphics.allocator@2.0 \
#	android.hardware.graphics.allocator@3.0 \
#	android.hardware.graphics.allocator@4.0 \
#	android.hardware.graphics.allocator-V2-ndk \
#	android.hardware.graphics.mapper@2.0 \
#	android.hardware.graphics.mapper@2.1 \
#	android.hardware.graphics.mapper@3.0 \
#	android.hardware.graphics.mapper@4.0 \
#	android.hardware.graphics.common@1.0 \
#	android.hardware.graphics.common@1.1 \
#	android.hardware.graphics.common@1.2 \
#	android.hardware.graphics.common-V5-ndk

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2024-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

PRODUCT_PACKAGES += \
	vulkan.broadcom

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2024-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# Health
#PRODUCT_PACKAGES += \
#	android.hardware.health-service.batteryless
PRODUCT_PACKAGES += \
	android.hardware.health-service.rpi

# HIDL
PRODUCT_PACKAGES += \
	android.hidl.allocator@1.0-service \
	hwservicemanager

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service

# Power
PRODUCT_PACKAGES += \
    com.android.hardware.power

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ramdisk/fstab.rpi5:$(TARGET_COPY_OUT_RAMDISK)/fstab.rpi5 \
    $(DEVICE_PATH)/ramdisk/fstab.rpi5:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.rpi5 \
    $(DEVICE_PATH)/ramdisk/init.rpi5.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi5.rc

# Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

## Permissions (Hardware)
PRODUCT_COPY_FILES +=  \
	frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml \
	frameworks/native/data/etc/android.hardware.screen.portrait.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.portrait.xml

## Permissions (Software)
PRODUCT_COPY_FILES +=  \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
    frameworks/native/data/etc/android.software.cts.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.cts.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.picture_in_picture.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.voice_recognizers.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.voice_recognizers.xml \
	frameworks/native/data/etc/android.software.secure_lock_screen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.secure_lock_screen.xml

