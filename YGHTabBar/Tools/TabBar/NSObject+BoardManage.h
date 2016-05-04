//
//  NSObject+BoardManage.h
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//
//  本类别宗旨： 通过方法注入NSObject的方法，是的应用程序可以在任何地方很方便的查询或跳转页面

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@class HomeViewController;


@interface NSObject (BoardManage)

- (AppDelegate *)appDelegate;

- (HomeViewController *)homeBoard;

//跳转首页
- (void)jumpToHomeBoard;

@end
