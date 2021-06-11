//
//  AppDelegate.m
//  QmuiCrashDemo
//
//  Created by DengKong.Sky on 2021/6/10.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import <QMUIKit/QMUIKit.h>
#import "DKNavigationController.h"


@interface AppDelegate () <UITabBarControllerDelegate>

@property (nonatomic, strong) UITabBarController *tabbarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self setupRootVc];
    
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.window makeKeyAndVisible];
    UIImage *img = [UIImage imageNamed:@"smartHomeSelectedTab"];

    FirstViewController *oneVC = [[FirstViewController alloc] init];
    SecondViewController *twoVC = [[SecondViewController alloc] init];
    ThirdViewController *threeVC = [[ThirdViewController alloc] init];
    
    DKNavigationController *firstNav = [[DKNavigationController alloc] initWithRootViewController:oneVC];
    oneVC.title = @"1";
    firstNav.navigationDelegate = oneVC;
    
    oneVC.tabBarItem.title = @"1";
    oneVC.tabBarItem.image = img;
    twoVC.tabBarItem.title = @"2";
    twoVC.tabBarItem.image = img;
    threeVC.tabBarItem.title = @"3";
    threeVC.tabBarItem.image = img;

    UITabBarController *tabbarController = [[UITabBarController alloc]init];
    tabbarController.delegate = self;
    [tabbarController setViewControllers:@[firstNav,twoVC,threeVC]];
    [tabbarController setSelectedIndex:0];
    tabbarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabbarController = tabbarController;
    self.window.rootViewController=self.tabbarController;
    
    return YES;
}

- (void)setupRootVc {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.window makeKeyAndVisible];
    
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    ThirdViewController *thirdVc = [[ThirdViewController alloc] init];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:firstVc];
    [array addObject:secondVc];
    [array addObject:thirdVc];
    
    firstVc.title = @"1";
    secondVc.title = @"2";
    thirdVc.title = @"3";
    
    firstVc.view.backgroundColor = UIColor.redColor;
    secondVc.view.backgroundColor = UIColor.blueColor;
    thirdVc.view.backgroundColor = UIColor.brownColor;
    
    UIImage *img = [UIImage imageNamed:@"smartHomeSelectedTab"];
    firstVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"1" image:img tag:0];
    secondVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"2" image:img tag:1];
    thirdVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"3" image:img tag:2];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.delegate = self;
    tab.viewControllers = array;
//    tab.tabBar.items =
    self.window.rootViewController = tab;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}
#pragma mark - UISceneSession lifecycle


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
