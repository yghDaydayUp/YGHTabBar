//
//  YGHAuthNavigationBar.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "YGHAuthNavigationBar.h"
#import "Header.h"
@implementation YGHAuthNavigationBar
- (void)drawRect:(CGRect)rect
{
  
    UIImage *image = [self imageWithColor:[UIColor whiteColor] size:CGSizeMake(kDeviceWidth, 44)];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
   
}


- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 4 * size.width, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = [UIImage imageWithCGImage:imageMasked];
    
    CGImageRelease(imageMasked);
    
    return image;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *view in self.subviews)
    {
        [view setExclusiveTouch:YES];
    }
}

@end
