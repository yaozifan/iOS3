//
//  BaseGalleryController.m
//  体育也疯狂
//
//  Created by mac on 15/10/13.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseGalleryController.h"
#import "AFNateWorking.h"
#import "GalleryModel.h"
#import "GalleryCell.h"
#import "MJRefresh.h"
#import "PictureViewController.h"
@interface BaseGalleryController ()<UITableViewDataSource,UITableViewDelegate>
{
    int page;
    
    UITableView*table;
    NSMutableArray*dataArray;
}
@end

@implementation BaseGalleryController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc]init];
    [self showMBProgressHUD:@"正在加载"];

}


- (void)setCatid:(NSString *)catid
{
    if (_catid != catid) {
        _catid = catid;
        [self sendRegest];
    }
}
- (void)sendRegest
{
    page = 1;
    _isMore = NO;
    
    if (_hot == nil)
    {
        NSDictionary*dic1 = @{
                              @"catid":_catid,
                              };
        [self sendHttpRgeust:dic1];
    }
    else{
        NSDictionary*dic1 = @{
                              @"hot":_hot,
                              @"catid":_catid,
                             
                              };
        [self sendHttpRgeust:dic1];
    }
    
}
- (void)sendHttpRgeust:(NSDictionary*)dic1
{
    
    [AFNateWorking afNetWorking:@"http://u.api.5usport.com/PHP_works/api/index.php?m=News&a=getPictureList&page=1&page_size=10&version=1.0.4" params:dic1 metod:@"GET" completionBlock:^(id completion) {
        if (completion != nil)
        {
            
            NSArray*array = completion[@"data"];
            
            for (int i =0; i<array.count; i++) {
                GalleryModel*modle = [[GalleryModel alloc]initWithDataDic:array[i]];
                [dataArray addObject:modle];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if (_isMore) {
                    
                    [table reloadData];
                }else{
                    [self hideHUD];
                    [self creatTable];
                }
                [table.header endRefreshing];
                [table.footer endRefreshing];
            });
        }
    } errorBlock:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

- (void)creatTable
{
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    
    table.delegate = self;
    table.dataSource = self;
    table.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    table.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_loadMoreData)];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
}
- (void)_loadNewData
{
    [self sendRegest];
}
- (void)_loadMoreData
{
    _isMore = YES;
    page++;
    NSString*inti = [NSString stringWithFormat:@"%d",page];
    if (_hot == nil)
    {
        NSDictionary*dic1 = @{
                              @"page":inti,
                              @"catid":_catid,
                              };
        [self sendHttpRgeust:dic1];
    }
    else{
        NSDictionary*dic1 = @{
                              @"page":inti,
                              @"hot":_hot,
                              @"catid":_catid,
                              };
        [self sendHttpRgeust:dic1];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    GalleryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"galleryCell"];
    
    if (cell ==nil ) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GalleryCell" owner:self options:nil]lastObject];
    }
    cell.model = dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PictureViewController *pic = [[PictureViewController alloc]init];
    
    GalleryModel* model = dataArray[indexPath.row];
    pic.photoID =  model.news_id;
    pic.hidesBottomBarWhenPushed = YES;//隐藏此页面的标签栏
    [self.navigationController pushViewController:pic animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
