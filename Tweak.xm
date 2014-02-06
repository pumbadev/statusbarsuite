// Written by Pumba - RIP Teddy "LyriX"

#define PreferencesChangedNotification @"com.pumba.statusbarsuite.prefs-changed"
#define PreferencesFilePath @"/var/mobile/Library/Preferences/com.pumba.statusbarsuite.plist"

#pragma mark StatusBar Setup/Methods
@interface StatusBarSuite : NSObject
-(void)prefsChanged;
-(BOOL)isEnabled:(NSString *)enabledKey;
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

-(BOOL)isEnabled:(NSString *)enabledKey {

	return (prefs) ?[prefs[enabledKey]boolValue] :NO;


}

@end

#pragma mark Battery
%hook UIStatusBarBatteryItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if ([statusBarSuite isEnabled:@"hideBattery"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideBattery"]) {
		return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if ([statusBarSuite isEnabled:@"hideBattery"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideBattery"]) {
		return nil;
	}
	else {
	return %orig;
	}
}


%end

#pragma mark Carrier
%hook UIStatusBarServiceItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if ([statusBarSuite isEnabled:@"hideCarrier"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideCarrier"]) {
		return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if ([statusBarSuite isEnabled:@"hideCarrier"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideCarrier"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

%end

#pragma mark Time
%hook UIStatusBarTimeItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if ([statusBarSuite isEnabled:@"hideTime"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideTime"]) {
		return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if ([statusBarSuite isEnabled:@"hideTime"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideTime"]) {
		return nil;
	}
	else {
	return %orig;
	}
}


%end

#pragma mark Bluetooth
%hook UIStatusBarBluetoothItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if ([statusBarSuite isEnabled:@"hideBluetooth"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideBluetooth"]) {
		return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if ([statusBarSuite isEnabled:@"hideBluetooth"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideBluetooth"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

%end

#pragma mark Bluetooth Battery
%hook UIStatusBarBluetoothBatteryItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if ([statusBarSuite isEnabled:@"hideBluetoothBattery"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideBluetoothBattery"]) {
		return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if ([statusBarSuite isEnabled:@"hideBluetoothBattery"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideBluetoothBattery"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
%end

#pragma mark LTE/WiFi
%hook UIStatusBarDataNetworkItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if ([statusBarSuite isEnabled:@"hideNetworkWifi"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideNetworkWifi"]) {
		return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if ([statusBarSuite isEnabled:@"hideNetworkWifi"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideNetworkWifi"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
%end


#pragma mark Signal Dots
%hook UIStatusBarSignalStrengthItemView

+ (id)itemWithType:(int)arg1 idiom:(int)arg2 {

	if ([statusBarSuite isEnabled:@"hideSignalDots"]) {
		return nil;
	}
	else {
	return %orig;
	}
}

- (id)initWithItem:(id)arg1 data:(id)arg2 actions:(int)arg3 style:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideSignalDots"]) {
		return nil;
	}
	
	else {
	return %orig;
	}
}

- (id)initWithType:(int)arg1 {
	if ([statusBarSuite isEnabled:@"hideSignalDots"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
+ (id)createViewForItem:(id)arg1 withData:(id)arg2 actions:(int)arg3 foregroundStyle:(id)arg4 {
	if ([statusBarSuite isEnabled:@"hideSignalDots"]) {
		return nil;
	}
	else {
	return %orig;
	}
}
%end


#pragma mark Setup
%ctor {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	prefs = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];
	statusBarSuite = [[StatusBarSuite alloc]init];
	
	NSNotificationCenter *notCenter = [NSNotificationCenter defaultCenter];
	[notCenter addObserver:statusBarSuite selector:@selector(prefsChanged:)name:PreferencesChangedNotification object:nil];
	
	[pool release];
}
