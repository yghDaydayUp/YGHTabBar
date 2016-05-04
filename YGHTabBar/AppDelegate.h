//
//  AppDelegate.h
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGHTabBarController.h"
#import "Header.h"
#if kPanUISwitch
#import "YGHScreenShotView.h"
#endif

#undef APP_DELEGATE
#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
@class YGHTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
  YGHTabBarController *tabBarViewController_;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, readonly, strong) YGHTabBarController *tabBarViewController;
#if kPanUISwitch
@property (strong, nonatomic) YGHScreenShotView *screenshotView;
#endif
+ (AppDelegate *)currentAppDelegate;

@end

