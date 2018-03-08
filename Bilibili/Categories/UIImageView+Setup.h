//
//  UIImageView+Setup.h
//  Jxds
//
//  Created by XiaoDou_Yangf on 2017/6/19.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Setup)

/** 创建默认ImageView */
+ (UIImageView *)imageViewWithImage:(UIImage *)image;

/** 创建带有圆角的ImageView */
+ (UIImageView *)imageViewWithImage:(UIImage *)image
                       cornerRadius:(CGFloat)cornerRadius;

@end
