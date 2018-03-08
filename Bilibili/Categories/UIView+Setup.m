//
//  UIView+Setup.m
//  Jxds
//
//  Created by XDmini on 2017/6/17.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import "UIView+Setup.h"

@implementation UIView (Setup)

/** 带背景颜色的View */
+ (UIView *)viewWithBackgroundColor:(UIColor *)color {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    return view;
}

@end
