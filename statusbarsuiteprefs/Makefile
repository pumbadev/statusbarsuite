include theos/makefiles/common.mk


BUNDLE_NAME = StatusBarSuitePrefs
StatusBarSuitePrefs_FILES = StatusBarSuitePrefs.mm
StatusBarSuitePrefs_INSTALL_PATH = /Library/PreferenceBundles
StatusBarSuitePrefs_FRAMEWORKS = UIKit
StatusBarSuitePrefs_PRIVATE_FRAMEWORKS = Preferences


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/StatusBarSuitePrefs.plist$(ECHO_END)
