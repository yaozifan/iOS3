//
//  NewsViewController.m
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsXController.h"
@interface NewsViewController ()
{
    BaseNewsViewController* currentViewController;
    NSMutableArray*btnArray;

}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    btnArray = [[NSMutableArray alloc] init];
    [self creatBlueButton];
    [self creatController];
}
- (void)creatBlueButton
{
    NSArray*array = @[@"头条",@"足球",@"篮球",@"综合"];
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
    BaseNewsViewController*vc1 = [[BaseNewsViewController alloc]init];
    vc1.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc1.a = @"headline";
    vc1.catid = @"a";
    [self addChildViewController:vc1];
    
    BaseNewsViewController*vc2 = [[BaseNewsViewController alloc]init];
    
    vc2.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc2.a = @"getList";
    vc2.catid = @"6";
    
    [self addChildViewController:vc2];
    
    
    BaseNewsViewController*vc3 = [[BaseNewsViewController alloc]init];
  
    vc3.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc3.a = @"getList";

    vc3.catid = @"7";
    
    [self addChildViewController:vc3];
    
    
    BaseNewsViewController*vc4 = [[BaseNewsViewController alloc]init];
    vc4.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc4.a = @"getList";

    vc4.catid = @"12";
    
    [self addChildViewController:vc4];
    
    [self.view addSubview:vc1.view];
    
    Mybutton*button =  btnArray[0];
    button.selected = YES;
    _willButton = button;
    
    currentViewController = vc1;
    
}

- (void)onClickbutton:(Mybutton*)btn
{
    
    BaseNewsViewController*vc1 = [self.childViewControllers objectAtIndex:0];
    
    BaseNewsViewController*vc2 = [self.childViewControllers objectAtIndex:1];
    BaseNewsViewController*vc3 = [self.childViewControllers objectAtIndex:2];
    BaseNewsViewController*vc4 = [self.childViewControllers objectAtIndex:3];
    if (((currentViewController == vc1&&btn.tag==0)||(currentViewController ==vc2&&btn.tag==1)||(currentViewController ==vc3&&btn.tag ==2)||(currentViewController == vc4&&btn.tag==3))) {
        return;
    }
    else
    {
        BaseNewsViewController*oldController = currentViewController;
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
