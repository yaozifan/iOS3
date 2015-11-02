//
//  VersionViewController.m
//  测试视频二
//
//  Created by mac on 15/10/18.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "VersionViewController.h"

@interface VersionViewController ()

@end

@implementation VersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, 330, 200)];
   // lable.backgroundColor = [UIColor redColor];
    
    lable.numberOfLines = 0;
    
    lable.text = _str;
    
    
    [self.view addSubview:lable];
    
    
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
