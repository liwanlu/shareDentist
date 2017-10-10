//
//  LKNavigationController.m
//  HuaDuShopping5.1
//
//  Created by 李剑锋 on 14-3-8.
//  Copyright (c) 2014年 花都快购. All rights reserved.
//

/*
 思路：
 首先要理解UIWindow，UIWindow对象是所有UIView的根，管理和协调的应用程序的显示
 UIWindow类是UIView的子类，可以看作是特殊的UIView。
 一般应用程序只有一个UIWindow对象，即使有多个UIWindow对象，也只有一个UIWindow可以接受到用户的触屏事件。
 
 第一步：要在UIView上添加一个pan拖动的手势，并添加处发方法handlePanGesture；
 第二步：handlePanGesture方法中首先判断是不是顶级视图，是return，如果不是需要返回上一层；
 那么如何实现拖动的过程中使上层的界面显示并缩大放还有黑色渐变颜色呢，请看第三步。
 第三步：要在UIWindow上放一个屏幕大小的UIView *backgroundView，
 并且这个UIView要插入到UIWindow视图里当前UIVIew的下面，
 这个方法是[WINDOW insertSubview:self.backgroundView belowSubview:self.view];
 然后在backgroundView上要两个view：一个是上一层的界面，一个是改变透明值的UIView；
 改变透明值的UIView,也就是普通的UIView,背景颜色为黑色，拖动的过程中不断的改变透明值颜色。
 上一层的界面，说白了也就是一个图片，就是当你push进去一个界面之前，先把当前的UIVIew转化成UIImage（另一种说法是截屏），放到一个NSMutableArray数组中，每次拖动时就从数组中取出最后一个图片并添加到backgroundView上，根据拖动大小缩放该图片大小。最后把他插入到backgroundView中并且在改变透明值UIView的下面。
 [self.backgroundView insertSubview:lastScreenShotView belowSubview:blackMask];
 ok！可能这样写，你会一头雾水，那还是直接看代码吧。
 
 注意：截屏的方法，- (UIImage *)ViewRenderImage
 
 */

#import "LKNavigationController.h"
#import <QuartzCore/QuartzCore.h>

@interface LKNavigationController ()

@end

@implementation LKNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 只少2个 头一个肯定是顶级的界面
        self.screenShotsList = [[NSMutableArray alloc] initWithCapacity:2];
        
    }
    return self;
}

-(id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        // 只少2个 头一个肯定是顶级的界面
        self.screenShotsList = [[NSMutableArray alloc] initWithCapacity:2];
    }
    return self;
}

-(instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass
{
    self = [super initWithNavigationBarClass:navigationBarClass toolbarClass:toolbarClass];
    if (self) {
        // 只少2个 头一个肯定是顶级的界面
        self.screenShotsList = [[NSMutableArray alloc] initWithCapacity:2];
    }
    
    return self;
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (_gestureRecognizerEnable) {
        return YES;
    } else {
        return NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _gestureRecognizerEnable = YES;
    //拖动手势
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    self.delegate = self;
    panGesture.delegate = self;
    //添加手势
    [self.view addGestureRecognizer:panGesture];
    
    //是否开始拖动
    isMoving = NO;
}

//拖动手势
-(IBAction)handlePanGesture:(UIGestureRecognizer*)sender{
    
    //如果是顶级viewcontroller，结束
    if (self.viewControllers.count <= 1) return;
    
    //得到触摸中在window上拖动的过程中的xy坐标
    CGPoint translation=[sender locationInView:WINDOW];
    //状态结束，保存数据
    if(sender.state == UIGestureRecognizerStateEnded){
        isMoving = NO;
        NSLog(@"结束%f,%f", translation.x, translation.y);
        
        self.backgroundView.hidden = NO;
        //如果结束坐标大于开始坐标50像素就动画效果移动
        if (translation.x - startTouch.x > 50) {
            [UIView animateWithDuration:0.3 animations:^{
                //动画效果，移动
                [self moveViewWithX:320];
            } completion:^(BOOL finished) {
                //返回上一层
                [self popViewControllerAnimated:NO];
                //并且还原坐标
                CGRect frame = self.view.frame;
                frame.origin.x = 0;
                self.view.frame = frame;
            }];
            
        }else{
            //不大于50时就移动原位
            [UIView animateWithDuration:0.3 animations:^{
                //动画效果
                [self moveViewWithX:0];
            } completion:^(BOOL finished) {
                //背景隐藏
                self.backgroundView.hidden = YES;
            }];
        }
        return;
        
    }else if(sender.state == UIGestureRecognizerStateBegan){
        NSLog(@"开始%f,%f",translation.x,translation.y);
        //开始坐标
        startTouch = translation;
        //是否开始移动
        isMoving = YES;
        if (!self.backgroundView)
        {
            //添加背景
            CGRect frame = self.view.frame;
            self.backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)];
            //把backgroundView插入到Window视图上，并below低于self.view层
            [WINDOW insertSubview:self.backgroundView belowSubview:self.view];
            
            //在backgroundView添加黑色的面罩
            blackMask = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)];
            blackMask.backgroundColor = [UIColor blackColor];
            [self.backgroundView addSubview:blackMask];
        }
        self.backgroundView.hidden = NO;
        
        if (lastScreenShotView) [lastScreenShotView removeFromSuperview];
        
        //数组中最后截图
        UIImage *lastScreenShot = [self.screenShotsList lastObject];
        //并把截图插入到backgroundView上，并黑色的背景下面
        lastScreenShotView = [[UIImageView alloc]initWithImage:lastScreenShot];
        [self.backgroundView insertSubview:lastScreenShotView belowSubview:blackMask];
        
    }
    
    if (isMoving) {
        [self moveViewWithX:translation.x - startTouch.x];
        
    }
}
- (void)moveViewWithX:(float)x
{
    //NSLog(@"Move to:%f",x);
    x = x > 320 ? 320 : x;
    x = x < 0 ? 0 : x;
    
    CGRect frame = self.view.frame;
    frame.origin.x = x;
    self.view.frame = frame;
    
    float scale = ( x / 6400 ) + 0.95;//缩放大小
    float alpha = 0.4 - ( x / 800);//透明值
    
    //缩放scale
    lastScreenShotView.transform = CGAffineTransformMakeScale(scale, scale);
    //背景颜色透明值
    blackMask.alpha = alpha;
    
}

//把UIView转化成UIImage，实现截屏
- (UIImage *)ViewRenderImage
{
    //创建基于位图的图形上下文 Creates a bitmap-based graphics context with the specified options.:UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale),size大小，opaque是否透明，不透明（YES），scale比例缩放
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    
    [self.view.layer setMasksToBounds:YES];
    self.view.layer.cornerRadius = 2.5;
    
    //当前层渲染到上下文
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    self.view.layer.cornerRadius = 0.0;
    
    //上下文形成图片
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    //结束并删除当前基于位图的图形上下文。
    UIGraphicsEndImageContext();
    //反回图片
    return img;
}

#pragma Navagation 覆盖方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //图像数组中存放一个当前的界面图像，然后再push
    [self.screenShotsList addObject:[self ViewRenderImage]];
    [super pushViewController:viewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    //移除最后一个
    [self.screenShotsList removeLastObject];
    return [super popViewControllerAnimated:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
