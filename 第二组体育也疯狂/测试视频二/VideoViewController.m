//
//  VideoViewController.m
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#import "VideoViewController.h"
#import "BaseVideoController.h"
@interface VideoViewController ()
{
    BaseVideoController*currentViewController;
    NSMutableArray*btnArray;
}
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    btnArray = [[NSMutableArray alloc] init];
    [self creatBlueButton];
    [self creatController];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Red.jpg"]];
    
}
- (void)creatBlueButton
{
    NSArray*array = @[@"中超",@"亚冠",@"欧冠",@"CBA"];
    CGFloat x =kScreenWidth/array.count;
    for (int i =0; i<array.count; i++) {
        
        Mybutton*button = [Mybutton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button setTitle:array[i] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        button.frame = CGRectMake(i*x, 64, x, 50);
        [button addTarget:self action:@selector(onClickbutton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [btnArray addObject:button];
    }
}

- (void)creatController
{
    BaseVideoController*vc1 = [[BaseVideoController alloc]init];

    vc1.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc1.url = @"698";
    [self addChildViewController:vc1];
    
    BaseVideoController*vc2 = [[BaseVideoController alloc]init];

    
    vc2.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc2.url = @"699";

    [self addChildViewController:vc2];
    
    
    BaseVideoController*vc3 = [[BaseVideoController alloc]init];

    vc3.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc3.url = @"700";

    [self addChildViewController:vc3];
    
    
    BaseVideoController*vc4 = [[BaseVideoController alloc]init];

    vc4.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc4.url = @"701";
    
    [self addChildViewController:vc4];
    
    
    //================================
    
    [self.view addSubview:vc1.view];
    Mybutton*button =  btnArray[0];
    button.selected = YES;
    _willButton = button;
    
    currentViewController = vc1;

}

- (void)onClickbutton:(Mybutton*)btn
{
    
    BaseVideoController*vc1 = [self.childViewControllers objectAtIndex:0];
    
    BaseVideoController*vc2 = [self.childViewControllers objectAtIndex:1];
    BaseVideoController*vc3 = [self.childViewControllers objectAtIndex:2];
    BaseVideoController*vc4 = [self.childViewControllers objectAtIndex:3];
    if (((currentViewController == vc1&&btn.tag==0)||(currentViewController ==vc2&&btn.tag==1)||(currentViewController ==vc3&&btn.tag ==2)||(currentViewController == vc4&&btn.tag==3))) {
        return;
    }
    else
    {
        BaseVideoController*oldController = currentViewController;
        switch (btn.tag) {
            case 0:{
                
                [self btnSelect:btn];
                [self transitionFromViewController:currentViewController toViewController:vc1 duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
                    
                } completion:^(BOOL finished) {
                    if (finished) {
                        currentViewController = vc1;
                    }else{
                        currentViewController = oldController;
                    }
                }];}
                break;
            case 1:{
                [self btnSelect:btn];

                [self transitionFromViewController:currentViewController toViewController:vc2 duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
                    
                } completion:^(BOOL finished) {
                    if (finished) {
                        currentViewController = vc2;
                    }else{
                        currentViewController = oldController;
                    }
                }];
            }
                break;
            case 2:{
                [self btnSelect:btn];


                [self transitionFromViewController:currentViewController toViewController:vc3 duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
                    
                } completion:^(BOOL finished) {
                    if (finished) {
                        currentViewController = vc3;
                    }else{
                        currentViewController = oldController;
                    }
                }];
            }
                break;
            default:{
                [self btnSelect:btn];

                [self transitionFromViewController:currentViewController toViewController:vc4 duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
                    nil;
                } completion:^(BOOL finished) {
                    if (finished) {
                        currentViewController = vc4;
                    }else{
                        currentViewController = oldController;
                    }
                }];
                
            }
                break;
        }
    }
    
}


- (void)btnSelect:(Mybutton*)btn
{
    _willButton.selected = NO;
    
    btn.selected = YES;
    
    _willButton = btn;

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
