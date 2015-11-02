//
//  MoreViewController.m
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MoreViewController.h"
#import "AboutViewController.h"
#import "VersionViewController.h"
@interface MoreViewController ()
 
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBG.jpg"]];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    // 将计算完成的结果 显示到界面上去
    _cacheLable.text = [NSString stringWithFormat:@"%.2fMB", [self countCacheFileSize]];
    
}
- (IBAction)aboutMeButton:(UIButton *)sender {
   // UINib *nib = [UINib nibWithNibName:@"AboutViewController" bundle:[NSBundle mainBundle]];
    AboutViewController *about = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:[NSBundle mainBundle]];
    
    
    [self.navigationController pushViewController:about animated:YES];
    
}
- (IBAction)bbtButton:(UIButton *)sender {
    
    VersionViewController *about = [[VersionViewController alloc]initWithNibName:@"VersionViewController" bundle:[NSBundle mainBundle]];
    
    about.str = @"      “体育也疯狂”以体育视频、新闻、图库为主，24小时不间断全球采编，搜罗全球最新最劲爆的体育新闻，为用户提供中超、亚冠、欧冠、CBA经典的视频集锦，足球、篮球实时新闻和高清图片。                              此版本暂时只支持 iPhone4、iPhone5、iPhone6(其他机型正在开发中) ";
    
    
    [self.navigationController pushViewController:about animated:YES];

}
- (IBAction)lennoveButton:(id)sender {
    VersionViewController *about = [[VersionViewController alloc]initWithNibName:@"VersionViewController" bundle:[NSBundle mainBundle]];
        about.str = @"      中超、亚冠、欧冠、CBA视频都来自于新浪视频。 头条、足球、篮球、综合新闻以及图库都来自于5U体育";
    
    [self.navigationController pushViewController:about animated:YES];

    
}
- (IBAction)clearnButton:(UIButton *)sender {

    [self clearCacheFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 计算当前缓存文件大小

/**
 *  计算当前应用程序缓存文件的大小之和
 *
 *  @return 文件大小
 */
- (CGFloat)countCacheFileSize
{
    // 1. 获取缓存文件夹的路径
    // 函数，用于获取当前程序的沙盒路径
    NSString *homePath = NSHomeDirectory();
  //  NSLog(@"%@", homePath);
    /**
     1) 子文件夹1 视频缓存 /tmp/MediaCache/
     2）子文件夹2 SDWebImage框架的缓存图片  /Library/Caches/com.hackemist.SDWebImageCache.default/
     3) 子文件夹3 /Library/Caches/com.zhujiacong.TimeMovie/
     */
    
    // 2. 使用- (CGFloat)getFileSize:(NSString *)filePath 来计算这些文件夹中文件大小
    NSArray *pathArray = @[@"/tmp/MediaCache/",
                          // @"/Library/Caches/com.hackemist.SDWebImageCache.default/",
                           @"/Library/Caches/xxx.-----/fsCachedData/"];
    // 文件大小之和
    CGFloat fileSize = 0;
    for (NSString *string in pathArray)
    {
        // 拼接路径
        NSString *filePath = [NSString stringWithFormat:@"%@%@", homePath, string];
        fileSize += [self getFileSize:filePath];
        
    }
    
    // 3. 对上一步计算的结果进行求和 并返回
    
    
    return fileSize;
}

/**
 *  根据传入的路径 计算此路径下的文件大小
 *
 *  @param filePath 文件路径
 *
 *  @return 此文件夹下所有文件的总大小  单位MB
 */
- (CGFloat)getFileSize:(NSString *)filePath
{
    // 文件管理器对象  单例
    NSFileManager *manager = [NSFileManager defaultManager];
    // 数组 储存文件夹中所有的子文件夹以及文件的名字
    NSArray *fileNames = [manager subpathsOfDirectoryAtPath:filePath error:nil];
    
    long long size = 0;
    
    // 遍历文件夹
    for (NSString *fileName in fileNames)
    {
        // 拼接获取文件的路径
        NSString *subFilePath = [NSString stringWithFormat:@"%@%@", filePath, fileName];
        // 获取文件信息
        NSDictionary *dic = [manager attributesOfItemAtPath:subFilePath error:nil];
        // 获取单个文件的大小
        NSNumber *sizeNumber = dic[NSFileSize];
        // 使用一个 long long类型来储存文件大小
        long long subFileSize = [sizeNumber longLongValue];
        
        // 文件大小求和
        size += subFileSize;
        
    }
    
    return size / 1024.0 / 1024;
}



#pragma mark - 清理缓存文件

/**
 *  清理缓存文件
 */
- (void)clearCacheFile
{
     // 获取缓存文件的路径
    // 1. 获取缓存文件夹的路径
    
    NSString *homePath = NSHomeDirectory();
    
    
    // 2. 删除文件
    NSArray *pathArray = @[@"/tmp/MediaCache/",
                           // @"/Library/Caches/com.hackemist.SDWebImageCache.default/",
                           @"/Library/Caches/xxx.-----/fsCachedData/"];
    
    for (NSString *string in pathArray)
    {
        // 拼接路径
        NSString *filePath = [NSString stringWithFormat:@"%@%@", homePath, string];
        // 文件管理
        NSFileManager *manager = [NSFileManager defaultManager];
        // 获取子文件夹中的文件名
        NSArray *fileNames = [manager subpathsOfDirectoryAtPath:filePath error:nil];
        // 遍历文件夹 删除文件
        for (NSString *fileName in fileNames)
        {
            // 拼接子文件路径
            NSString *subFilePath = [NSString stringWithFormat:@"%@%@", filePath, fileName];
            // 删除文件
            [manager removeItemAtPath:subFilePath error:nil];
        }
        
    }
    
    
    // 重新计算缓存文件大小
    // 将计算完成的结果 显示到界面上去
    _cacheLable.text = [NSString stringWithFormat:@"%.2fMB", [self countCacheFileSize]];
    
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
