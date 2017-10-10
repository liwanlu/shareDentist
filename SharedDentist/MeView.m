//
//  MeView.m
//  SharedDentist
//
//  Created by luge on 2017/9/22.
//  Copyright © 2017年 MaiTui. All rights reserved.
//

#import "MeView.h"

@implementation MeView

-(id)initWithFrame:(CGRect)frame rootController:(MainController *)controller
{
    self=[super initWithFrame:frame rootController:controller];
    if(self)
    {
        self.backgroundColor=UIColorFromRGB(0xffff00ff);
    }
    return self;
}


@end
