//
//  HomeViewController.m
//  模仿简书自定义Tabbar（纯代码）
//
//  Created by 余钦 on 16/5/30.
//  Copyright © 2016年 yuqin. All rights reserved.
//

#import "HomeViewController.h"
#import "TestViewController.h"
#import "XYDJViewController.h"
#import "ZXUser.h"
#import "ZXChatBoxController.h"

@implementation HomeViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发现";
    
    UIButton *button = [UIButton new];
    [button setTitle:@"聊天界面" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    button.frame = CGRectMake( 100, 100, 200, 40);
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIView *test=[[UIView alloc] initWithFrame:CGRectMake(10, TOPHEIGHT+10, 200, self.view.frame.size.height-TOPHEIGHT-TABBARHEIGHT-20)];
    
    test.backgroundColor=UIColorFromRGB(0x11ff0000);
    [self.view addSubview:test];
}

- (void)clickButton{
   // [self.navigationController pushViewController:[[TestViewController alloc] init] animated:YES];
    
       XYDJViewController *_chatVC = [[ XYDJViewController  alloc] init];
 
    /**
     下面的这个 TLUser 就是具体到用户的一个数据 model
     */
    ZXUser *user7 = [[ZXUser alloc] init];
    user7.username = @"文小雨";
    user7.userID = @"XB";
    user7.nikename = @"小贝";
    user7.avatarURL = @"10.jpeg";
    _chatVC.user = user7;

    [self.navigationController pushViewController:_chatVC animated:YES];
    
    
  
    
}
@end
