//
//  BaseViewController.h
//  LaxtonMusicPlayer
//
//  Created by Laxton on 16/9/27.
//  Copyright © 2016年 Laxton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
-(void)dismiss;
-(void)dismissWithAnim:(BOOL)anim;
-(void)show;
-(void)showWithAnim:(BOOL)anim;
-(void) showToast:(NSString *)msg;
@end
