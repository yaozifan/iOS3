//
//  NewsCell.m
//  体育也疯狂
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(NewsModel *)model
{
    /*@property(nonatomic,copy)NSString*news_photo;//新闻的图片
     @property(nonatomic,copy)NSString*news_id;//新闻的id
     @property(nonatomic,copy)NSString*news_title;//新闻标题
     @property(nonatomic,copy)NSString*news_date;//新闻时间
     @property(nonatomic,copy)NSString*news_descriptionl;//新闻简介

     */
    if (_model != model) {
        _model = model;
    }
    
    [_heardImage setImageWithURL:[NSURL URLWithString:_model.news_photo]];
    
    _descriptionl.text = _model.news_title;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
