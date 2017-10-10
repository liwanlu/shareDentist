//
//  MainController.m
//  SharedDentist
//
//  Created by luge on 2017/9/22.
//  Copyright © 2017年 MaiTui. All rights reserved.
//

#import "MainController.h"
#import "MessageView.h"
#import "MaiTuiView.h"
#import "FindView.h"
#import "MeView.h"
#import "LWBarButton.h"

#define BottomHeight                50
@interface MainController ()

@end

@implementation MainController
{
    MessageView *messageView;
    MaiTuiView *maituiView;
    FindView *findView;
    MeView *meView;
    UIScrollView *scrollView_main;
    UIView *view_bottom;
}
//懒加载四个VC
-(MessageView *)getMessageView{
    if (messageView==nil) {
        messageView = [[MessageView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT, self.view.frame.size.width, self.view.frame.size.height-BottomHeight-TOPHEIGHT) rootController:self];
    }
    return messageView;
}
-(MaiTuiView *)getMaituiView{
    if (maituiView==nil) {
        maituiView = [[MaiTuiView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT, self.view.frame.size.width, self.view.frame.size.height-BottomHeight-TOPHEIGHT) rootController:self];
    }
    return maituiView;
}

-(FindView *)getFindView{
    if (findView==nil) {
        findView = [[FindView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT, self.view.frame.size.width, self.view.frame.size.height-BottomHeight-TOPHEIGHT) rootController:self];
    }
    return findView;
}

-(MeView *)getMeView{
    if (meView==nil) {
        meView = [[MeView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT, self.view.frame.size.width, self.view.frame.size.height-BottomHeight-TOPHEIGHT) rootController:self];
    }
    return meView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColorFromRGB(0xffffffff);
    
    
//    JXButton *btn=[[JXButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    btn.backgroundColor=UIColorFromRGB(0xffff00ff);
//    [btn setTitle:@"test" forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"tabbar_mainframe"] forState:UIControlStateNormal];
//    [self.view addSubview:btn];
    
//    LWBarButton *button=[[LWBarButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
//    button.backgroundColor=UIColorFromRGB(0xffe4e4e4);
//    [button setTitle:@"test" forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"tabbar_mainframe"] forState:UIControlStateNormal];
//    [self.view addSubview:button];
    
    
    
    UIButton *button222 = [UIButton buttonWithType:UIButtonTypeCustom];
    button222.frame = CGRectMake(100,100, 40, 40);
    
    
    
    CGSize size1 = [@"测试" sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(MAXFLOAT, button222.titleLabel.frame.size.height)];
    
    button222.titleEdgeInsets =UIEdgeInsetsMake(0.5 * [UIImage imageNamed:@"tabbar_mainframe"].size.height, -0.5 * [UIImage imageNamed:@"tabbar_mainframe"].size.width, -0.5 * [UIImage imageNamed:@"tabbar_mainframe"].size.height, 0.5 * [UIImage imageNamed:@"tabbar_mainframe"].size.width);
    
    button222.imageEdgeInsets =UIEdgeInsetsMake(-0.5 * size1.height, 0.5 * size1.width, 0.5 * size1.height, -0.5 * size1.width);

    
    
    button222.adjustsImageWhenHighlighted = NO;
    [button222 setImage:[UIImage imageNamed:@"tabbar_mainframe"] forState:UIControlStateNormal];
    [button222 setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateHighlighted];
    //[button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button222 setTitle:@"测试" forState: UIControlStateNormal];
    [button222 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button222.backgroundColor=UIColorFromRGB(0x22000000);
    [self.view addSubview:button222];
    
    
    view_bottom=[[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 60)];
    view_bottom.backgroundColor=UIColorFromRGB(0xffe4e4e4);
    [self.view addSubview:view_bottom];
    
    LWBarButton *btn_char=[[LWBarButton alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    btn_char.backgroundColor=[UIColor clearColor];
    [btn_char setTitle:@"聊天" forState:UIControlStateNormal];
    [btn_char setTitleColor:UIColorFromRGB(0xffffff00) forState:UIControlStateNormal];
    [btn_char setTitleColor:UIColorFromRGB(0xffff00ff) forState:UIControlStateSelected];
    [btn_char setImage:[UIImage imageNamed:@"tabbar_mainframe"] forState:UIControlStateNormal];
    [btn_char setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateSelected];
    [view_bottom addSubview:btn_char];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setScrollView
{
    scrollView_main=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-BottomHeight)];
    
    scrollView_main.pagingEnabled = YES;
    scrollView_main.showsHorizontalScrollIndicator = NO;
    scrollView_main.showsVerticalScrollIndicator = NO;
    
    
    NSArray *views = @[[self getMessageView],[self getMaituiView],[self getFindView],[self getMeView]];
    for (int i = 0; i < views.count; i++){
        //添加背景，把三个VC的view贴到mainScrollView上面
        UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, scrollView_main.frame.size.width, scrollView_main.frame.size.height)];
        [pageView addSubview:views[i]];
        [scrollView_main addSubview:pageView];
    }
    scrollView_main.contentSize = CGSizeMake(self.view.frame.size.width * (views.count), 0);
    scrollView_main.delegate=self;
    [self.view addSubview:scrollView_main];
}
//手动滑动后触发，设置当前选中页面的tag
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double index_ = scrollView.contentOffset.x / self.view.frame.size.width;
    //int realIndex=(int)(index_+0.5)+1;
    if(index_==0||index_==1||index_==2)
    {
        [self sliderAnimationWithTag:index_+1];
    }
    
    
}
-(void) sliderAnimationWithTag:(NSInteger)tag
{
    //通过tag设置底部标签的样式
}
-(UIButton *)buttonWithTag:(NSInteger)tag{
    //根据tag返回对于的标签
    return nil;
}
-(void)sliderAction:(UIButton *)sender{
    //[self sliderAnimationWithTag:sender.tag];
    //[self sliderAnimationWithTag:sender.tag];
    [UIView animateWithDuration:0.3 animations:^{
        scrollView_main.contentOffset = CGPointMake(scrollView_main.frame.size.width*(sender.tag-1), 0);
    } completion:^(BOOL finished) {
        
    }];
    
}
@end
