//
//  UIColor+ZYBasicTools.h
//  LZYBAsicToolTest
//
//  Created by 刘臻豫 on 15/10/16.
//  Copyright © 2015年 刘臻豫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZYBasicTools)

/**
 *  通过16进制获取颜色
 *
 *  @param hexValue   16进制的颜色
 *  @param alphaValue 透明度
 *
 *  @return 颜色
 */
+ (UIColor*)zy_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

/**
 *  获取随机颜色
 *
 *  @return: 随机颜色
 */
+ (UIColor *)zy_randomColor;

/**
 *  通过RGBAColor颜色值获取颜色
 *
 *  @param red   0.0f-255.0f红色
 *  @param green 0.0f-255.0f绿色
 *  @param blue  0.0f-255.0f蓝色
 *  @param alpha 0.0f-1.0f透明度
 *
 *  @return <#return value description#>
 */
+ (UIColor *)zy_colorWithRGBAColorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 *  获取该颜色的RGB+alpha值
 *
 *  @return 一个四个元素的数组分别对应Red+Green+Blue+Alpha四个值
 */
- (NSArray *)zy_colorComponents;

@end
