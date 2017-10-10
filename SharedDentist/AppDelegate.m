//
//  AppDelegate.m
//  SharedDentist
//
//  Created by luge on 2017/9/22.
//  Copyright © 2017年 MaiTui. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    MainTabBarController *mainViewController = [MainTabBarController new];
    
//    _navigation=[[LKNavigationController alloc] initWithRootViewController:mainViewController];
//    _navigation.navigationBar.barTintColor=UIColorFromRGB(0xff00a4b0);
//    _navigation.navigationBar.barStyle = UIBarStyleBlack;
    self.window.rootViewController=mainViewController;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)showToastOnMainThread:(NSString *)message
{
    [self performSelectorOnMainThread:@selector(showToast:) withObject:message waitUntilDone:NO];
}
#pragma mark -- 显示提示视图 --
-(void)showToast:(NSString*)message
{
//    MBProgressHUD *mbProgressHUD = [[MBProgressHUD alloc] initWithView:self.window];
//    [self.window addSubview:mbProgressHUD];
//    mbProgressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] ;
//    mbProgressHUD.mode = MBProgressHUDModeCustomView;
//    mbProgressHUD.labelText = message;
//    // mbProgressHUD.labelFont=FONTNORMAL(13);
//    [mbProgressHUD show:YES];
//    [mbProgressHUD hide:YES afterDelay:1];
}
@end
