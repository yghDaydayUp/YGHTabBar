//
//  YGHTabBarController.h
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGHTabBarController : UITabBarController
<UITabBarControllerDelegate, UITabBarDelegate>
{
    
}

@property (nonatomic, weak) id            tabBarDelegate;

- (void)showBadgeValue:(NSString*)number;

@end
