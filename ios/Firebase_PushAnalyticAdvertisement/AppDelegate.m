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
#import <Firebase.h>
#import "RNFirebaseNotifications.h"
#import "RNFirebaseMessaging.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [FIRApp configure];
  [RNFirebaseNotifications configure];
  
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
  
  if ([FIRApp defaultApp] == nil) {
  [FIRApp configure];
  }
  
  UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
  UNNotificationAction* openAction = [UNNotificationAction actionWithIdentifier: @"OpenNotification" title: @"Say 'YES'"
                                                                        options:UNNotificationActionOptionForeground];
  UNNotificationAction* closeAction = [UNNotificationAction actionWithIdentifier: @"CloseNotification" title: @"Say 'NO'"
                                                                         options: UNNotificationActionOptionForeground];
  
  UNTextInputNotificationAction *inputAction = [UNTextInputNotificationAction actionWithIdentifier: @"InputMessage" title: @"Provide your answer" options: UNNotificationActionOptionForeground textInputButtonTitle: @"Send" textInputPlaceholder: @"Answer"];
  
  UNNotificationCategory* defaultCategory = [UNNotificationCategory categoryWithIdentifier: @"CustomSamplePush" actions: @[openAction, closeAction] intentIdentifiers: @[] options: @[]];
  UNNotificationCategory* defaultCategory_2 = [UNNotificationCategory categoryWithIdentifier: @"CustomSamplePush_4" actions: @[openAction, closeAction, inputAction] intentIdentifiers: @[] options: @[]];
  // если указано только UNTextInputNotificationAction действие, то при зажатии пуша будет сразу открываться поле ввода, если есть другие action, тогда будут отображены их кнопки + кнопка с title, указанным для UNTextInputNotificationAction, при нажатии на которую будет открываться поле ввода
  NSSet *categories = [NSSet setWithObjects: defaultCategory, defaultCategory_2, nil];
  [center setNotificationCategories: categories];
    
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

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
  [[RNFirebaseNotifications instance] didReceiveLocalNotification:notification];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo
fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler{
  [[RNFirebaseNotifications instance] didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
  [[RNFirebaseMessaging instance] didRegisterUserNotificationSettings:notificationSettings];
}

@end
