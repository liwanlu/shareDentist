//
//  MainTabBarController.m
//  模仿简书自定义Tabbar（纯代码）
//
//  Created by 余钦 on 16/5/30.
//  Copyright © 2016年 yuqin. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MainNavigationController.h"
#import "MainTabBar.h"


@interface MainTabBarController ()<MainTabBarDelegate>
@property(nonatomic, weak)MainTabBar *mainTabBar;
@property(nonatomic, strong)HomeViewController *homeVc;
@property(nonatomic, strong)HomeViewController *subscriptionVc;
@property(nonatomic, strong)HomeViewController *notificationVc;
@property(nonatomic, strong)HomeViewController *meVc;
@end

@implementation MainTabBarController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self SetupMainTabBar];
    [self SetupAllControllers];
   
}
//清空自带的tabbar控件
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
//加入自定义的
- (void)SetupMainTabBar{
    MainTabBar *mainTabBar = [[MainTabBar alloc] init];
    mainTabBar.frame = self.tabBar.bounds;
    mainTabBar.delegate = self;
    [self.tabBar addSubview:mainTabBar];
    _mainTabBar = mainTabBar;
}

- (void)SetupAllControllers{
    NSArray *titles = @[@"消息", @"脉推", @"发现", @"我"];
    NSArray *images = @[@"tabbar_mainframe", @"tabbar_contacts", @"tabbar_discover", @"tabbar_me"];
    NSArray *selectedImages = @[@"tabbar_mainframeHL", @"tabbar_contactsHL", @"tabbar_discoverHL", @"tabbar_meHL"];
    
    HomeViewController * homeVc = [[HomeViewController alloc] init];
    self.homeVc = homeVc;
    
    HomeViewController * subscriptionVc = [[HomeViewController alloc] init];
    self.subscriptionVc = subscriptionVc;
    
    HomeViewController * notificationVc = [[HomeViewController alloc] init];
    self.notificationVc = notificationVc;
    
    HomeViewController * meVc = [[HomeViewController alloc] init];
    self.meVc = meVc;
  
    
    NSArray *viewControllers = @[homeVc, subscriptionVc, notificationVc, meVc];
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *childVc = viewControllers[i];
        [self SetupChildVc:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}

- (void)SetupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.mainTabBar addTabBarButtonWithTabBarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
}



#pragma mark --------------------mainTabBar delegate
- (void)tabBar:(MainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag{
    self.selectedIndex = toBtnTag;
    if(toBtnTag>0)
    {
         [_mainTabBar setBadgeValue:@"2" andIndex:toBtnTag];
    }
}

- (void)tabBarClickWriteButton:(MainTabBar *)tabBar{
//    WriteViewController *writeVc = [[WriteViewController alloc] init];
//    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:writeVc];
//
//    [self presentViewController:nav animated:YES completion:nil];
}
@end
