//
//  UIButton+Setup.m
//  Jxds
//
//  Created by XDmini on 2017/6/17.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import "UIButton+Setup.h"

@implementation UIButton (Setup)

/** 带标题的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}

/** 带标题、标题颜色的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    return button;
}

/** 带标题、标题颜色、标题字体大小的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    return button;
}

/** 带点击效果的图片按钮 */
+ (UIButton *)buttonWithNormalImage:(UIImage *)normalImage
                     highlightImage:(UIImage *)highlightImage {
    UIButton *button = [[UIButton alloc] init];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    return button;
}

/** 带标题、标题颜色、标题字体大小并且有点击效果的图片按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize
                  normalImage:(UIImage *)normalImage
               highlightImage:(UIImage *)highlightImage {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    return button;
}


/** 创建带标题的无点击效果,图片和标题有偏移的Button */
+ (UIButton *)buttonWithWithTitle:(NSString *)title
                            titleColor:(UIColor *)titleColor
                              fontSize:(CGFloat)fontSize
                           NormalImage:(UIImage *)normalImage
                       titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                       imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setTitleEdgeInsets:titleEdgeInsets];
    [button setImageEdgeInsets:imageEdgeInsets];
    return button;
}


/** 创建带标题的有点击效果,图片和标题有偏移的Button */
+ (UIButton *)buttonWithWithTitle:(NSString *)title
                            titleColor:(UIColor *)titleColor
                              fontSize:(CGFloat)fontSize
                           NormalImage:(UIImage *)normalImage
                       highlightImagee:(UIImage *)highlightImage
                       titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                       imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    [button setTitleEdgeInsets:titleEdgeInsets];
    [button setImageEdgeInsets:imageEdgeInsets];
    return button;
}

/** 创建带标题带选择效果,图片和标题有偏移的Button */
+ (UIButton *)buttonWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                          fontSize:(CGFloat)fontSize
                       NormalImage:(UIImage *)normalImage
                    selectedImagee:(UIImage *)selectedImage
                   titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                   imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button setTitleEdgeInsets:titleEdgeInsets];
    [button setImageEdgeInsets:imageEdgeInsets];
    return button;
}

@end
