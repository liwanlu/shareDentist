//
//  AppDelegate.h
//  SharedDentist
//
//  Created by luge on 2017/9/22.
//  Copyright © 2017年 MaiTui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic, readonly) LKNavigationController *navigation;
-(void)showToastOnMainThread:(NSString *)message;
@end

