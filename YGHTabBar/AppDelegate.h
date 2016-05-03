//
//  AppDelegate.h
//  YijietongBuy
//
//  Created by YangGH on 15/10/9.
//  Copyright © 2015年 YangGH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"
#import "Header.h"
#if kPanUISwitch
#import "YGHScreenShotView.h"
#endif

#undef APP_DELEGATE
#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
@class TabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
  TabBarController *tabBarViewController_;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, readonly, strong) TabBarController *tabBarViewController;
#if kPanUISwitch
@property (strong, nonatomic) YGHScreenShotView *screenshotView;
#endif
+ (AppDelegate *)currentAppDelegate;

@end

