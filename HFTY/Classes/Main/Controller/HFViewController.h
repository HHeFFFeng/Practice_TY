//
//  HFViewController.h
//  HFTY
//
//  Created by easub on 16/10/19.
//  Copyright © 2016年 easub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFViewController : UIViewController

/** 当前页面是否有侧滑 */
@property (nonatomic, assign) BOOL isScale;
/** 遮盖按钮 */
@property (nonatomic, strong) UIButton *coverBtn;

/**
 * leftBarButton点击事件(添加遮盖)
 */
- (void)leftClick;
/**
 * 遮盖按钮点击事件(注销遮盖)
 */
- (void)coverClick;
@end
