//
//  GalleryCell.h
//  体育也疯狂
//
//  Created by mac on 15/10/13.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GalleryModel.h"
#import "UIKit+AFNetworking.h"
@interface GalleryCell : UITableViewCell

@property(nonatomic,strong)GalleryModel*model;
@property (weak, nonatomic) IBOutlet UIImageView *galleryImage;
@property (weak, nonatomic) IBOutlet UILabel *galleryLable;

@end
