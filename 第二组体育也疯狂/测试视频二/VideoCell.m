//
//  VideoCell.m
//  体育也疯狂
//
//  Created by mac on 15/10/11.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell

- (void)awakeFromNib {
 
}

- (void)setModel:(VideoModel *)model
{
    if (_model != model)
    {
        _model = model;
    
        _videoLable.text = _model.title;
        NSDictionary*imgDic = _model.image;
        NSString*imageString = imgDic[@"u"];

        NSURL*url = [NSURL URLWithString:imageString];
         [_videoImage setImageWithURL:url];
        NSString*str = [NSString stringWithFormat:@"播放次数：%@",_model.count];
        _lable.text = str;
         
        
     }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
