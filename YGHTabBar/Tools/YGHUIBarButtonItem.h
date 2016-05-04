//
//  CommonBarButtonItem.h
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SNNavItemStyle) {
    
    SNNavItemStyleBack, //返回
    SNNavItemStyleDone,
};

@interface YGHUIBarButtonItem : UIBarButtonItem

+ (instancetype)itemWithTitle:(NSString *)title
                        Style:(SNNavItemStyle)style
                       target:(id)target
                       action:(SEL)action;

@end
