//
//  VideoCell.h
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKit+AFNetworking.h"
#import "VideoModel.h"
@interface VideoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet UIImageView *videoImage;
@property (weak, nonatomic) IBOutlet UILabel *videoLable;
@property(nonatomic,strong)VideoModel*model;
@end
