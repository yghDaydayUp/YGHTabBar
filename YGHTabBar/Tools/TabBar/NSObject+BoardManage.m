//
//  NSObject+BoardManage.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "NSObject+BoardManage.h"
#import "HomeViewController.h"
#import <UIKit/UIKit.h>

@implementation NSObject (BoardManage)

- (AppDelegate *)appDelegate
{
    return [AppDelegate currentAppDelegate];
}

- (HomeViewController *)homeBoard
{
    UINavigationController *nav = [self.appDelegate.tabBarViewController.viewControllers objectAtIndex:0];
    return [[nav viewControllers] objectAtIndex:0];
}

#pragma mark -

- (void)jumpToHomeBoard
{
    UITabBarController *tabBarVC = self.appDelegate.tabBarViewController;
    if ([tabBarVC presentedViewController])
    {
        [tabBarVC dismissViewControllerAnimated:NO completion:NULL];
    }
    [self.homeBoard.navigationController popToRootViewControllerAnimated:NO];
    tabBarVC.selectedIndex = 0;
}

@end
