//
//  UIBarButtonItem+HFBarButtonItem.h
//  HFTY
//
//  Created by easub on 16/11/2.
//  Copyright © 2016年 easub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HFBarButtonItem)
/**
 * 根据图片快速创建一个UIBarButtonItem，返回小号barButtonItem
 */
+ (UIBarButtonItem *)barButtonItemInitWithNormalImage:(NSString *)image target:(id)target action:(SEL)action;

/**
 * 根据图片快速创建一个UIBarButtonItem，返回大号barButtonItem
 */
+ (UIBarButtonItem *)barButtonItemInitWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)action;

/**
 * 根据图片快速创建一个UIBarButtonItem，自定义大小
 */
+ (UIBarButtonItem *)barButtonItemInitWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height;


/**
 * 根据文字快速创建一个UIBarButtonItem，自定义大小
 */
+ (UIBarButtonItem *)barButtonItemInitWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
@end
