//
//  Header.h
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#ifndef integral_Header_h
#define integral_Header_h

#define DefaultBackgroundColor [UIColor colorWithRed:244.0/255 green:244.0/255 blue:244.0/255 alpha:1.0f]

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight [UIScreen mainScreen].bounds.size.height


#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IPHONE_6_OR_LARGER (kDeviceWidth>320.0)

#pragma mark ------------------------------拖动ui效果开关 by chupeng
#define kPanUISwitch 1

#endif
