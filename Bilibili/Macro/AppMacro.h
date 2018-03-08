//
//  AppMacro.h
//  Bilibili
//
//  Created by 杨丰 on 2018/3/7.
//  Copyright © 2018年 jucheng. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

static NSInteger const kColorViewBackground  = 0xf2f2f2;
// 字体颜色
static NSInteger const kColorFontWhite = 0xffffff;

static NSInteger const kColorFontDarkGray   = 0x333333;
static NSInteger const kColorFontGray       = 0x656565;
static NSInteger const kColorFontLightGray  = 0x9e9e9e;

static NSInteger const kColorNavBackground  = 0xff6b98;

//判断屏幕宽高
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

// 有透明度
#define UIColorFromAlphaRGB(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#endif /* AppMacro_h */
