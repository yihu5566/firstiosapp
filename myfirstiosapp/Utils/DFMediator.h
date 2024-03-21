//
//  DFMediator.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DFMediator : NSObject

+(__kindof UIViewController *) detailViewControllerWithUrl:(NSString *)detailUrl;

@end

NS_ASSUME_NONNULL_END
