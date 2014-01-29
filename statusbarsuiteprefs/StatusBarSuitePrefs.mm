@interface PSListController : NSObject { //Good enough
    id _specifiers;
}

- (id)loadSpecifiersFromPlistName:(NSString *)name target:(id)target;

@end 
@interface StatusBarSuitePrefsListController: PSListController {
}
@end

@implementation StatusBarSuitePrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"StatusBarSuitePrefs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
