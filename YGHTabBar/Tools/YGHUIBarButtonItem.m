//
//  CommonBarButtonItem.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "YGHUIBarButtonItem.h"

@implementation YGHUIBarButtonItem

+ (instancetype)itemWithTitle:(NSString *)title
                        Style:(SNNavItemStyle)style
                       target:(id)target
                       action:(SEL)action
{
    if (style == SNNavItemStyleBack)
    {
        //返回
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor clearColor];
        [btn setImage:[UIImage imageNamed:@"nav_back_normal.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"nav_back_select.png"] forState:UIControlStateHighlighted];
        btn.frame = CGRectMake(0, 0, 44, 44);

        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);

        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        YGHUIBarButtonItem *item = [[YGHUIBarButtonItem alloc] initWithCustomView:btn];
        return item;
    }
    else
    {
        return nil;
    }
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    if ([self.customView isKindOfClass:[UIControl class]])
    {
        UIControl *ctrl = (UIControl *)self.customView;
        ctrl.enabled = enabled;
    }
}

@end
