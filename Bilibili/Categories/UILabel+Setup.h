//
//  UILabel+Setup.h
//  Jxds
//
//  Created by XDmini on 2017/6/17.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Setup)

/** 带单行文本的标签 */
+ (UILabel *)labelWithText:(NSString *)text;

/** 带多行文本的标签 */
+ (UILabel *)labelWithText:(NSString *)text
             numberOfLines:(NSInteger)numberOfLines;

/** 带单行文本、文本颜色的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor;

/** 带多行文本、文本颜色的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines;

/** 带单行文本、文本颜色、文本字体大小的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat)fontSize;

/** 带多行文本、文本颜色、文本字体大小的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat)fontSize
             numberOfLines:(NSInteger)numberOfLines;

/**
 *  设置label的属性
 *
 *  @param attributes 字符串属性
 *  @param range      范围
 */
- (void)setAttributes:(NSDictionary<NSString *, id> *)attributes range:(NSRange)range;

@end
