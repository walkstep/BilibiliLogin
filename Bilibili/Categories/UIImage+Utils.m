//
//  UIImage+Utils.m
//  Jxds
//
//  Created by XDmini on 2017/6/16.
//  Copyright © 2017年 xiaodou. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

- (UIImage*)circleImageWithParam:(CGFloat)inset {
    
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    //圆的边框宽度为2，颜色为红色
    CGContextSetLineWidth(context,1);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, self.size.width - inset *2.0f, self.size.height - inset *2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    //在圆区域内画出image原图
    [self drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    //生成新的image
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

/**
 *  图片先压缩 压缩后不满足才进行裁剪
 *
 *  @param compressedLength 压缩处理后的大小 不大于xxMb
 *  @param newSize          期望裁剪后的大小
 *
 *  @return 图片数据
 */
- (NSData *)compressedLength:(CGFloat)compressedLength clipedSize:(CGSize)newSize {
    
    CGFloat compressIndex = 1.0;
    NSInteger clipWidth = newSize.width;
    NSInteger clipHeight = newSize.height;
    
    // 裁剪大小处理 大于指定宽度则为指定宽度 大于指定高度则为指定高度
    if (self.size.width > newSize.width && self.size.height > newSize.height) {
        clipWidth = newSize.width;
        clipHeight = newSize.height;
    } else if (self.size.width > newSize.width) {
        clipWidth = newSize.width;
        clipHeight = (newSize.width * newSize.height) / self.size.width;
    } else if (self.size.height > newSize.height) {
        clipWidth = (newSize.width * newSize.height) / self.size.height;
        clipHeight = newSize.height;
    } else {
        clipWidth = self.size.width;
        clipHeight = self.size.height;
    }
    
    // 先判断图片是否是横向的
    if (self.size.width > self.size.height) {
        // 横向 clipWidth和clipHeight交换
        clipWidth = clipWidth + clipHeight;
        clipHeight = clipWidth - clipHeight;
        clipWidth = clipWidth - clipHeight;
    }
    
    NSLog(@"图片处理前>>%@",[self getTimeNow]);
    // 图片压缩及可能裁剪
    NSData *imageData = UIImageJPEGRepresentation(self, compressIndex);
    NSLog(@"图片处理前大小>>%f",imageData.length/(1024.0));
    
    BOOL isCanComppress = YES;
    while (imageData.length/(1024.0*1024.0) > compressedLength && isCanComppress) {
        imageData = UIImageJPEGRepresentation(self, compressIndex);
        compressIndex = compressIndex - 0.2;
        if (compressIndex < 0.0) {
            // 压缩已达到最小值 若还不满足要求 则进行裁剪
            UIImage *compressedImage = [UIImage imageWithData:imageData];
            UIImage *clippedImage = [compressedImage cutImage:CGSizeMake(clipWidth, clipHeight)];
            imageData = UIImageJPEGRepresentation(clippedImage, 1.0);
            isCanComppress = NO;
        }
    }
    
    NSLog(@"图片处理后的时间>>%@",[self getTimeNow]);
    NSLog(@"图片处理后大小>>%f",imageData.length/(1024.0));
    return imageData;
}

- (NSString *)getTimeNow {
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
    NSString* date = [formatter stringFromDate:[NSDate date]];
    NSString *timeNow = [[NSString alloc] initWithFormat:@"%@", date];
    return timeNow;
}

- (UIImage *)cutImage:(CGSize)size{
    
    UIImage * compressImage = [self imageWithImageSimple:size];
    CGSize orignaSize = compressImage.size;
    if (orignaSize.width <= size.width || orignaSize.height <= size.height) {
        return self;
    }
    
    CGRect subImageRect;
    CGSize subImageSize = CGSizeMake(size.width, size.height);
    //定义裁剪的区域相对于原图片的位置
    subImageRect = CGRectMake(orignaSize.width/2-size.width/2, orignaSize.height/2-size.height/2, orignaSize.width, orignaSize.height);
    
    CGImageRef imageRef = compressImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, subImageRect);
    UIGraphicsBeginImageContext(subImageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, subImageRect, subImageRef);
    UIImage* subImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(subImageRef);
    return subImage;
}

- (UIImage *)imageWithImageSimple:(CGSize)newSize
{
    CGSize size=self.size;
    if(size.height<newSize.height&&size.width<newSize.width)
        return self;
    float imgScale=0.0f;
    if(size.width>0)
        imgScale=size.height/size.width;
    float viewScale=0.0f;
    if(newSize.width>0)
        viewScale=newSize.height/newSize.width;
    float width=size.width,height=size.height;
    if(imgScale<viewScale&&size.width>newSize.width){
        width=newSize.width;
        height=newSize.width*imgScale;
    }else if(imgScale>=viewScale&&size.height>newSize.height){
        height=newSize.height;
        if(imgScale>0)
            width=height/imgScale;
    }
    // Create a graphics image context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [self drawInRect:CGRectMake(0,0,width,height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

/** 生成正方形的缩略图 */
-(UIImage*)squareThumbnail:(CGFloat)width {
    CGSize orignaSize = self.size;
    CGSize subImageSize;
    CGRect subImageRect;
    if (orignaSize.width > orignaSize.height) {
        //宽大于高
        //以高为基准 裁剪成正方形
        
        subImageSize = CGSizeMake(orignaSize.height, orignaSize.height);
        //定义裁剪的区域相对于原图片的位置
        subImageRect = CGRectMake(orignaSize.width/2-orignaSize.height/2, 0, orignaSize.height, orignaSize.height);
        
    } else {
        //高大于宽，以宽为基准 裁剪成正方形
        subImageSize = CGSizeMake(orignaSize.width, orignaSize.width);
        //定义裁剪的区域相对于原图片的位置
        subImageRect = CGRectMake(0, orignaSize.height/2-orignaSize.width/2, orignaSize.width, orignaSize.width);
    }
    
    CGImageRef imageRef = self.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, subImageRect);
    UIGraphicsBeginImageContext(subImageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, subImageRect, subImageRef);
    UIImage* subImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(subImageRef);
    //裁剪成正方形后再等比压缩尺寸
    
    UIImage * thumbnail = [subImage imageWithImageSimple:CGSizeMake(width, width)];
    return thumbnail;
}

/**
 *  图片旋转为竖屏
 *
 *  @param image 需要旋转图片
 *
 *  @return 旋转后重新生成的图片
 */
- (UIImage *)scaleAndRotateImage:(UIImage *)image {
    int kMaxResolution = 720;
    
    CGImageRef imgRef = image.CGImage;
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = bounds.size.width / ratio;
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = bounds.size.height * ratio;
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}

/** 颜色转图片 */
+ (UIImage *)ImageWithColor:(UIColor *) color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
