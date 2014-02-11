export ARCHS = armv7 arm64
export SDKVERSION = 7.0


include /opt/theos/makefiles/common.mk

TWEAK_NAME = StatusBarSuite
StatusBarSuite_FILES = Tweak.xm


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += statusbarsuiteprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
