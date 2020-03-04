include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppCheats
AppCheats_FILES = Tweak.xm

export ARCHS = arm64 arm64e
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += appcheats
include $(THEOS_MAKE_PATH)/aggregate.mk
