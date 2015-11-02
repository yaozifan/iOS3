//
//  GalleryViewController.m
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "GalleryViewController.h"
#import "BaseGalleryController.h"
@interface GalleryViewController ()
{
    BaseGalleryController*currentViewController;
    NSMutableArray*btnArray;
}
@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    btnArray = [[NSMutableArray alloc] init];
    [self creatBlueButton];
    [self creatController];
}

- (void)creatBlueButton
{
    NSArray*array = @[@"热门",@"足球",@"篮球",@"综合",@"明星"];
    CGFloat x =kScreenWidth/array.count;
    for (int i =0; i<array.count; i++) {
        
        Mybutton*button = [Mybutton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button setTitle:array[i] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.frame = CGRectMake(i*x, 64, x, 50);
        [button addTarget:self action:@selector(onClickbutton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [btnArray addObject:button];
        
    }
    
}

- (void)creatController
{
    BaseGalleryController*vc1 = [[BaseGalleryController alloc]init];
    vc1.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
     vc1.hot = @"1";
     vc1.catid = @"15";
    [self addChildViewController:vc1];
    
    BaseGalleryController*vc2 = [[BaseGalleryController alloc]init];
    
    vc2.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc2.catid = @"54";
    
    [self addChildViewController:vc2];
    
    
    BaseGalleryController*vc3 = [[BaseGalleryController alloc]init];
    
    vc3.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    
    vc3.catid = @"55";
    
    [self addChildViewController:vc3];
    
    
    BaseGalleryController*vc4 = [[BaseGalleryController alloc]init];
    vc4.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    vc4.catid = @"58";
    
    [self addChildViewController:vc4];
    BaseGalleryController*vc5 = [[BaseGalleryController alloc]init];
    vc5.view.frame = CGRectMake(0, 104,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    
    vc5.catid = @"59";
    
    [self addChildViewController:vc5];

    
    [self.view addSubview:vc1.view];
        currentViewController = vc1;
    Mybutton*button =  btnArray[0];
    button.selected = YES;
    _willButton = button;
    

    
}

- (void)onClickbutton:(Mybutton*)btn
{
    
    BaseGalleryController*vc1 = [self.childViewControllers objectAtIndex:0];
    
    BaseGalleryController*vc2 = [self.childViewControllers objectAtIndex:1];
    BaseGalleryController*vc3 = [self.childViewControllers objectAtIndex:2];
    BaseGalleryController*vc4 = [self.childViewControllers objectAtIndex:3];
    BaseGalleryController*vc5 = [self.childViewControllers objectAtIndex:4];
    if (((currentViewController == vc1&&btn.tag== 0)||(currentViewController == vc2&&btn.tag == 1)||(currentViewController == vc3&&btn.tag == 2)||(currentViewController == vc4&&btn.tag == 3)||(currentViewController == vc5&&btn.tag == 4))) {
        return;
    }
    else
    {
        BaseGalleryController*oldController = currentViewController;
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
            case 3:{
                [self btnSelect:btn];

                [self transitionFromViewController:currentViewController toViewController:vc4 duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
                    
                } completion:^(BOOL finished) {
                    if (finished) {
                        currentViewController = vc4;
                    }else{
                        currentViewController = oldController;
                    }
                }];

                
            }
                break;
            default:{
                [self btnSelect:btn];

                [self transitionFromViewController:currentViewController toViewController:vc5 duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
                    nil;
                } completion:^(BOOL finished) {
                    if (finished) {
                        currentViewController = vc5;
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
