//
//  NewsCell2.h
//  体育也疯狂
//
//  Created by mac on 15/10/13.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
#import "UIKit+AFNetworking.h"
@interface NewsCell2 : UITableViewCell
@property(nonatomic,copy)NewsModel*model;
@property (weak, nonatomic) IBOutlet UIImageView *heardImage;
@property (weak, nonatomic) IBOutlet UILabel *descrapl;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@end
