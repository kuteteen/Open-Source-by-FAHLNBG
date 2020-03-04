static BOOL enable;

%hook SBFloatingDockController
+ (BOOL)isFloatingDockSupported {
	return YES;
}
%end

%hook SBMedusaConfigurationUsageMetric

+ (BOOL)_isFloatingActive {
	return enable;
}
%end

%hook UIApplication

+ (BOOL)isMedusaEnabled {
	return enable;
}
%end


%hook SBPlatformController
-(long long)medusaCapabilities {
	return 2;
}
%end

%hook SBMainWorkspace
-(BOOL)isMedusaEnabled {
	return enable;
}
%end

%hook SBApplication
-(BOOL)isMedusaCapable {
	return enable;
}
%end

static void loadPrefs() {
	static NSString *file = @"/User/Library/Preferences/com.fahlnbg.medusaxs.plist";
	NSMutableDictionary *preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:file];
	if(!preferences) {
		preferences = [[NSMutableDictionary alloc] init];
enable = YES;;
		[preferences writeToFile:file atomically:YES];
	} else {
enable = [[preferences objectForKey:@"enable"] boolValue];
	}
	[preferences release];
}

static NSString *nsNotificationString = @"com.fahlnbg.medusaxs/pref";
static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    loadPrefs();
}

%ctor {
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	loadPrefs();
	notificationCallback(NULL, NULL, NULL, NULL, NULL);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
	[pool release];
}


