//
//  BaswVideoController.h
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//
/*
 为什么要创建这个类呢，因为所有Video子类的单元格样式排版都是一样的，或者说不止是Video  News,Gallery的子类单元格
都是相同的，所以给他们创建一个夫类，在父类中创建单元格，之后只需要建立一个子控制器类，在此子类内创建其他分类，只需要给他们设置好url以及title就可以了  最后在此子类内创建标签栏控制器，倒入到标签栏控制器内
                                                                              1510.12 00:33
 */
#import "BaseViewController.h"
#import <UIKit/UIKit.h>
#import "VideoCell.h"
#import "AFNateWorking.h"
@interface BaseVideoController : BaseViewController
@property (nonatomic,copy) NSString*url;

@end
