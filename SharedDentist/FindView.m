//
//  FindView.m
//  SharedDentist
//
//  Created by luge on 2017/9/22.
//  Copyright © 2017年 MaiTui. All rights reserved.
//

#import "FindView.h"

@implementation FindView

-(id)initWithFrame:(CGRect)frame rootController:(MainController *)controller
{
    self=[super initWithFrame:frame rootController:controller];
    if(self)
    {
        self.backgroundColor=UIColorFromRGB(0xffffffff);
    }
    return self;
}

@end
