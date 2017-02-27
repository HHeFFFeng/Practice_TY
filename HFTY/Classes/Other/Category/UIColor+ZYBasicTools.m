//
//  UIColor+ZYBasicTools.m
//  LZYBAsicToolTest
//
//  Created by 刘臻豫 on 15/10/16.
//  Copyright © 2015年 刘臻豫. All rights reserved.
//

#import "UIColor+ZYBasicTools.h"

@implementation UIColor (ZYBasicTools)


+ (UIColor *)zy_randomColor {
    
    static BOOL seeded = NO;
    if (!seeded) {
        seeded = YES;
        // srandom()这个函数是初始化随机数产生器
        srandom((unsigned)time(NULL));
    }
    // random()函数产生随即值
    CGFloat red   = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue  = (CGFloat)random() / (CGFloat)RAND_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor*)zy_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}
+ (UIColor *)zy_colorWithRGBAColorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
        
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
    
    return color;
}

- (NSArray *)zy_colorComponents{
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    NSMutableArray *componentArr = [NSMutableArray array];
    for (NSInteger i = 0; i< 4; i++) {
        CGFloat component = components[i];
        [componentArr addObject:@(component)];
    }
    return [componentArr copy];
}

@end
