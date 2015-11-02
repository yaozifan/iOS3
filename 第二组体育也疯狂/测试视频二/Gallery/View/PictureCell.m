//
//  PictureCell.m
//  体育也疯狂
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "PictureCell.h"
#import "UIKit+AFNetworking.h"

@implementation PictureCell 
- (void)awakeFromNib {
    // Initialization code
    
    _pictureImage.userInteractionEnabled = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movePicter) name:@"move" object:nil];
    UILongPressGestureRecognizer *press= [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(action:)];
    [self addGestureRecognizer:press];
    
}

- (void)action:(UILongPressGestureRecognizer*)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        [self movePicter];
    }
    
}
- (void)movePicter
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否保存照片" delegate:self cancelButtonTitle:@"保存" otherButtonTitles:@"不", nil];
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        UIImage *image = _pictureImage.image;
        
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
}

//保存成功调用
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    //提示保存成功
   // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
   // hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    //显示模式改为：自定义视图模式
  //  hud.mode = MBProgressHUDModeCustomView;
   // hud.labelText = @"保存成功";
    
    //延迟隐藏
   // [hud hide:YES afterDelay:1.5];
    NSLog(@"保存成功");
    
}//两种方法
//- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
//{
//    NSString *message = @"呵呵";
//    if (!error) {
//        message = @"成功保存到相册";
//    }else
//    {
//        message = [error description];
//    }
//    NSLog(@"message is %@",message);
//
//}

- (void)setUrl:(NSString *)url
{
    if (_url !=url) {
        _url = url;
    }
    
    [_pictureImage setImageWithURL:[NSURL URLWithString:_url]];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
@end
