//
//  GTNotification.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTNotification : NSObject

+ (GTNotification *)notificationManager;

-(void)checkNotificationAuthorization;

@end

NS_ASSUME_NONNULL_END
