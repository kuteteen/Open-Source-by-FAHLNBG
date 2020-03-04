#import <sys/utsname.h>

// Link to MobileGestalt in your makefile!
// xxx_LIBRARIES = MobileGestalt
OBJC_EXTERN CFStringRef MGCopyAnswer(CFStringRef key) WEAK_IMPORT_ATTRIBUTE;

@interface DRMUtils : NSObject {}

- (NSString*)deviceModelIdentifier;
- (NSString*)deviceUDID;
- (int)packageWasPurchased;

@end


@implementation DRMUtils

// Sử dụng API trung gian của GMmoran.me để sử dụng an toàn API DRM của Packix
// Đối với các chỉnh sửa của Nhà phát triển.

#define API_URL @"https://gmoran.me/api/YOUR_ID_KEY"
#define PACKAGE_ID @"com.package.id"

// Will return device's model identifier
// i.e : @"iPhone1,1" for iPhone 2G
-(NSString*)deviceModelIdentifier {
	struct utsname systemInfo;
    uname(&systemInfo);

    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}
// Trả lại thiết bị UDID
// Được tính toán với công thức: UDID = SHA1 (Số sê-ri IMEI WiFiAddress BluetoothAddress)
// Nhưng thay vào đó hãy liên kết với MobileGestalt. 
-(NSString*)deviceUDID {
	CFStringRef UDNumber = MGCopyAnswer(CFSTR("UniqueDeviceID"));
	NSString* UDID = (__bridge NSString*)UDNumber;
	return UDID;
}

-(int)packageWasPurchased {
	// Don't judge the semaphore
	// Dustin, Max, Ryan, and everyone else who's helped me learn obj-c
	// Would murder me.

	dispatch_semaphore_t mySemaphore = dispatch_semaphore_create(0);

	NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:API_URL]];

	NSString* UDID = [self deviceUDID];
	NSString* modelID = [self deviceModelIdentifier];
	NSString* packageID = PACKAGE_ID;

	NSString *userUpdate =[NSString stringWithFormat:@"UDID=%@&modelID=%@&packageID=%@", UDID, modelID, packageID];

	//create the Method "GET" or "POST"
	[urlRequest setHTTPMethod:@"POST"];

	//Convert the String to Data
	NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];

	//Apply the data to the body
	[urlRequest setHTTPBody:data1];

	__block int statusCode;

	NSURLSession *session = [NSURLSession sharedSession];
	NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	    if(httpResponse.statusCode == 200)
	    {
	   	 NSError *parseError = nil;
	   	 NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
	   	 NSLog(@"The response is - %@",responseDictionary);
	   	 NSString* status = [responseDictionary objectForKey:@"status"];

	   	 if([status isEqualToString: @"completed"]) {
	   		 statusCode = 0; // Device is authorized to use this package
	   	 }
	   	 else if ([status isEqualToString: @"failed"]) {
	   		 statusCode = 1; // Device is not authorized to use this package
	   	 }
	   	 else {
	   		 statusCode = -1; // An error occurred
	   	 }
	    }
	    else {
	   	 NSString* errorMessage = @"Did not receive 200 from API";
	   	 [NSException raise:@"API Error" format:@"%@", errorMessage];
	   	 statusCode = -1;
	    }
		dispatch_semaphore_signal(mySemaphore);
	}];
	[dataTask resume];
	dispatch_semaphore_wait(mySemaphore, DISPATCH_TIME_FOREVER);
	return statusCode;
}

@end
