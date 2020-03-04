include $(THEOS)/makefiles/common.mk
export ARCHS = arm64e arm64

BUNDLE_NAME = AppCheats
AppCheats_FILES = CheatsRootListController.m
AppCheats_INSTALL_PATH = /Library/PreferenceBundles
AppCheats_FRAMEWORKS = UIKit
AppCheats_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AppCheats.plist$(ECHO_END)
