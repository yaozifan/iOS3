//
//  BaseViewController.h
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BaseViewController : UIViewController
{
    MBProgressHUD *_hud;
    UIView *_tipView;

}
@property (nonatomic,strong)UIView*blueView;



- (void)showMBProgressHUD:(NSString*)title;

- (void)hideHUD;
- (void)showMBProgressHUDMod:(NSString*)title;
//
@end
