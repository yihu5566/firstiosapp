//
//  AppDelegate.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "AppDelegate.h"
#import "DFSplash.h"
#import "GTLocation.h"
#import "GTNotification.h"
#import "MineViewController.h"
#import "NewsViewController.h"
#import "RecommendViewController.h"
#import "SceneDelegate.h"
#import "VideoViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UITabBarController *tabBarController =  [[UITabBarController alloc]init];

    NewsViewController *viewController = [[NewsViewController alloc]init];

    VideoViewController *videoController = [[VideoViewController alloc]init];

    RecommendViewController *recommendController = [[RecommendViewController alloc]init];

    MineViewController *mineViewController = [[MineViewController alloc]init];

    [tabBarController setViewControllers:@[viewController, videoController, recommendController, mineViewController]];

    tabBarController.delegate = self;

    UINavigationController *uiNavigationController1 =  [[UINavigationController alloc]initWithRootViewController:tabBarController];

    self.window.rootViewController = uiNavigationController1;
    [self.window makeKeyAndVisible];
    [self.window addSubview:({
        DFSplash *splash = [[DFSplash alloc]initWithFrame:self.window.bounds];
        splash;
    })];

    [[GTLocation locationManage] checkLocationAuthorization];
    [[GTNotification notificationManager]checkNotificationAuthorization];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"didSelectViewController");
    [self _changeIcon];
}

#pragma mark - change icon
- (void)_changeIcon {
    if ([UIApplication sharedApplication].supportsAlternateIcons) {
        [[UIApplication sharedApplication] setAlternateIconName:@"ICONBLACK"
                                              completionHandler:^(NSError *_Nullable error) {
            NSLog(@"");
        }];
    }
}

//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
