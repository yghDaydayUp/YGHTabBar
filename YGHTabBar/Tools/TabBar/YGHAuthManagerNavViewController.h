//
//  YGHAuthManagerNavViewController.h
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "YGHScreenShotNavViewController.h"
#import "Header.h"
#if kPanUISwitch
#import "YGHScreenShotNavViewController.h"
@interface  YGHAuthManagerNavViewController : YGHScreenShotNavViewController <UINavigationControllerDelegate>
{
    BOOL isLastStatus;
}
#else
@interface YGHAuthManagerNavViewController : UINavigationController<UINavigationControllerDelegate>

{

   BOOL isLastStatus;
}
#endif

@property (nonatomic,strong) UIView *backgroundView;

- (BOOL)needLogonAuth:(UIViewController *)viewController;

- (BOOL)isLotteryController:(UIViewController *)viewController;

- (void)setNavigationBackground:(BOOL)isLottery;

- (void)setNavBarBackgoundWithColor:(UIColor *)color;

- (id)initWithRootViewController:(UIViewController *)rootViewController hasTopRoundCorner:(BOOL)isTopRound;

@end
