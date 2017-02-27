//
//  HFMainViewController.m
//  HFTY
//
//  Created by easub on 16/10/19.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "HFMainViewController.h"
#import "HFNavigationController.h"
#import "HFLeftMenuView.h"

static CGFloat SlipDuration = 0.15;

@interface HFMainViewController () <UIGestureRecognizerDelegate, HFLeftMenuViewDelegate>

/* 侧滑View */
@property (nonatomic, strong) HFLeftMenuView *leftMenuView;
/* 当前显示的VC */
@property (nonatomic, strong) HFViewController *currentShowViewController;


@end

@implementation HFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    NSArray *classNames = @[@"HFHomeViewController",@"HFMapViewController",@"HFCollectionViewController",@"HFThumbUpViewController",@"HFDownloadViewController",@"HFFeedbackViewController"];
    for (NSString *className in classNames) {
        UIViewController *vc = (UIViewController *)[[NSClassFromString(className) alloc] init];
        HFNavigationController *nav = [[HFNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
    
    //创建左侧View
    HFLeftMenuView *leftView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HFLeftMenuView class]) owner:nil options:nil].firstObject;
    [self.view insertSubview:leftView atIndex:1];
    leftView.delegate = self;
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.8);
    }];
    self.leftMenuView = leftView;
    
    //添加手势
    /*
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
     */
    
}


#pragma mark - WNXLeftMenuViewDelegate 左视图按钮点击事件
- (void)leftMenuViewButtonClcikFrom:(HFLeftButtonType)fromIndex to:(HFLeftButtonType)toIndex{
    //移除旧的控制器view
    HFNavigationController *oldNC = self.childViewControllers[fromIndex];
    [oldNC.view removeFromSuperview];
    
    //添加新的控制器view
    HFNavigationController *newNC = self.childViewControllers[toIndex];
    [self.view addSubview:newNC.view];
    
    newNC.view.transform = oldNC.view.transform;

    self.currentShowViewController = newNC.childViewControllers[0];
    
    //自动点击遮盖按钮--->右边视图左滑
    [self.currentShowViewController coverClick];
}

#pragma mark - 手势
- (void)pan:(UIPanGestureRecognizer *)pan{
    
    CGFloat moveX = [pan translationInView:self.view].x;
    //    NSLog(@"%f",moveX);
    CGFloat maxMoveX = HFScreenWidth - HFScreenWidth * HFZoomSideslipScale;
    //未侧滑
    if (self.currentShowViewController.isScale == NO) {
        if (moveX < maxMoveX && moveX >= 0) {
            self.currentShowViewController.navigationController.view.transform = CGAffineTransformMakeTranslation(moveX, 0);
        }
        if (pan.state == UIGestureRecognizerStateEnded) {
            if (moveX >= maxMoveX / 2) {
                //移动moveX超过一半
                [UIView animateWithDuration:SlipDuration animations:^{
                    self.currentShowViewController.navigationController.view.transform = CGAffineTransformMakeTranslation(maxMoveX, 0);
                } completion:^(BOOL finished) {
                    //将状态改为已侧滑
                    self.currentShowViewController.isScale = YES;
                    //添加遮盖
                    [self.currentShowViewController leftClick];
                }];
            }else{
                //移动moveX小于一半
                [UIView animateWithDuration:SlipDuration animations:^{
                    self.currentShowViewController.navigationController.view.transform = CGAffineTransformIdentity;
                }completion:^(BOOL finished) {
                    self.currentShowViewController.isScale = NO;
                }];
            }
        }
        
    }
    //已经侧滑
    else if (self.currentShowViewController.isScale == YES){
        if (moveX < 0) {
            //注意这里得把 maxMoveX 添加进去.不然view从Identity位置开始滑动
            self.currentShowViewController.navigationController.view.transform = CGAffineTransformMakeTranslation(moveX + maxMoveX, 0);
        }
        if (pan.state == UIGestureRecognizerStateEnded) {
            if (-moveX >= maxMoveX / 2) {
                //移动moveX超过一半
                [UIView animateWithDuration:SlipDuration animations:^{
                    self.currentShowViewController.navigationController.view.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    //将状态改为未侧滑
                    self.currentShowViewController.isScale = NO;
                    //注销遮盖
                    [self.currentShowViewController coverClick];
                }];
            }else{
                //移动moveX小于一半
                [UIView animateWithDuration:SlipDuration animations:^{
                    self.currentShowViewController.navigationController.view.transform = CGAffineTransformMakeTranslation(maxMoveX, 0);
                }completion:^(BOOL finished) {
                    //控制器状态-->已侧滑
                    self.currentShowViewController.isScale = YES;
                }];
            }
        }
        
    }
    
}


@end
