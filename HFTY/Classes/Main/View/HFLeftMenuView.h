//
//  HFLeftMenuView.h
//  HFTY
//
//  Created by easub on 16/10/24.
//  Copyright © 2016年 easub. All rights reserved.
//

#import <UIKit/UIKit.h>

//LeftView按钮类型
typedef NS_ENUM(NSInteger, HFLeftButtonType) {
    HFLeftButtonTypeHome = 0,
    HFLeftButtonTypeMap,
    HFLeftButtonTypeCollection,
    HFLeftButtonTypeThumpUp,
    HFLeftButtonTypeDownload,
    HFLeftButtonTypeFeedback
};

@protocol HFLeftMenuViewDelegate <NSObject>

@optional
//左侧按钮被点击时调用
- (void)leftMenuViewButtonClcikFrom:(HFLeftButtonType)fromIndex to:(HFLeftButtonType)toIndex;

@end

@interface HFLeftMenuView : UIView

/* delegate */
@property (nonatomic, weak) id <HFLeftMenuViewDelegate> delegate;

- (void)coverIsRemove;

@end
