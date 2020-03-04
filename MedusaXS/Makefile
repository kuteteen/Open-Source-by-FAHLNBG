include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MedusaXS
MedusaXS_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += medusaxspref
include $(THEOS_MAKE_PATH)/aggregate.mk
