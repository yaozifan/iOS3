//
//  PictureViewController.m
//  体育也疯狂
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "PictureViewController.h"
#import "PictureCell.h"
#import "AFNateWorking.h"
@interface PictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray*picArray;
    UILabel *pageLable;
}
@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
     self.navigationController.navigationBarHidden = YES;
     [self request];
     [self creatUIKit];
     picArray = [[NSMutableArray alloc] init];
}
- (void)creatUIKit
{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-50, kScreenWidth, 50)];
    
    view1.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:view1];
    
    pageLable = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-100, 0, 100, 50)];
    
    pageLable.textColor = [UIColor whiteColor];
    [view1 addSubview:pageLable];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button addTarget:self action:@selector(saveImage) forControlEvents:UIControlEventTouchUpInside];
    
    [button setImage:[UIImage imageNamed:@"save_1"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"save_2"] forState:UIControlStateHighlighted];
    
    button.frame = CGRectMake(50, 0, 50, 50);
    
    [view1 addSubview:button];
}
- (void)saveImage
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"move" object:self];
}

- (void)backView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)request
{
    NSDictionary*dic = @{
                        @"news_id":_photoID,
                         };
    [AFNateWorking afRequestData:@"http://u.api.5usport.com/PHP_works/api/index.php?m=News&a=pictureDetail&catid=15&news_id=8336"
                      HTTPMethod:@"GET"
                          parame:dic
                      completion:^(id completion) {
                          NSDictionary*data = completion[@"data"];
                          NSArray *array = data[@"photos"];
                          for (NSDictionary *urlDic in array) {
                              NSString *urlString = urlDic[@"url"];
                              [picArray addObject:urlString];
                          }
                          dispatch_async(dispatch_get_main_queue(), ^{
                              [self _creatCollectionView];
                              
                              NSString*str = [NSString stringWithFormat:@"1/%li",picArray.count];
                              
                              [pageLable setText:str];

                          });
                          
                      } errorBlock:^(NSError *error) {
                        NSLog(@"%@",error);
                      }];
}


- (void)_creatCollectionView
{
    //创建布局对象
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-300);
    
    flowLayout.minimumInteritemSpacing=10;
    //设置四周间隙
    flowLayout. sectionInset=UIEdgeInsetsMake(-16, 0, 0, 0);
    //设置滑动方向
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;

    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth+10, kScreenHeight-200) collectionViewLayout:flowLayout];
    collection.userInteractionEnabled = YES;//是否接受点击事件？
    collection.dataSource = self;
    collection.delegate = self;
    collection.pagingEnabled = YES;
    [self.view addSubview:collection];
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backView)];
    
    [collection addGestureRecognizer:tapgesture];

    //注册单元格
    [collection registerClass:[PictureCell class] forCellWithReuseIdentifier:@"Pcell"];
    UINib *nib = [UINib nibWithNibName:@"PictureCell" bundle:[NSBundle mainBundle]];
    
    [collection registerNib:nib forCellWithReuseIdentifier:@"Pcell"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return picArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
    PictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Pcell" forIndexPath:indexPath];
   
    cell.url = picArray[indexPath.row];
    
    return cell;
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat page = scrollView.frame.size.width;
    
    int a = scrollView.contentOffset.x/page +1;
     if (a+1<=picArray.count) {
        NSString*str = [NSString stringWithFormat:@"%d/%li",a+1,picArray.count];
        pageLable.text = str;
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;

}

@end
