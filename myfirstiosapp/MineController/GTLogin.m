//
//  GTLogin.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/13.
//

#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "GTLogin.h"


@interface GTLogin ()<TencentSessionDelegate>

@property (nonatomic, strong, readwrite) TencentOAuth *oauth;
@property (nonatomic, assign, readwrite) BOOL isLogin;
@property (nonatomic, copy, readwrite) GTLoginFinishBlock finishBlock;

@end

@implementation GTLogin

- (instancetype)init
{
    self = [super init];

    if (self) {
        _isLogin = NO;
        _oauth = [[TencentOAuth alloc]initWithAppId:@"tencent222222" andDelegate:self];
    }

    return self;
}

- (BOOL)isLogin {
    return _isLogin;
}

- (void)logOut {
    [_oauth logout:self];
    _isLogin = NO;
}

+ (nonnull instancetype)sharedLogin {
    static GTLogin *login;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        login = [[GTLogin alloc]init];
    });
    return login;
}

- (void)loginWithFinishBlock:(nonnull GTLoginFinishBlock)finishBlock {
    _finishBlock = [finishBlock copy];
    _oauth.authMode = kAuthModeClientSideToken;
    [_oauth authorize:@[kOPEN_PERMISSION_GET_USER_INFO,
                        kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                        kOPEN_PERMISSION_ADD_ALBUM,
                        kOPEN_PERMISSION_ADD_TOPIC,
                        kOPEN_PERMISSION_CHECK_PAGE_FANS,
                        kOPEN_PERMISSION_GET_INFO,
                        kOPEN_PERMISSION_GET_OTHER_INFO,
                        kOPEN_PERMISSION_LIST_ALBUM,
                        kOPEN_PERMISSION_UPLOAD_PIC,
                        kOPEN_PERMISSION_GET_VIP_INFO,
                        kOPEN_PERMISSION_GET_VIP_RICH_INFO]];
}


#pragma mark - delegate

- (void)tencentDidLogin {
    _isLogin = YES;
    [_oauth getUserInfo];
}

- (void)tencentDidNotLogin:(BOOL)cancelled {
    if(_finishBlock){
        _finishBlock(NO);
    }
}

- (void)tencentDidNotNetWork {
}

-(void) getUserInfoResponse:(APIResponse*) response{
    NSDictionary *userInfo = response.jsonResponse;
    _nick = userInfo[@"nickname"];
    _address = userInfo[@"city"];
    _avatarUrl = userInfo[@"figureurl_qq_2"];
    if(_finishBlock){
        _finishBlock(YES);
    }
}

#pragma mark - share

- (void)shareToQQWithArticleUrl:(nonnull NSURL *)articleUrl {
}


@end
