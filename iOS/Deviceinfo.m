//
//  Deviceinfo.m
//  Deviceinfo
//
//  Created by Ashish Gangwar on 07/07/11.
//  Copyright 2011 adobe. All rights reserved.
//


#import "FlashRuntimeExtensions.h"
#include <stdio.h>      
#include <sys/types.h>
#include <string.h> 
#import <UIKit/UIDevice.h>




FREObject getDeviceInformation(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
	
	FREObject deviceStatsArray[6];   //
	FREObject returnDeviceStats = nil;
	
	
	
	
	
	NSString* dName = [[UIDevice currentDevice]name];
	NSString* dUid =  [[UIDevice currentDevice]uniqueIdentifier];
	NSString* dSysName = [[UIDevice currentDevice]systemName];
	NSString* dVersion = [[UIDevice currentDevice]systemVersion];
	NSString* dModel = [[UIDevice currentDevice]model];
	
	const char *DeviceName = [ dName cStringUsingEncoding:[NSString defaultCStringEncoding]] ;
	const char *DeviceUID = [ dUid cStringUsingEncoding:[NSString defaultCStringEncoding]] ;
	const char *DeviceSysName = [ dSysName cStringUsingEncoding:[NSString defaultCStringEncoding]] ;
	const char *DeviceOsVersion = [ dVersion cStringUsingEncoding:[NSString defaultCStringEncoding]];
	const char *DeviceModel = [ dModel cStringUsingEncoding:[NSString defaultCStringEncoding]];
	
	
	
	
	FRENewObjectFromUTF8(32, (const uint8_t*)DeviceName, &deviceStatsArray[0]); // Name of iDevice
	FRENewObjectFromUTF8(32, (const uint8_t*)DeviceUID, &deviceStatsArray[1]); // UID string of iDevice
	
	FRENewObjectFromUTF8(32, (const uint8_t*)DeviceSysName, &deviceStatsArray[2]); // systemName string of iDevice
	FRENewObjectFromUTF8(32, (const uint8_t*)DeviceOsVersion, &deviceStatsArray[3]); // version of OS install on iDevice
	FRENewObjectFromUTF8(32, (const uint8_t*)"Apple", &deviceStatsArray[4]); // version of OS install on iDevice
	FRENewObjectFromUTF8(32, (const uint8_t*)DeviceModel, &deviceStatsArray[5]); // Model name of  iDevice
	
	//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
	
	
	
	
	FRENewObject(
				 (const uint8_t*)"com.adobe.nativeExtension.DeviceInfo.DeviceStats"      ,
				 6           ,
				 deviceStatsArray         ,
				 &returnDeviceStats,
				 nil
				 );
	
	
	
	
	
    return returnDeviceStats;
}






// ContextInitializer()
//
// The context initializer is called when the runtime creates the extension context instance.

void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, 
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
	NSLog(@"Entering ContextInitializer()");
	
	*numFunctionsToTest = 1;
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction)*1);
	func[0].name = (const uint8_t*)"getDeviceStats";
	func[0].functionData =NULL;
	func[0].function = &getDeviceInformation;
	
	
	*functionsToSet = func;
	
	NSLog(@"Exiting ContextInitializer()");
}




// ContextFinalizer()
//
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void ContextFinalizer(FREContext ctx) {
	
	NSLog(@"Entering ContextFinalizer()");
    
    // Nothing to clean up.
	
    NSLog(@"Exiting ContextFinalizer()");
    
	return;
	
}




// ExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.

void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
					FREContextFinalizer* ctxFinalizerToSet) {
	
	NSLog(@"Entering ExtInitializer()");
	
	*extDataToSet = NULL;
	*ctxInitializerToSet = &ContextInitializer;
	*ctxFinalizerToSet = &ContextFinalizer;
	
	NSLog(@"Exiting ExtInitializer()");
	
} 





// ExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.

void ExtFinalizer(void* extData) {
	
    NSLog(@"Entering ExtFinalizer()");
	
	// Nothing to clean up.
	
    NSLog(@"Exiting ExtFinalizer()");
	
	return;
}
