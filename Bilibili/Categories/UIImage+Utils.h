//
//  UIImage+Utils.h
//  Jxds
//
//  Created by XDmini on 2017/6/16.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

- (UIImage *)circleImageWithParam:(CGFloat)inset;

/**
 *  图片先压缩 压缩后不满足才进行裁剪
 *
 *  @param compressedLength 压缩处理后的大小 不大于xxMb
 *  @param newSize          期望裁剪后的大小
 *
 *  @return 图片数据
 */
- (NSData *)compressedLength:(CGFloat)compressedLength clipedSize:(CGSize)newSize;

/** 生成正方形的缩略图 */
-(UIImage*)squareThumbnail:(CGFloat)width;

/**
 *  图片旋转为竖屏
 *
 *  @param image 需要旋转图片
 *
 *  @return 旋转后重新生成的图片
 */
- (UIImage *)scaleAndRotateImage:(UIImage *)image;

/** 颜色转图片 */
+ (UIImage *)ImageWithColor:(UIColor *)color;

@end
