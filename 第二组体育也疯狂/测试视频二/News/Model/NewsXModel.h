//
//  NewsXModel.h
//  体育也疯狂
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseModel.h"

@interface NewsXModel : BaseModel
@property (nonatomic,copy) NSString* news_photo;
@property (nonatomic,copy) NSString* news_title;
@property (nonatomic,copy) NSString* news_date;
@property (nonatomic,copy) NSString* news_content;

@end
