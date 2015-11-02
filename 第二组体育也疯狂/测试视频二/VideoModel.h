//
//  VideoModel.h
//  体育也疯狂
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (nonatomic,copy) NSString*title;
@property (nonatomic,strong) NSDictionary*image;
@property (nonatomic,copy) NSString*vid;
@property (nonatomic,strong) NSDictionary*video_info;
@property (nonatomic,copy) NSNumber*count;
@end
