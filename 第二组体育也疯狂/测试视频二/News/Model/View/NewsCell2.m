//
//  NewsCell2.m
//  体育也疯狂
//
//  Created by mac on 15/10/13.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsCell2.h"

@implementation NewsCell2

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(NewsModel *)model
{
    if (_model!=model) {
        _model = model;
    }
    
    _descrapl.text = _model.news_title;
    
    [_heardImage setImageWithURL:[NSURL URLWithString:_model.news_photo]];
    
    _timeLable.text = _model.news_date;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
