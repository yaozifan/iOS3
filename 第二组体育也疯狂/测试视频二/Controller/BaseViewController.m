//
//  BaseViewController.m
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"Red.jpg"];
}
- (void)showMBProgressHUD:(NSString*)title
{
    if (_hud == nil) {
        
        _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
    }
    [_hud show:YES];
    _hud.labelText = title;
    
}
- (void)showMBProgressHUDMod:(NSString*)title
{
    _hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    //阴影的类型
    _hud.mode = MBProgressHUDModeDeterminate;
    _hud.labelText = title;
    
    [_hud hide:YES afterDelay:2];
}

- (void)hideHUD
{
    [_hud hide:YES];
}

 - (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
