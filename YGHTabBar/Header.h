//
//  Header.h
//  integral
//
//  Created by liu on 15/9/16.
//  Copyright (c) 2015年 ecg. All rights reserved.
//

#ifndef integral_Header_h
#define integral_Header_h

#define DefaultBackgroundColor [UIColor colorWithRed:244.0/255 green:244.0/255 blue:244.0/255 alpha:1.0f]
#define DefaultMainColor   [UIColor colorWithRed:64.0/255 green:122.0/255 blue:238.0/255 alpha:1.000]
#define DarkerMainColor     [UIColor colorWithRed:181.0/255.0f green:68.0/255.0f blue:40.0/255.0f alpha:1]
#define DefaultGrayColor    [UIColor colorWithRed:199.0/255 green:205.0/255 blue:209.0/255 alpha:1.0f]
#define WarmColor    [UIColor colorWithRed:255.0/255 green:249.0/255 blue:235.0/255 alpha:1.0f]
#define DefaultMainBackgroundColor [UIColor colorWithWhite:0.2 alpha:1.0f]

#define SeperatorColor   [UIColor colorWithWhite:0.8f alpha:1.0f]
#define DefaultFontColor    [UIColor colorWithWhite:0.42 alpha:1.0f]
#define LightFontColor      [UIColor colorWithWhite:0.57 alpha:1.0f]

#define   BaseURLString   @"http://app.suopin.net/web_service/"
#define   FontName     @"FZLTXHK--GBK1-0"
#define   BoldFontName @"FZLTXHK--GBK1-0"
#define   PaddingBorder 12
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight [UIScreen mainScreen].bounds.size.height
#define MaskLayerBackground [UIColor colorWithWhite:0 alpha:0.5]

#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IPHONE_6_OR_LARGER (kDeviceWidth>320.0)

#pragma mark ------------------------------拖动ui效果开关 by chupeng
#define kPanUISwitch 1

//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))




#endif
