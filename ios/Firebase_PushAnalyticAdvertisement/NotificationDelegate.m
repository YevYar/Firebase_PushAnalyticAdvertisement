//
//  NotificationDelegate.m
//  Firebase_PushAnalyticAdvertisement
//
//  Created by Євгеній Яремченко on 12/18/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "NotificationDelegate.h"

@implementation NotificationDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
  NSLog(@"didReceiveNotificationResponse -------------------------------------------");
  completionHandler();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
  NSLog(@"willPresentNotification -------------------------------------------");
  completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound);
}

@end
