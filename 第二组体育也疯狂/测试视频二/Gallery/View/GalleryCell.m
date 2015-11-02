//
//  GalleryCell.m
//  体育也疯狂
//
//  Created by mac on 15/10/13.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "GalleryCell.h"

@implementation GalleryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(GalleryModel *)model
{
    if (_model != model) {
        
        _model = model;
    }
    
    _galleryLable.text = _model.news_title;
    
    [_galleryImage setImageWithURL:[NSURL URLWithString:_model.news_photo]];
    
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
