//
//  NewsXController.m
//  体育也疯狂
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsXController.h"
#import "NewsXCell1.h"
#import "NewsXCell2.h"
#import "AFNateWorking.h"
#import "NewsXModel.h"
#import "UIKit+AFNetworking.h"
@interface NewsXController ()<UITableViewDelegate,UITableViewDataSource>
{
    NewsXModel*model;
}
@end

@implementation NewsXController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self request];    
}

- (void)creatTable
{
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    
    table.delegate = self;
    table.dataSource = self;
    
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 2;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row == 0)
    {
        NewsXCell1*cell = [tableView dequeueReusableCellWithIdentifier:@"NewsX1"];
        
        if (cell == nil)
        {
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsXCell1" owner:self options:nil]lastObject];
        }
        
        cell.titleLable.text = model.news_title;
        
        cell.timeLable.text = model.news_date;
     
        return cell;
    }
    else
    {
        NewsXCell2*cell = [tableView dequeueReusableCellWithIdentifier:@"NewsX2"];
        
        if (cell == nil)
        {
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsXCell2" owner:self options:nil]lastObject];
        }
        cell.contextLable.text = model.news_content;
        NSString *image = model.news_photo;
       [cell.titleImage setImageWithURL:[NSURL URLWithString:image]];
        
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100;
    }
    NSString*str = model.news_content;
    NSDictionary*dic = @{
                         NSFontAttributeName:[UIFont systemFontOfSize:17],
                         
                         };
    
    CGSize maxSize = CGSizeMake(tableView.bounds.size.width, CGFLOAT_MAX);
    CGRect size = [str boundingRectWithSize:maxSize
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:dic
                                    context:nil];
    CGFloat height = size.size.height;
    return 262+height+180;
}

- (void)request
{
    NSDictionary*dic = @{
                         @"m" : @"News",
                         @"a" : @"detail",
                         @"catid" : @"-1",
                         @"news_id" : _news_ID,
                         @"screen_size" : @"480x300"
                         };
    
    [AFNateWorking afRequestData:@"http://u.api.5usport.com/PHP_works/api/index.php"
                      HTTPMethod:@"GET"
                          parame:dic
                      completion:^(id completion) {
                         
                          if (completion !=nil) {
                              
                              NSDictionary*dic = completion[@"data"];
                              model = [[NewsXModel alloc]initWithDataDic:dic];
                              dispatch_async(dispatch_get_main_queue(), ^{
                                  
                                  [self creatTable];
                              });
                           } 
                          } errorBlock:^(NSError *error) {
                              NSLog(@"新闻详情%@",error);
                          }];
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
