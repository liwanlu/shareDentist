//
//  Constants.h
//  testNew
//
//  Created by jsb on 15/4/14.
//  Copyright (c) 2015年 liwanlu. All rights reserved.
//
#import <Foundation/Foundation.h>
//#ifndef testNew_Constants_h
//#define testNew_Constants_h

#define TESTMODEL YES

#define APPNAME             [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey]
#define CURRENTVERSION      [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey]
//版本号不带构建版本
#define CURRENTVERSION_S      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//ios平台兼容
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhonePlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080,1920), [[UIScreen mainScreen] currentMode].size) : NO)



#define IOS8   [[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0 ? YES : NO
#define IOS7_1 [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.1 ? YES : NO
#define IOS7   [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0 ? YES : NO
#define IOS6   [[[UIDevice currentDevice] systemVersion] doubleValue] >= 6.0 ? YES : NO
#define IOS6_PRE   [[[UIDevice currentDevice] systemVersion] doubleValue] <= 6.0 ? YES : NO
#define IOS5   [[[UIDevice currentDevice] systemVersion] doubleValue] >= 5.0 ? YES : NO
#define IOS5_PRE   [[[UIDevice currentDevice] systemVersion] doubleValue] <= 5.0 ? YES : NO

//颜色宏
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:((float)((rgbValue & 0xFF000000) >> 24)) / 255.0]


#define FONTNORMAL(size)                    [UIFont systemFontOfSize:size]
#define FONTBOLD(size)                      [UIFont boldSystemFontOfSize:size]

////常用颜色
//#define CLEARCOLOR                           [UIColor clearColor]
//#define WHITECOLOR                           [UIColor whiteColor]
//#define BLACKCOLOR                           [UIColor blackColor]
//
//#define TEXTDEEPCOLOR                        UIColorFromRGB(0xff444444)
//
//#define SEPARATORLINECOLOR                   UIColorFromRGB(0xffe4e4e4)
//#define TEXTREDCOLOR                         UIColorFromRGB(0xffc20303)//UIColorFromRGB(0xffc20303)
//#define TEXTDARKCOLOR                        UIColorFromRGB(0xff656565)
//#define TEXTLIGHTCOLOR                       UIColorFromRGB(0xff808080)
//#define BOTTOMLINECOLOR                      UIColorFromRGB(0xffaaaaaa)
//#define TEXTREDPRESSCOLOR                    UIColorFromRGB(0xff670101)
//#define CONTENTTEXTCOLOR                     UIColorFromRGB(0xff808080)
//#define TITLETEXTCOLOR                       UIColorFromRGB(0xffffffff)
//#define APPBACKGROUNDCOLOR                   UIColorFromRGB(0xfff6f6f6)
//#define USERCENTERSEPARATORLINECOLOR         UIColorFromRGB(0xffe1e1de)
//#define VIEWGRAYBACKGROUND                   UIColorFromRGB(0xfff6f6f6)
//#define TEXTFIELDTEXTCOLOR                   UIColorFromRGB(0xff5b5b5b)
//#define COLOR_LIGHT_GREEN                    UIColorFromRGB(0xff81be20)

//#define SUCCESS                  0
//#define FAILED                   1
//#define SUCCESS_EMPTYDATA        -1
//
//#define LOADINGDELAYTIME         1//加载动画延时时间
//#define REQUESTTIMEOUT           10 //网络连接超时时间

#define MONEY             @"￥" //钱符号
//常用字体
#define FONTNORMAL(size)                    [UIFont systemFontOfSize:size]
#define FONTBOLD(size)                      [UIFont boldSystemFontOfSize:size]

//常用UI参赛
#define VIEWWIDTH(view)                     CGRectGetWidth(view.frame)
#define VIEWHEIGHT(view)                    CGRectGetHeight(view.frame)
#define VIEWMAXX(view)                      CGRectGetMaxX(view.frame)
#define VIEWMAXY(view)                      CGRectGetMaxY(view.frame)
#define SEPARATORLINEHEIGHT                 0.5

//常用UI设置
#define SET_BUTTONREDBOLDER(button)         button.layer.borderWidth=1;button.layer.borderColor=UIColorFromRGB(0xffc20303).CGColor;button.layer.cornerRadius=5;
#define SET_BUTTONDARKBOLDER(button)         button.layer.borderWidth=1;button.layer.borderColor=UIColorFromRGB(0xff656565).CGColor;button.layer.cornerRadius=5;
#define SET_IMAGEWHITEBOLDER(button)         button.layer.borderWidth=1;button.layer.borderColor=UIColorFromRGB(0xffffffff).CGColor;
//#endif

#define LOAD_LABEL                     NSLocalizedString(@"请稍后..",)
#define REFRESH_LOADING_STATUS         NSLocalizedString(@"加载中...",)
#define REFRESH_PULL_DOWN_STATUS       NSLocalizedString(@"下拉可以刷新...",)
#define REFRESH_RELEASED_STATUS        NSLocalizedString(@"松开即刷新...",)
#define REFRESH_UPDATE_TIME_PREFIX     NSLocalizedString(@"最后更新: ",)
#define REFRESH_PULL_UP                NSLocalizedString(@"上拉加载更多",)

#define ICONEMPTY                           [UIImage imageNamed:@"default_logo"]

//
//#define PRODUCTDETAIL       TESTMODEL == YES?@"http://t-hdkg.9skg.com/WebApp/product/1_6_0/%@?nowtime=%@&p=1&cnum=%d&userId=%@":@"http://hdkg.9skg.com/WebApp/product/1_6_0/%@?nowtime=%@&p=1&cnum=%d&userId=%@"


#define IP5HEIGHT                568
#define IP4HEIGHT                480
#define IPWIDTH                  320
#define BOTTOMBARHEIGHT          46
#define STATUSBARHEIGHT          20
#define NAVBARHEIGHT             44
#define PAGESIZE                 20
#define TOPHEIGHT       ((IOS7) == YES?64:44)
#define TABBARHEIGHT     49
#define BODERWIDTH       1

//typedef NS_ENUM(NSInteger, DeliveryBy){
//    /*
//     1-9秒速递，2-到店自提, 3-商家配送
//     */
//    DeliveryByPlatform = 1,
//    DeliveryByCustomer = 2,
//    DeliveryByShop = 3,
//};
//typedef NS_ENUM(NSInteger, OrderStatusType){
//    OrderStatusNotActive = 0,   //待付款
//    OrderStatusNotDeliver = 1,  //未确定
//    OrderStatusCancel = 2,      //已取消
//    OrderStatusDelivered = 3,   //已发货
//    OrderStatusFinished = 4,    //已完成
//    OrderStatusInvalid = 5,     //已作废
//    OrderStatusAll = 6,
//};
//typedef NS_ENUM(NSInteger, PayChannelType){
//    PayOffline = 1, //货到付款
//    PayOnline = 2   //在线支付
//};
//typedef NS_ENUM(NSInteger, OrderPayStatusType){
//    OrderPayStatusNotPaid = 0,      //未支付
//    OrderPayStatusPaid = 1,         //已支付
//    OrderPayStatusWaitRefund = 2,   //待退款
//    OrderPayStatusRefund = 3        //已退款
//};
