//
//  BaseNewsViewController.m
//  体育也疯狂
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//
#import "NewsModel.h"
#import "BaseNewsViewController.h"
#import "AFNateWorking.h"
#import "NewsCell.h"
#import "NewsCell2.h"
#import "MJRefresh.h"
#import "NewsXController.h"
@interface BaseNewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    NSMutableArray*_data;
}
@end

@implementation BaseNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [[NSMutableArray alloc]init];
    [self creatTable];
}

- (void)setCatid:(NSString *)catid
{
    if (_catid != catid)
    {
        _catid = catid ;
        
        [self sendRegest];
    }
}

- (void)sendRegest
{
       NSDictionary*dic1 = @{
                          @"m":@"News",
                          @"a":_a,
                          @"page_size":@"12",
                          @"catid":_catid,
                          @"page":@"1",
                          @"version":@"1.0.4",
                          @"screen_size":@"160x120",
                          @"big_pic":@"1"
                          };
    [self showMBProgressHUD:@"正在加载"];

    [self request:dic1];

}

- (void)request:(NSDictionary*)dic
{
    [AFNateWorking afNetWorking:@"http://u.api.5usport.com/PHP_works/api/index.php"
                         params:dic
                          metod:@"GET"
                completionBlock:^(id completion)
    {
    
    NSArray*dataArray = completion[@"data"];
    
    for (NSDictionary*dic in dataArray)
        {
              NewsModel *model = [[NewsModel alloc]initWithDataDic:dic];
        
              [_data addObject:model];
        }
    dispatch_async(dispatch_get_main_queue(), ^{

                [self hideHUD];
               [table reloadData];
              [table.footer endRefreshing];

        });
   }
                     errorBlock:^(NSError *error)
    {
    NSLog(@"%@",error);
}];

    
}
- (void)creatTable
{
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-70) style:UITableViewStylePlain];
    
    table.delegate = self;
    table.dataSource = self;
    table.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    table.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_loadMoreData)];
    
    [self.view addSubview:table];
}

- (void)_loadNewData
{
    
    
}
- (void)_loadMoreData
{
   static  int i = 2;
    i++;
    NSString*inti = [NSString stringWithFormat:@"%d",i];
    NSDictionary*dic1 = @{
                          @"m":@"News",
                          @"a":_a,
                          @"page_size":@"12",
                          @"catid":_catid,
                          @"page":inti,
                          @"version":@"1.0.4",
                          @"screen_size":@"160x120",
                          @"big_pic":@"1"
                          };
    
    [self request:dic1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row == 0)
    {
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
        
        if (cell == nil )
        {
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:self options:nil]firstObject];
        }
        
        cell.model = _data[indexPath.row];
        return cell;
    }
    else
    {
        NewsCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        
        if (cell == nil )
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell2" owner:self options:nil]lastObject];
        }
        
        cell.model = _data[indexPath.row];

        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 250;
    }
    else
    {
        return 100;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsXController*x = [[NewsXController alloc] init];
    NewsModel*model = _data[indexPath.row];
    x.news_ID = model.news_id;
    [self.navigationController pushViewController:x animated:YES];
}

@end
