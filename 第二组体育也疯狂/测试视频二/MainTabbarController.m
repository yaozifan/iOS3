//
//  MainTabbarController.m
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MainTabbarController.h"
#import "BaseNavController.h"
@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self creatViewControllers];
 
    
    
}
- (void)outherController:(UIButton*)btn
{
    _willButton.selected = NO;
    
    btn.selected = YES;
    
    _willButton = btn;
    switch (btn.tag) {
        case 0:
            self.selectedIndex = 0;
            break;
        case 1:
            self.selectedIndex = 1;
            break;
        case 2:
            self.selectedIndex = 2;
            break;
        case 3:
            self.selectedIndex = 3;
            break;
        default:
            break;
    }

 }

- (void)creatViewControllers
{
    
    NSArray *controllers = @[@"Video",@"News",@"Gallery",@"More"];
    NSArray *imageArray = @[@"tabbar_video@2x",@"tabbar_news@2x",@"tabbar_picture@2x",@"tabbar_setting@2x"];
    
    NSArray*selecImage = @[@"tabbar_video_hl@2x",@"tabbar_news_hl@2x",@"tabbar_picture_hl@2x",@"tabbar_setting_hl@2x"];
    
    NSArray *titleArray = @[@"视频",@"新闻",@"图库",@"其他"];

    NSMutableArray *navControllers =[[NSMutableArray alloc] initWithCapacity:controllers.count];
    
    for (int i =0; i<4; i++) {
        
        NSString*str = controllers[i];
        
        UIStoryboard*story = [UIStoryboard storyboardWithName:str bundle:[NSBundle mainBundle]];
        
        BaseNavController *nav = [story instantiateInitialViewController];
        
        [navControllers addObject:nav];
    }
    
    self.viewControllers = navControllers;
    
    
    
    UITabBar *bar = self.tabBar;
    
//    UITabBarItem*item0 = [bar.items objectAtIndex:0];
//    UITabBarItem*item1 = [bar.items objectAtIndex:1];
//    UITabBarItem*item2 = [bar.items objectAtIndex:2];
//    UITabBarItem*item3 = [bar.items objectAtIndex:3];
    for (int i =0; i<4; i++) {
        UITabBarItem *itemx =  [bar.items objectAtIndex:i];
        NSString*str = imageArray[i];
        NSString*selectStr = selecImage[i];
        UIImage *selectImage = [UIImage imageNamed:selectStr];
        itemx.image = [UIImage imageNamed:str];
        itemx.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        itemx.title = titleArray[i];

        //设置tabbar按钮颜色
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    }
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
