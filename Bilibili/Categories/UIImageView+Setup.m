//
//  UIImageView+Setup.m
//  Jxds
//
//  Created by XiaoDou_Yangf on 2017/6/19.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import "UIImageView+Setup.h"

@implementation UIImageView (Setup)

/** 创建默认ImageView */
+ (UIImageView *)imageViewWithImage:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    return imageView;
}

/** 创建带有圆角的ImageView */
+ (UIImageView *)imageViewWithImage:(UIImage *)image
                       cornerRadius:(CGFloat)cornerRadius {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    [imageView.layer setCornerRadius:cornerRadius];
    return imageView;
}

@end
