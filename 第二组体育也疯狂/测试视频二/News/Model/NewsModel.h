//
//  NewsModel.h
//  体育也疯狂
//
//  Created by mac on 15/10/13.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseModel.h"

@interface NewsModel : BaseModel
@property(nonatomic,copy)NSString*news_photo;//新闻的图片
@property(nonatomic,copy)NSString*news_id;//新闻的id
@property(nonatomic,copy)NSString*news_title;//新闻标题
@property(nonatomic,copy)NSString*news_date;//新闻时间
@property(nonatomic,copy)NSString*news_description;//新闻简介


@end
