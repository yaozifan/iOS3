//
//  NewsXCell2.m
//  体育也疯狂
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsXCell2.h"
@implementation NewsXCell2

- (void)awakeFromNib {
    // Initialization code
    [_titleImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_contextLable setTranslatesAutoresizingMaskIntoConstraints:NO];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
