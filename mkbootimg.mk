DEVICE_PATH := device/brcm/rpi5
KERNEL_PATH := ${PRODUCT_OUT}/obj/KERNEL_OBJ/arch/arm64/boot

RPI_BOOT_OUT := $(PRODUCT_OUT)/rpiboot
$(RPI_BOOT_OUT): $(INSTALLED_RAMDISK_TARGET)
	mkdir -p $(RPI_BOOT_OUT)
	mkdir -p $(RPI_BOOT_OUT)/overlays
	cp $(DEVICE_PATH)/boot/* $(RPI_BOOT_OUT)
	cp $(KERNEL_PATH)/Image $(RPI_BOOT_OUT)
	cp $(KERNEL_PATH)/dts/broadcom/bcm2712*-rpi-*.dtb $(RPI_BOOT_OUT)
	cp $(KERNEL_PATH)/dts/overlays/* $(RPI_BOOT_OUT)/overlays
	cp $(PRODUCT_OUT)/ramdisk.img $(RPI_BOOT_OUT)
	echo $(BOARD_KERNEL_CMDLINE) > $(RPI_BOOT_OUT)/cmdline.txt

$(INSTALLED_BOOTIMAGE_TARGET): $(RPI_BOOT_OUT)
	$(call pretty,"Target boot image: $@")
	dd if=/dev/zero of=$@ bs=1M count=128
	/usr/sbin/mkfs.fat -F 32 -n "boot" $@
	/usr/bin/mcopy -s -i $@ $(RPI_BOOT_OUT)/* ::