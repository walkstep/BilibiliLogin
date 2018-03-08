//
//  UILabel+ChangeSpace.h
//  yhf
//
//  Created by 杨丰 on 2017/11/15.
//  Copyright © 2017年 jucheng. All rights reserved.
//



@interface UILabel (ChangeSpace)

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
