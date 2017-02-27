//
//  HFViewController.m
//  HFTY
//
//  Created by easub on 16/10/19.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "HFViewController.h"

@interface HFViewController ()

@end

@implementation HFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //默认View背景色
    self.view.backgroundColor = HFColorRGB(0xEEEEEE);
    //添加导航条上的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemInitWithNormalImage:@"个人white" target:self action:@selector(leftClick)];
    
}

//修改为白色状态栏 对应 info.plist 也要更改
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)leftClick{
    //添加遮盖按钮
    self.coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.coverBtn.frame = self.navigationController.view.bounds;
    [self.coverBtn addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:self.coverBtn];
    
    //偏移距离
    CGFloat moveX = HFScreenWidth - HFScreenWidth * HFZoomSideslipScale;
    
    [UIView animateWithDuration:HFAnimationNormalDuration animations:^{

        self.navigationController.view.transform = CGAffineTransformMakeTranslation(moveX, 0);
        //将状态改成已经缩放
        self.isScale = YES;
    }];
}
/**
 * 这该按钮点击事件
 */
- (void)coverClick{
    [UIView animateWithDuration:HFAnimationNormalDuration animations:^{
        self.navigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //处理好遮盖按钮销毁后的事情
        [self.coverBtn removeFromSuperview];
        self.coverBtn = nil;
        self.isScale = NO;
    }];
}
@end
