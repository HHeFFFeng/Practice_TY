//
//  HFNavigationController.m
//  HFTY
//
//  Created by easub on 16/10/19.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "HFNavigationController.h"
#import "UIImage+Category.h"

@interface HFNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation HFNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
#pragma clang diagnostic pop
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
}

+ (void)initialize{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置导航条背景颜色
    [bar setBackgroundImage:[UIImage imageWithColor:HFColor_WYRed] forBarMetrics:UIBarMetricsDefault];
    //隐藏导航条底部线条
    [bar setShadowImage:[UIImage new]];
    //设置导航条字体大小和颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:dict];
    
}

// 是否开始触发手势
// 为什么放在HFNavigationController.m下判断
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    // 判断下当前控制器是否是跟控制器
    // self.topViewController 堆栈顶部的VC
    return (self.topViewController != [self.viewControllers firstObject]);
}


@end
