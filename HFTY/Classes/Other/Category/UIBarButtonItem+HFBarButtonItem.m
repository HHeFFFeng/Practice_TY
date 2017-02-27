//
//  UIBarButtonItem+HFBarButtonItem.m
//  HFTY
//
//  Created by easub on 16/11/2.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "UIBarButtonItem+HFBarButtonItem.h"

@implementation UIBarButtonItem (HFBarButtonItem)
+ (UIBarButtonItem *)barButtonItemInitWithNormalImage:(NSString *)image target:(id)target action:(SEL)action
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 25, 25);
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

+ (UIBarButtonItem *)barButtonItemInitWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)action
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)barButtonItemInitWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, width, height);
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)barButtonItemInitWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}


@end
