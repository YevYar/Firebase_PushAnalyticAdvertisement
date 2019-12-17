/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
// #import <Firebase.h>
// #import <RNCPushNotificationIOS.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // NSLog(@"We are here! ================================================");
  // [FIRApp configure];
  
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"Firebase_PushAnalyticAdvertisement"
                                            initialProperties:nil];

  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  /* if ([FIRApp defaultApp] == nil) {
  [FIRApp configure];
  } */
  
  [self requestPushNotificationPermissions];
  
  return YES;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

/*- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
  NSLog(@"didRegisterUserNotificationSettings ===============");
  // [RNCPushNotificationIOS didRegisterUserNotificationSettings:notificationSettings];
}
// Required for the register event.
/* - (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
  NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken ===============");
  [RNCPushNotificationIOS didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
} */
// Required for the notification event. You must call the completion handler after handling the remote notification.
/* - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
  NSLog(@"didReceiveRemoteNotification ===============");
  [RNCPushNotificationIOS didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
} */
// Required for the registrationError event.
/* - (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
  NSLog(@"didFailToRegisterForRemoteNotificationsWithError ===============");
  [RNCPushNotificationIOS didFailToRegisterForRemoteNotificationsWithError:error];
} */
// Required for the localNotification event.
/*- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
  NSLog(@"didReceiveLocalNotification ===============");
  // [RNCPushNotificationIOS didReceiveLocalNotification:notification];
}

- (void)application:(UIApplication*)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)devToken
{
  NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken ===============");
  // parse token bytes to string
  const char *data = [devToken bytes];
  NSMutableString *token = [NSMutableString string];
  for (NSUInteger i = 0; i < [devToken length]; i++)
  {
    [token appendFormat:@"%02.2hhX", data[i]];
  }
  
  // print the token in the console.
  NSLog(@"Push Notification Token: %@", [token copy]);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
  // could not register a Push Notification token at this time.
  NSLog(@"didFailToRegisterForRemoteNotificationsWithError ===============");
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
  // app has received a push notification
  NSLog(@"didReceiveRemoteNotification ===============");
}

- (void)requestPushNotificationPermissions
{
  // iOS 10+
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
    
    switch (settings.authorizationStatus)
    {
      // User hasn't accepted or rejected permissions yet. This block shows the allow/deny dialog
      case UNAuthorizationStatusNotDetermined:
      {
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error)
         {
           if(granted)
           {
             [[UIApplication sharedApplication] registerForRemoteNotifications];
           }
           else
           {
             // notify user to enable push notification permission in settings
           }
         }];
        break;
      }
      // the user has denied the permission
      case UNAuthorizationStatusDenied:
      {
        // notify user to enable push notification permission in settings
        break;
      }
      // the user has accepted; Register a PN token
      case UNAuthorizationStatusAuthorized:
      {
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        break;
      }
      default:
        break;
    }
  }];
}

@end */
/*#import "AppDelegate.h"


// #import <Firebase.h>
// #import <RNCPushNotificationIOS.h>


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [self requestPushNotificationPermissions];

  return YES;
}*/

- (void)application:(UIApplication*)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)devToken
{
  // parse token bytes to string
  const char *data = [devToken bytes];
  NSMutableString *token = [NSMutableString string];
  for (NSUInteger i = 0; i < [devToken length]; i++)
  {
    [token appendFormat:@"%02.2hhX", data[i]];
  }
  
  // print the token in the console.
  NSLog(@"Push Notification Token: %@", [token copy]);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
  // could not register a Push Notification token at this time.
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
  NSLog(@"didReceiveRemoteNotification fetchCompletionHandler ===============");
  [UIApplication sharedApplication].applicationIconBadgeNumber = 200;
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
  NSLog(@"didReceiveRemoteNotification ===============");
  [UIApplication sharedApplication].applicationIconBadgeNumber = 300;
}

- (void)requestPushNotificationPermissions
{
  // iOS 10+
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
    
    switch (settings.authorizationStatus)
    {
      // User hasn't accepted or rejected permissions yet. This block shows the allow/deny dialog
      case UNAuthorizationStatusNotDetermined:
      {
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error)
         {
           if(granted)
           {
             [[UIApplication sharedApplication] registerForRemoteNotifications];
           }
           else
           {
             // notify user to enable push notification permission in settings
           }
         }];
        break;
      }
      // the user has denied the permission
      case UNAuthorizationStatusDenied:
      {
        // notify user to enable push notification permission in settings
        break;
      }
      // the user has accepted; Register a PN token
      case UNAuthorizationStatusAuthorized:
      {
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        break;
      }
      default:
        break;
    }
  }];
}


@end
