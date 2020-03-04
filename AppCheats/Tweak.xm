static BOOL zingtv , boom , nhaccuatui , camera , youtube , mail , messenger , facebook, safari;

%group Mess

%hook MNThreadReadMark
- (id)initWithMarkValue:(id)arg1 {
    arg1 = NULL;
    return %orig;
} 
%end
%end

%group Facebook

%hook FBInspirationStateManager
- (bool)shouldShowCameraInLeftSidebar {
    return 0;
} 
%end

%hook FBVideoPlaybackController
- (void)replaceVideoPlaybackItem:(id)arg1 forScenePath:(id)arg2 videoQuality:(long long)arg3 {
    arg3 = 11;
    %orig;
} 
%end
%end

%group Mail

%hook MailboxContentViewController
- (bool)allowDeleteAll {
    return 1;
} 
%end

%hook LibrarySearchSource
- (bool)supportsDeleteAll {
    return 1;
}
- (bool)supportsDeleteAllAcrossSources {
    return 1;
} 
- (bool)supportsMoveAll {
    return 1;
} 
- (bool)supportsMarkAll {
    return 1;
} 
- (bool)supportsArchiving {
    return 1;
} 
- (bool)supportsSearch {
    return 1;
} 
- (bool)supportsFlagging {
    return 1;
} 
%end

%hook GenericSource
- (bool)supportsDeleteAll {
    return 1;
}
- (bool)supportsMoveAll {
    return 1;
}
- (bool)supportsMarkAll {
    return 1;
} 
- (bool)supportsDeleteAllAcrossSources {
    return 1;
} 
- (bool)supportsSearch {
    return 1;
}
- (bool)supportsFlagging {
    return 1;
} 
- (bool)supportsThreadOperations {
    return 1;
} 
- (bool)supportsArchiving {
    return 1;
} 
%end

%hook ThreadedMiniMallSource
- (bool)supportsDeleteAll {
    return 1;
}
- (bool)supportsDeleteAllAcrossSources {
    return 1;
} 
- (bool)supportsMoveAll {
    return 1;
} 
- (bool)supportsFlagging {
    return 1;
} 
- (bool)supportsThreadOperations {
    return 1;
} 
- (bool)supportsMarkAll {
    return 1;
} 
- (bool)supportsArchiving {
    return 1;
} 
- (bool)supportsSearch {
    return 1;
} 
%end

%hook MailboxSource
- (bool)supportsDeleteAll {
    return 1;
}
- (bool)supportsDeleteAllAcrossSources {
    return 1;
} 
- (bool)supportsMarkAll {
    return 1;
} 
- (bool)supportsArchiving {
    return 1;
} 
- (bool)supportsSearch {
    return 1;
} 
- (bool)supportsFlagging {
    return 1;
} 
- (bool)supportsThreadOperations {
    return 1;
} 
%end

%hook CriterionSource
- (bool)supportsDeleteAll {
    return 1;
}
- (bool)supportsDeleteAllAcrossSources {
    return 1;
} 
- (bool)supportsMoveAll {
    return 1;
} 
- (bool)supportsArchiving {
    return 1;
} 
- (bool)supportsSearch {
    return 1;
} 
- (bool)supportsFlagging {
    return 1;
} 
- (bool)supportsThreadOperations {
    return 1;
} 
- (bool)supportsMarkAll {
    return 1;
} 
%end

%hook MessageMiniMall
- (bool)supportsArchiving {
    return 1;
} 
%end

%end


//••••••••••

%group Camera

%hook CAMViewfinderViewController
- (void)_setLayoutStyle:(long long)arg1 {
    arg1 = 1;
    %orig;
} 
%end



%hook AVCaptureDeviceFormat
- (bool)isIrisSupported {
    return 1;
} 
%end

%hook CAMUserPreferences
- (bool)shouldResetCaptureConfiguration {
    return 1;
} 
%end

%hook CAMCaptureConfiguration
- (long long)mode {
    return 0;
}
- (long long)device {
    return 0;
} 
%end

%hook CAMViewfinderViewController
- (long long)_aspectRatioForMode:(long long)arg1 {
    return 1;
} 
%end

%hook CAMTopBar
- (long long)backgroundStyle {
    return 1;
} 
%end

%hook CAMBottomBar
- (long long)backgroundStyle {
    return 1;
} 
%end

%hook CUCaptureController
- (bool)startCapturingBurstWithRequest:(id)arg1 error:(id*)arg2 {
    return 0;
} 
%end

%hook CAMViewfinderViewController
- (void)_setSwipeToModeSwitchEnabled:(bool)arg1 {
} 
%end

%hook CAMCaptureCapabilities
- (bool)isLiveFilteringSupported {
    return 0;
}
- (bool)isSquareModeSupported {
    return 0;
} 
%end

%hook CAMTopBar
- (bool)shouldHideFramerateIndicatorForGraphConfiguration:(id)arg1 {
    return 1;
} 
%end

%hook CAMViewfinderViewController
- (bool)_shouldHideFramerateIndicatorForGraphConfiguration:(id)arg1 {
    return 1;
}
- (bool)_shouldHideShutterButtonForGraphConfiguration:(id)arg1 {
    return %orig;
} 
%end

%hook CAMShutterButtonRingView
- (void)setColor:(id)arg1 {
    arg1 = [UIColor colorWithRed:1.0/255.0 green:127.0/255.0 blue:136.0/255.0 alpha:255.0/255.0];
    %orig;
} 
%end

%hook CAMViewfinderView
- (void)setZoomSlider:(id)arg1 {
    arg1 = NULL;
    %orig;
} 
%end

%hook CAMConflictingControlConfiguration
- (id)initWithDesiredFlashMode:(long long)arg1 desiredHDRMode:(long long)arg2 flashAndHDRConflictingControl:(long long)arg3 {
    arg1 = 0;
    return %orig;
} 
%end

%hook CAMImageWell
- (bool)isThumbnailImageHidden {
    return 0;
} 
%end

%hook CAMShutterButtonRingView
- (void)drawRect:(CGRect)arg1 {
} 
%end

%hook CAMTorchPattern
- (id)initWithType:(long long)arg1 {
    arg1 = 4;
    return %orig;
} 
%end

%hook CAMViewfinderViewController
- (bool)_shouldHideTimerIndicatorViewForGraphConfiguration:(id)arg1 {
    return 1;
} 
%end

%hook CAMCaptureCapabilities
- (bool)isFrontIrisSupported {
    return 1;
}
- (bool)isBackIrisSupported {
    return 1;
} 
%end

%hook CAMImageWell
- (long long)layoutStyle {
    return %orig;
} 
%end

%hook CAMBadgeView
- (id)initWithFrame:(CGRect)arg1 {
    return NULL;
} 
%end

%hook CAMViewfinderViewController
- (bool)_shouldRotateTopBarForGraphConfiguration:(id)arg1 {
    return 1;
}
- (long long)_layoutStyle {
    return %orig;
}
- (bool)shouldAutorotate {
    return 0;
} 
%end

%hook CAMHDRButton
- (bool)allowsHDROn {
    return 1;
}
- (bool)allowsAutomaticHDR {
    return 1;
} 
%end

%hook CAMVideoHDRCommand
- (bool)_isEnabled {
    return 1;
} 
%end

%hook CAMCaptureCapabilities
- (bool)isFrontHDRSupported {
    return 1;
}
- (bool)isFrontHDROnSupported {
    return 1;
}
- (bool)isFrontAutomaticHDRSupported {
    return 1;
} 
%end
%end


//••••••••••

%group Boom
%hook FIRComponentContainer
- (id)initWithApp:(id)arg1 {
    return %orig;
} 
%end

%hook GDLocalIAPReceipt
- (long long)isActiveAutoRenewableSubscriptionForDate:(id)arg1 {
    return 99999999;
} 
%end

%hook GDReceiptStore
- (void)updateValidationState:(long long)arg1 {
    arg1 = 1;
    %orig;
} 
%end

%hook BMStore
- (bool)validateProductWithIdentifier:(id)arg1 {
    return 1;
} 
%end

%hook BMBoomAudioSystemController
- (void)updateSystemState:(long long)arg1 {
    arg1 = 1;
    %orig;
} 
%end

%hook GADODefaultInAppPurchase
+ (void)disableDefaultPurchaseFlow {
    return %orig;
} 
%end
%end


//•••••••••
%group ZingTV
%hook UserInfoEntity
- (id)userName {
    return @"FAHLNBG";
}
- (bool)isVip {
    return 1;
}
- (void)setIsVip:(bool)arg1 {
    arg1 = 1;
    %orig;
} 
%end
%end

//••••••••••


%group YouTube

%hook HAMPlayer
- (void)setAllowsBackgroundPlayback:(bool)arg1 {
    arg1 = 1;
    %orig;
} 
%end

%hook YTUpsell
- (id)initWithUpsellType:(int)arg1 shortMessage:(id)arg2 dialogTitle:(id)arg3 dialogMessage:(id)arg4 icon:(id)arg5 headerForeground:(id)arg6 headerBackground:(id)arg7 offerRestrictions:(id)arg8 extraButtonText:(id)arg9 extraButtonEndpoint:(id)arg10 extraButtonServiceEndpoint:(id)arg11 dismissButtonText:(id)arg12 dismissButtonEndpoint:(id)arg13 dismissButtonServiceEndpoint:(id)arg14 impressionServiceEndpoints:(id)arg15 trackingParams:(id)arg16 maximumDownloadQuality:(int)arg17 counterfactual:(bool)arg18 analyticsTag:(id)arg19 {
    return NULL;
} 
%end

%hook YTSingleVideoMediaData
- (bool)isPlayableInBackground {
    return 1;
} 
%end

%hook YTSingleVideo
- (bool)isPlayableInBackground {
    return 1;
} 
%end

%hook YTPlaybackData
- (bool)isPlayableInBackground {
    return 1;
} 
%end

%hook MLHAMPlayer
- (bool)backgroundPlaybackAllowed {
    return 1;
} 
%end

%hook YTSingleVideoController
- (bool)isCurrentlyBackgroundable {
    return 1;
} 
%end

%hook YTLocalPlaybackController
- (bool)isPlaybackBackgroundable {
    return 1;
} 
%end

%hook YTIPlayerResponse
- (bool)isPlayableInBackground {
    return 1;
} 
%end

%hook YTIPlayabilityStatus
- (bool)playableInBackground {
    return 1;
}
- (bool)hasBackgroundability {
    return 1;
}
- (bool)isPlayableInBackground {
    return 1;
} 
%end

%hook MLAVPlayer
- (bool)backgroundPlaybackAllowed {
    return 1;
} 
%end

%hook YTUpsell
- (bool)isCounterfactual {
    return 0;
} 
%end

%hook MDXAdSessionState
- (id)initWithAdDuration:(double)arg1 adVideoID:(id)arg2 isSkippable:(bool)arg3 adPlayerResponse:(id)arg4 adWatchNextResponse:(id)arg5 {
    return NULL;
} 
%end

%hook MDXAdSessionState
- (bool)isSkippable {
    return 1;
} 
%end

%hook YTVideoAdsCoordinatorState
- (bool)prerollSeen {
    return %orig;
} 
%end

%hook YTVideoAdsOverlayCoordinator
- (bool)isSkipAdShown {
    return 1;
} 
%end

%hook YTInstreamAdsCoordinator
- (bool)shouldAutomaticallySkipAd:(id)arg1 {
    return 1;
} 
%end

%hook YTVideoAdsController
- (bool)isInnerTubeAdBreak:(id)arg1 {
    return 0;
} 
%end

%hook YTUserDefaults
- (bool)doForceAdsWithDummyMidroll {
    return 0;
} 
%end

%hook MDXAdsPlayerOverlayViewController
- (bool)disallowQualitySwitch {
    return 0;
} 
%end

%hook YTVideoQualitySwitchController
- (bool)allowAudioOnlyManualQualitySelection {
    return 1;
}
- (bool)allowCellularManualQualitySelection {
    return 1;
} 
%end

%hook YTSettings
- (bool)allowAudioOnlyManualQualitySelection {
    return 1;
} 
%end

%hook YTLocalPlaybackController
- (bool)isContentPanAllowed {
    return 1;
} 
%end

%hook MDXPlayerOverlayViewController
- (bool)disallowQualitySwitch {
    return 0;
} 
%end

%hook YTVideoPlayerOverlayViewController
- (bool)isContentPanAllowed {
    return 1;
}
- (bool)disallowQualitySwitch {
    return 0;
} 
%end

%hook YTGlobalConfig
- (bool)isDownloadDuringPlaybackEnabled {
    return 1;
} 
%end

%hook MLStreamDownloader
- (bool)checkUserInfo:(id)arg1 {
    return 1;
} 
%end

%hook YTSettings
- (bool)isDownloadDuringPlaybackEnabled {
    return 1;
} 
%end

%hook MLStreamSelector
- (bool)isAudioOnlyPlaybackAllowed {
    return 1;
} 
%end

%hook YTGlobalConfig
- (bool)isAudioCastEnabled {
    return 1;
}
- (bool)isCameoFiltersEnabled {
    return 1;
}
- (bool)isSpaceCastEnabled {
    return 1;
}
- (bool)isInlinePlaybackEnabled {
    return 1;
}
- (bool)isTabloidEnabled {
    return 1;
} 
%end

%hook YTColdConfig
- (bool)isVideoZoomEnabled {
    return 1;
}
- (bool)isTodayWidgetEnabled {
    return 1;
} 
%end

%hook YTIPlayerResponse
- (bool)isMonetized {
    return 0;
} 
%end
%end

//•••••••••••••

%group Nhaccuatui
%hook UserObj
- (bool)powerUser {
    return 1;
}
- (void)setPowerUser:(bool)arg1 {
    arg1 = 1;
    %orig;
} 
%end
%end
//•••••••••••••
%group Safari
%hook TabOverview
- (unsigned long long)_tabsPerRow {
    return 3;
}
%end

%hook WKApplicationStateTrackingView
- (void)_applicationDidEnterBackground { // Chạy nền
} 
%end

%hook BrowserController
- (bool)_shouldShowTabBar {
    return 1;
}
- (bool)_shouldUseTabBar {
    return 1;
}
- (bool)_shouldUseTabOverview {
    return 1;
} 
- (bool)shouldShowSidebarInLandscape {
    return 1;
} 
%end

@interface _UISearchBarSearchFieldBackgroundView : UIView
@property(nonatomic, assign, readwrite) CGFloat alpha;
@end

%hook _UISearchBarSearchFieldBackgroundView
-(void)layoutSubviews{
self.alpha =0;
}
%end
%end

		//---Preferences---//
static void loadPrefs() {
	static NSString *file = @"/User/Library/Preferences/com.fahlnbg.appcheats.plist";
	NSMutableDictionary *preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:file];

messenger = [[preferences objectForKey:@"messenger"] boolValue];
facebook = [[preferences objectForKey:@"facebook"] boolValue];
mail = [[preferences objectForKey:@"mail"] boolValue];
zingtv = [[preferences objectForKey:@"zingtv"] boolValue];
boom = [[preferences objectForKey:@"boom"] boolValue];
youtube = [[preferences objectForKey:@"youtube"] boolValue];
camera = [[preferences objectForKey:@"camera"] boolValue];
nhaccuatui = [[preferences objectForKey:@"nhaccuatui"] boolValue];
mail = [[preferences objectForKey:@"mail"] boolValue];
safari = [[preferences objectForKey:@"safari"] boolValue];

	[preferences release];
}

static NSString *nsNotificationString = @"com.fahlnbg.appcheats/pref";
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


%ctor {

    loadPrefs();

NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

if(facebook && [bundleIdentifier containsString:@"com.facebook.Facebook"] ) %init(Facebook);

if(messenger && [bundleIdentifier containsString:@"com.facebook.Messenger"] ) %init(Mess);

if(zingtv && [bundleIdentifier containsString:@"vng.com.vn.zingtv-hd"] ) %init(ZingTV);

if(boom && [bundleIdentifier containsString:@"com.globaldelight.iBoom"] ) %init(Boom);

if(youtube && [bundleIdentifier containsString:@"com.google.ios.youtube"]) %init(YouTube);

if(camera && [bundleIdentifier containsString:@"com.apple.camera"]) %init(Camera);

if(mail)%init(Mail);

if(nhaccuatui && [bundleIdentifier containsString:@"com.nct.nhaccuatui"]) %init(Nhaccuatui);

if(safari && [bundleIdentifier containsString:@"com.apple.mobilesafari"] ) %init(Safari);

	%init(_ungrouped);
}


