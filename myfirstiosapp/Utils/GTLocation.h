//
//  GTLocation.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 * app 位置管理
 */
@interface GTLocation : NSObject

+(GTLocation *)locationManage;

- (void)checkLocationAuthorization;


@end

NS_ASSUME_NONNULL_END
