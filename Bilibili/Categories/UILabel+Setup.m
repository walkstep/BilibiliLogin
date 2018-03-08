//
//  UILabel+Setup.m
//  Jxds
//
//  Created by XDmini on 2017/6/17.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import "UILabel+Setup.h"

@implementation UILabel (Setup)

/** 带单行文本的标签 */
+ (UILabel *)labelWithText:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    return label;
}

/** 带多行文本的标签 */
+ (UILabel *)labelWithText:(NSString *)text
             numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    return label;
}

/** 带单行文本、文本颜色的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    return label;
}

/** 带多行文本、文本颜色的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    return label;
}

/** 带单行文本、文本颜色、文本字体大小的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat)fontSize {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    return label;
}

/** 带多行文本、文本颜色、文本字体大小的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat)fontSize
             numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    label.numberOfLines = numberOfLines;
    return label;
}

/**
 *  设置label的属性
 *
 *  @param attributes 字符串属性
 *  @param range      范围
 */
- (void)setAttributes:(NSDictionary<NSString *, id> *)attributes range:(NSRange)range
{
    NSMutableAttributedString *attributesString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributesString setAttributes:attributes range:range];
    [self setAttributedText:attributesString];
}
@end
