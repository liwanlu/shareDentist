//
//  MainTabBarButton.m
//  cmbfaeApp
//
//  Created by 余钦 on 16/4/7.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "MainTabBarButton.h"


//image ratio
#define TabBarButtonImageRatio 0.6


@implementation MainTabBarButton
{
    UILabel *lab_badgeVaule;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //只需要设置一次的放置在这里
        self.imageView.contentMode = UIViewContentModeBottom;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor colorWithRed:205/255.0f green:89/255.0f blue:75/255.0f alpha:1.0] forState:UIControlStateSelected];

        [self setTitleColor:[UIColor colorWithRed:117/255.0f green:117/255.0f blue:117/255.0f alpha:1.0] forState:UIControlStateNormal];

    }
    return self;
}


//重写该方法可以去除长按按钮时出现的高亮效果
- (void)setHighlighted:(BOOL)highlighted
{
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height*TabBarButtonImageRatio;
    
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height*TabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    _tabBarItem = tabBarItem;
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
}
-(void) createBadgeValueView
{
     NSLog(NSStringFromCGRect(self.frame));
    if(lab_badgeVaule==nil)
    {
        lab_badgeVaule=[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2+10, 5, 24, 13)];
        lab_badgeVaule.backgroundColor=UIColorFromRGB(0xffff0000);
        lab_badgeVaule.textColor=UIColorFromRGB(0xffffffff);
        lab_badgeVaule.font=FONTNORMAL(11);
        lab_badgeVaule.textAlignment=NSTextAlignmentCenter;
        lab_badgeVaule.clipsToBounds = YES;
        lab_badgeVaule.layer.cornerRadius = 6;
        [self addSubview:lab_badgeVaule];
        lab_badgeVaule.hidden=YES;
    }
}
-(void) setBadgeValue:(NSString *)badgeValue
{
    if(badgeValue==nil||[badgeValue isEqualToString:@""])
    {
        [lab_badgeVaule setHidden:YES];
    }
    else
    {
        [lab_badgeVaule setHidden:NO];
        [lab_badgeVaule setText:badgeValue];
    }
}
@end
