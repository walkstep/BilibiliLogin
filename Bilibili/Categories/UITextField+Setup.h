//
//  UITextField+Setup.h
//  Jxds
//
//  Created by XiaoDou_Yangf on 2017/6/19.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Setup)

/** 创建带有占位符、字体大小的TextField */
+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder
                                 fontSize:(CGFloat)fontSize;

@end
