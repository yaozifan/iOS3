//
//  BaseGalleryController.h
//  体育也疯狂
//
//  Created by mac on 15/10/13.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface BaseGalleryController : BaseViewController
@property (nonatomic,copy) NSString*catid;
@property (nonatomic,copy) NSString*hot;
@property (nonatomic,assign)BOOL isMore;
@end
