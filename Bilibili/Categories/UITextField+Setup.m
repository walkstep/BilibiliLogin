//
//  UITextField+Setup.m
//  Jxds
//
//  Created by XiaoDou_Yangf on 2017/6/19.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import "UITextField+Setup.h"

@implementation UITextField (Setup)

/** 创建带有占位符、字体大小的TextField */
+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder
                                      fontSize:(CGFloat)fontSize {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    [textField setFont:[UIFont systemFontOfSize:fontSize]];
    return textField;
}

@end
