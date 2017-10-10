//
//  BaseViewController.m
//  LaxtonMusicPlayer
//
//  Created by Laxton on 16/9/27.
//  Copyright © 2016年 Laxton. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColorFromRGB(0xffffffff);
    // Do any additional setup after loading the view.
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    backItem.title = @"返回";
//    UIButton *backBtn = (UIButton *)backItem.customView;
//    [backBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.hidesBackButton = YES;
    
    UIButton *btn_back=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [btn_back setImage:[UIImage imageNamed:@"ic_return"] forState:UIControlStateNormal];
    [btn_back addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn_back];
    self.navigationItem.leftBarButtonItem=backItem;
}

-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 136, 20);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 99901;
    label.font = [UIFont systemFontOfSize:18.0];
    label.textColor = UIColorFromRGB(0xffffffff);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    [label sizeToFit];
    self.navigationItem.titleView = label;
    
}

-(void)dismiss
{
    [self dismissWithAnim:YES];
}

-(void)dismissWithAnim:(BOOL)anim
{
    [self.navigationController popViewControllerAnimated:anim];
}

-(void)show
{
    [self showWithAnim:YES];
}

-(void)showWithAnim:(BOOL)anim
{
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate.navigation pushViewController:self animated:anim];
    //    [self showWithType:ShowPush animated:anim];
    //    super show
}
-(void)showToast:(NSString *)msg
{
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate showToastOnMainThread:msg];
}
//-(void)showWithType:(ViewAppearType)type animated:(BOOL)anim
//{
//    _appearType = type;
//    switch (_appearType) {
//        case ShowPush:
//            [[Common shareAppDelegate].navigation pushViewController:self animated:anim];
//            break;
//        case ShowPresentModal:{
//            LKNavigationController *nav;
//            nav = [[LKNavigationController alloc] initWithRootViewController:self];
//            nav.navigationBar.translucent = NO;
//            [[Common shareAppDelegate].navigation presentViewController:nav animated:anim completion:^{
//                
//            }];
//        }
//            break;
//        default:
//            break;
//    }
//}

@end
