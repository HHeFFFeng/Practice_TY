//
//  HFLeftMenuView.m
//  HFTY
//
//  Created by easub on 16/10/24.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "HFLeftMenuView.h"

@interface HFLeftMenuView ()

/** 首页 */
@property (weak, nonatomic) IBOutlet UIButton *button_Home;
/** 地图 */
@property (weak, nonatomic) IBOutlet UIButton *button_Map;
/** 收藏 */
@property (weak, nonatomic) IBOutlet UIButton *button_Collection;
/** 点赞 */
@property (weak, nonatomic) IBOutlet UIButton *button_ThumbUp;
/** 下载 */
@property (weak, nonatomic) IBOutlet UIButton *button_Download;
/** 反馈 */
@property (weak, nonatomic) IBOutlet UIButton *button_Feedback;

/** 记录上次当前选中的"块" */
@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation HFLeftMenuView

- (void)awakeFromNib{
    [super awakeFromNib];
    //给按钮添加Tag值
    self.button_Home.tag = HFLeftButtonTypeHome;
    self.button_Map.tag = HFLeftButtonTypeMap;
    self.button_Collection.tag = HFLeftButtonTypeCollection;
    self.button_ThumbUp.tag = HFLeftButtonTypeThumpUp;
    self.button_Download.tag = HFLeftButtonTypeDownload;
    self.button_Feedback.tag = HFLeftButtonTypeFeedback;
    
}

- (void)setDelegate:(id<HFLeftMenuViewDelegate>)delegate{
    _delegate = delegate;
    [self leftButtonClick:self.button_Home];
}

- (void)coverIsRemove{
    
}
- (IBAction)leftButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(leftMenuViewButtonClcikFrom:to:)]) {
        [self.delegate leftMenuViewButtonClcikFrom:self.selectedBtn.tag to:sender.tag];
        self.selectedBtn = sender;
    }
    
}
- (void)drawRect:(CGRect)rect{
    
}
@end
