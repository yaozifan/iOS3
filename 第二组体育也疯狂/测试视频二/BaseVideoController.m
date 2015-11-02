
//
//  BaswVideoController.m
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "BaseVideoController.h"
#import "VideoModel.h"
#import "MJRefresh.h"
#import <MediaPlayer/MediaPlayer.h>
@interface BaseVideoController ()<UITableViewDataSource,UITableViewDelegate>
{
 
    UITableView*table;
    NSMutableArray*dataArray;
    NSDictionary*feed ;
    MBProgressHUD *_hud;
}
@property(nonatomic,strong)NSDictionary*feed;
@end

@implementation BaseVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc]init];
    [self showMBProgressHUD:@"正在加载"];    
}
- (void)setUrl:(NSString *)url
{
    if (_url!=url) {
        _url = url;

        [self sendRegest];
        [self creatTable];
        
    }
}
//初始进入页面时候的网络请求
- (void)sendRegest
{
    NSDictionary*dic1 = @{
                          @"app_key":@"2586208540",
                         @"f":@"title%2Curl%2Ccategoryid%2Cimg%2Ccomment_show%2Cctime%2Cvid%2Cvideo_info",
                         @"num":@"20",
                          @"feed_id":_url,
                         @"pdps_params":@"12mqf"
                         };
    [AFNateWorking afNetWorking:@"http://platform.sina.com.cn/sports_client/feed?" params:dic1 metod:@"GET" completionBlock:^(id completion) {
        
        NSDictionary*result = completion[@"result"];
        NSDictionary*data = result[@"data"];
        self.feed = data[@"feed"];
        NSArray* array = _feed[@"data"];
        [dataArray removeAllObjects];//第一次请求初始化数组
        for (int i =0; i<array.count; i++) {
                VideoModel*modle = [[VideoModel alloc]init];
                NSMutableDictionary*haha = [[NSMutableDictionary alloc]init];
                haha = array[i];
                modle.title = haha[@"title"];
                modle.image = haha[@"img"];
                modle.vid = haha[@"vid"];
            modle.video_info = haha[@"video_info"];
            modle.count = modle.video_info[@"play_times"];
            [dataArray addObject:modle];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideHUD];
            [table reloadData];
            [table.header endRefreshing];
        });

    } errorBlock:^(NSError *error) {
        
        NSLog(@"视频错误：%@",error);
    }];
}

- (void)creatTable
{
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-44) style:UITableViewStylePlain];
    
    table.delegate = self;
    table.dataSource = self;
    table.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    table.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_loadMoreData)];
    
    [self.view addSubview:table];
}
//下拉刷新
- (void)_loadNewData
{
    [self sendRegest];
}
//上拉更多

- (void)_loadMoreData
{
    NSString*old = _feed[@"end"];
    NSDictionary*dic1 = @{
                          @"app_key":@"2586208540",
                          @"f":@"title%2Curl%2Ccategoryid%2Cimg%2Ccomment_show%2Cctime%2Cvid%2Cvideo_info",
                          @"num":@"20",
                          @"feed_id":_url,
                          @"pdps_params":@"12mqf",
                          @"ctime":old
                          };
    [AFNateWorking afNetWorking:@"http://platform.sina.com.cn/sports_client/feed?" params:dic1 metod:@"GET" completionBlock:^(id completion)
    {
        
        NSDictionary*result = completion[@"result"];
        NSDictionary*data = result[@"data"];
        self.feed = data[@"feed"];
        NSArray* array = _feed[@"data"];
         
        if (array!=nil)
        {
             for (int i =0; i<array.count; i++)
           {
            VideoModel*modle = [[VideoModel alloc]init];
            NSMutableDictionary*haha = [[NSMutableDictionary alloc]init];
            haha = array[i];
            modle.title = haha[@"title"];
            modle.image = haha[@"img"];
            modle.vid = haha[@"vid"];
            modle.video_info = haha[@"video_info"];
            [dataArray addObject:modle];
           }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [table reloadData];
                [table.footer endRefreshing];
                
            });
        }
    }
        errorBlock:^(NSError *error){
                 NSLog(@"视频错误：%@",error);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    
    if (cell ==nil ) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"VideoCell" owner:self options:nil]lastObject];
    }
    
    cell.model = dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoModel*model = dataArray[indexPath.row];
    
    NSString*vid = model.video_info[@"ipad_vid"];
 
    NSString *vid1 = [NSString stringWithFormat:@"http://v.iask.com/v_play_ipad.php?vid=%@",vid];
     NSURL *url = [NSURL URLWithString:vid1];
    
       MPMoviePlayerViewController *playe = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    
    [self presentMoviePlayerViewControllerAnimated:playe];
    
}



 @end
