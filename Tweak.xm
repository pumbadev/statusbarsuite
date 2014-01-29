#define PreferencesChangedNotification @"com.pumba.statusbarsuite.prefs-changed"
#define PreferencesFilePath @"/var/mobile/Library/Preferences/com.pumba.statusbarsuite.plist"

@interface StatusBarSuite : NSObject
-(void)prefsChanged;

@end

@implementation StatusBarSuite
-(void)prefsChanged {
	// reload prefs
	
	if (prefs) {
	[prefs release];
	}
	if ((prefs = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath])== nil); {
		[prefs writeToFile:PreferencesFilePath atomically:YES];
		prefs = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];
	}
}

static NSDictionary *prefs = nil;
static StatusBarSuite *statusBarSuite = nil;

static BOOL batteryEnabled(void) {
	return (prefs) ? [prefs[@"hideBattery"] boolValue] : NO; 
}
static BOOL carrierEnabled(void) {
	return (prefs) ? [prefs[@"hideCarrier"] boolValue] : NO; 
}

@end
%hook UIStatusBarBatteryItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if (batteryEnabled()) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if (batteryEnabled()) {
	return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if (batteryEnabled()) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if (batteryEnabled()) {
		return nil;
	}
	else {
	return %orig;
	}
}


%end

%hook UIStatusBarServiceItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if (carrierEnabled()) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if (carrierEnabled()) {
	return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if (carrierEnabled()) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if (carrierEnabled()) {
		return nil;
	}
	else {
	return %orig;
	}
}

%end


%ctor {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	prefs = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];
	statusBarSuite = [[StatusBarSuite alloc]init];
	
	NSNotificationCenter *notCenter = [NSNotificationCenter defaultCenter];
	[notCenter addObserver:statusBarSuite selector:@selector(prefsChanged:)name:PreferencesChangedNotification object:nil];
	
	[pool release];
}
