AUDIO_DEVICETREE_ROOT=$(KERNEL_SRC)/$(M)
AUDIO_KERNEL_ROOT=$(AUDIO_DEVICETREE_ROOT)/../../opensource/audio-kernel/include

KBUILD_OPTIONS += KBUILD_DTC_INCLUDE=$(AUDIO_KERNEL_ROOT)
KBUILD_OPTIONS += KBUILD_EXTMOD_DTS=.
KBUILD_OPTIONS += KERNEL_ROOT=$(ROOT_DIR)/$(KERNEL_DIR)
KBUILD_OPTIONS += MODNAME=audio-devicetree


all: dtbs

dtbs:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules dtbs $(KBUILD_OPTIONS)

modules_install:
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean
