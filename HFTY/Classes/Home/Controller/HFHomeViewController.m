//
//  HFHomeViewController.m
//  HFTY
//
//  Created by easub on 16/10/19.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "HFHomeViewController.h"
#import "CAPSPageMenu.h"
#import "HFFunNewsTableViewController.h"
#import "HFRecommendCollectionViewController.h"
#import "HFCityViewController.h"

typedef void(^BLOCK)();

@interface HFHomeViewController () <UIScrollViewDelegate>

/** pageMenu */
@property (nonatomic, strong) CAPSPageMenu *pageMenu;


/** Titles */
@property (nonatomic, strong) NSArray *titles;

@end

@implementation HFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"听游";
    
    //初始化子控制器
    HFFunNewsTableViewController *funNewsVC = [[HFFunNewsTableViewController alloc] initWithNibName:NSStringFromClass([HFFunNewsTableViewController class]) bundle:nil];
    funNewsVC.title = @"趣闻";
    
    HFRecommendCollectionViewController *recommendVC = [[HFRecommendCollectionViewController alloc] initWithNibName:NSStringFromClass([HFRecommendCollectionViewController class]) bundle:nil];
    recommendVC.title = @"推荐";
    
    HFRecommendCollectionViewController *baikeVC = [[HFRecommendCollectionViewController alloc] initWithNibName:NSStringFromClass([HFRecommendCollectionViewController class]) bundle:nil];
    baikeVC.title = @"百科";
    
    HFCityViewController *cityVC = [[HFCityViewController alloc] initWithNibName:NSStringFromClass([HFCityViewController class]) bundle:nil];
    cityVC.title = @"地区";
    
    NSArray *controllers = @[funNewsVC, recommendVC, baikeVC, cityVC];
    
    //pageMenu参数
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithWhite:0.9 alpha:0.6],
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionSelectionIndicatorColor: HFColor_WYRed,
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor: HFColor_WYRed,
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:16.0],
                                 CAPSPageMenuOptionMenuItemWidth: @(HFScreenWidth/(controllers.count + 1)),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES),
                                 CAPSPageMenuOptionEnableHorizontalBounce:@(NO)
                                 };

    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllers frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];

    
    [self.view addSubview:_pageMenu.view];
    

}

@end
