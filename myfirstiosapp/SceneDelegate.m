//
//  SceneDelegate.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
          self.window.windowScene = (UIWindowScene*)scene;
         
      UITabBarController *tabController =  [[UITabBarController alloc]init];
    
    ViewController *viewController = [[ViewController alloc]init];
    
    UINavigationController  *uiNavigationController1 =  [[UINavigationController alloc]initWithRootViewController:viewController];
    
//    uiNavigationController1.view.backgroundColor = [UIColor redColor];
    uiNavigationController1.tabBarItem.title = @"新闻";
    uiNavigationController1.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    uiNavigationController1.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
        
      UIViewController *uiViewController2 = [[UIViewController alloc]init];
        uiViewController2.view.backgroundColor = [UIColor yellowColor];
    uiViewController2.tabBarItem.title = @"视频";
    uiViewController2.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    uiViewController2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];


      UIViewController *uiViewController3 = [[UIViewController alloc]init];
        uiViewController3.view.backgroundColor = [UIColor greenColor];
    uiViewController3.tabBarItem.title = @"推荐";
    uiViewController3.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
    uiViewController3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];


      UIViewController *uiViewController4 = [[UIViewController alloc]init];
        uiViewController4.view.backgroundColor = [UIColor lightGrayColor];
    uiViewController4.tabBarItem.title = @"我的";
    uiViewController4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    uiViewController4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];


        [tabController setViewControllers:@[uiNavigationController1,uiViewController2,uiViewController3,uiViewController4]];
        
      self.window.rootViewController = tabController;
      
      [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
