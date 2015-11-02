//
//  NewsCell.h
//  体育也疯狂
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
#import "UIKit+AFNetworking.h"
@interface NewsCell : UITableViewCell

@property(nonatomic,copy)NSString*news_id;//新闻的id

@property(nonatomic,copy)NewsModel*model;
@property (weak, nonatomic) IBOutlet UIImageView *heardImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionl;

@end
