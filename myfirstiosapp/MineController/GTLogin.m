//
//  GTLogin.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/13.
//

#import "GTLogin.h"
#import "TencentOpenAPI/QQApiInterface.h"
#import "TencentOpenAPI/TencentOAuth.h"


@interface GTLogin ()<TencentSessionDelegate>

@property(nonatomic,strong,readwrite)TencentOAuth *oauth;
@property(nonatomic,assign,readwrite)BOOL isLogin;

@end

@implementation GTLogin

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isLogin = NO;
        _oauth = [[TencentOAuth alloc]initWithAppId:@"222222" andDelegate:self];
    }
    return self;
}

- (BOOL)isLogin {
}

- (void)logOut {
}

+ (nonnull instancetype)sharedLogin {
}

- (void)loginWithFinishBlock:(nonnull GTLoginFinishBlock)finishBlock {
}

- (void)shareToQQWithArticleUrl:(nonnull NSURL *)articleUrl {
}

- (void)tencentDidLogin { 
    
}

- (void)tencentDidNotLogin:(BOOL)cancelled { 
    
}

- (void)tencentDidNotNetWork { 
    
}

@end
