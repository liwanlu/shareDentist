//
//  LKNavigationController.h
//  HuaDuShopping5.1
//
//  Created by 李剑锋 on 14-3-8.
//  Copyright (c) 2014年 花都快购. All rights reserved.
//

#import <UIKit/UIKit.h>
//window窗口
#define WINDOW  [[UIApplication sharedApplication] keyWindow]

@interface LKNavigationController : UINavigationController<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
{
    CGPoint startTouch;//拖动时的开始坐标
    BOOL isMoving;//是否在拖动中
    UIView *blackMask;//那层黑面罩
    
    UIImageView *lastScreenShotView;//截图
    
    UIPanGestureRecognizer *panGesture;
    
}
@property (nonatomic,retain) UIView *backgroundView;//背景
@property (nonatomic,retain) NSMutableArray *screenShotsList;//存截图
@property (nonatomic,getter = isGestureRecognizerEnable) BOOL gestureRecognizerEnable;
@end
