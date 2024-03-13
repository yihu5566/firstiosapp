//
//  GTLogin.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTLoginFinishBlock)(BOOL isLogin);

@interface GTLogin : NSObject

@property(nonatomic,strong,readonly)NSString *nick;
@property(nonatomic,strong,readonly)NSString *address;
@property(nonatomic,strong,readonly)NSString *avatarUrl;

+ (instancetype)sharedLogin;

#pragma -mark - login

- (BOOL)isLogin;
- (void)loginWithFinishBlock:(GTLoginFinishBlock)finishBlock;
- (void)logOut;

#pragma mark - 分享
- (void)shareToQQWithArticleUrl:(NSURL *)articleUrl;


@end

NS_ASSUME_NONNULL_END
