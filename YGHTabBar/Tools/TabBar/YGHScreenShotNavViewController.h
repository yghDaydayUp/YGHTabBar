//
//  YGHScreenShotNavViewController.h
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGHScreenShotNavViewController : UINavigationController
@property (strong ,nonatomic) NSMutableArray *arrayScreenshot;
@property (nonatomic, strong) UIPanGestureRecognizer *panGes;
@end
