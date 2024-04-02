//
//  GTNotification.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/21.
//

#import "GTNotification.h"
#import <UserNotifications/UserNotifications.h>
#import <UIKit/UIKit.h>

@interface GTNotification()<UNUserNotificationCenterDelegate>


@end

@implementation GTNotification

+ (nonnull GTNotification *)notificationManager {
    
    static GTNotification *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTNotification alloc]init];
    });
    return manager;
}

- (void)checkNotificationAuthorization {
    UNUserNotificationCenter * _Nonnull center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;

    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                [self _pushLocationNotification];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication] registerForRemoteNotifications];
                });
            }
    }];
    
    
}

#pragma mark -

- (void) _pushLocationNotification{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc]init];
    
    content.badge=@(1);
    content.title=@"good afternoon";
    content.body = @"this is test notification";
    content.sound = [UNNotificationSound defaultSound];
    
    UNTimeIntervalNotificationTrigger * _Nonnull trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:30 repeats:NO];
    
    UNNotificationRequest * _Nonnull request = [UNNotificationRequest requestWithIdentifier:@"_pushLocationNotification" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            //error
    }];
    
    
}


#pragma mark -

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    completionHandler(UNNotificationPresentationOptionBanner);
    
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    
    [center setBadgeCount:5 withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            // Handle error
            NSLog(@"Error setting badge count: %@", error);
        } else {
            // Badge count set successfully
            NSLog(@"Badge count set successfully");
        }
    }];    completionHandler();
}

@end
