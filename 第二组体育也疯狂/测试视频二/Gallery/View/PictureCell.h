//
//  PictureCell.h
//  体育也疯狂
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureCell : UICollectionViewCell<UIAlertViewDelegate>

@property (nonatomic,copy)NSString *url;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImage;

@end
