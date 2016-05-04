//
//  YGHAuthManagerNavViewController.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "YGHAuthManagerNavViewController.h"
#import "YGHAuthNavigationBar.h"
#import <objc/runtime.h>
/*safe release*/
#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
__REF = nil;\
}\
}

//颜色创建
#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#undef  RGBACOLOR
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//因只需要一个array就可以了，故使用一个static变量

static NSArray *loginAuthClassArray = nil;

static NSArray *lotteryClassArray = nil;
@implementation YGHAuthManagerNavViewController
@synthesize backgroundView = _backgroundView;

+ (void)initialize
{
    if (self == [YGHAuthManagerNavViewController class]) {
        
    }
}

- (void)dealloc
{
    TT_RELEASE_SAFELY(_backgroundView);
    
}

- (id)initWithRootViewController:(UIViewController *)rootViewController{
    
    return [self initWithRootViewController:rootViewController hasTopRoundCorner:YES];
}

- (id)initWithRootViewController:(UIViewController *)rootViewController hasTopRoundCorner:(BOOL)isTopRound
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        isLastStatus = NO;
        [self setNavigationBackground:NO];
        
        self.delegate = self;
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    if (/* DISABLES CODE */ (0))
    {
        self.navigationBar.layer.shadowColor = RGBCOLOR(149, 129, 105).CGColor;
        self.navigationBar.layer.shadowOffset = CGSizeMake(0, 2);
        self.navigationBar.layer.shadowOpacity = 0.25;
        self.navigationBar.layer.shadowRadius = 1;
    }
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255.0
                                                green:242.0/255.0
                                                 blue:242.0/255.0
                                                alpha:1];
}

- (UIView *)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [UIView new];
        CGRect frame = [[UIScreen mainScreen] bounds];
        _backgroundView.frame = CGRectMake(0, 20, frame.size.width, frame.size.height);
        _backgroundView.backgroundColor = [UIColor yellowColor];
        
    }
    return _backgroundView;
}

#pragma mark -
#pragma mark logon auth

- (BOOL)needLogonAuth:(UIViewController *)viewController{
    BOOL need = NO;
    for (id class in loginAuthClassArray) {
        if ([[viewController class] isSubclassOfClass:class]) {
            need = YES;
            break;
        }
    }
    
    return need;
}

- (BOOL)isLotteryController:(UIViewController *)viewController{
    BOOL isLottery = NO;
    for (id class in lotteryClassArray) {
        if ([[viewController class] isSubclassOfClass:class]) {
            isLottery = YES;
            break;
        }
    }
    return isLottery;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([self needLogonAuth:viewController]) {
        
        if ([self.viewControllers containsObject:viewController]) {
            
            return;
        }
    }
    
    if ([self isLotteryController:viewController] && !isLastStatus) {
        [self setNavigationBackground:YES];
    }else if(![self isLotteryController:viewController] && isLastStatus){
        [self setNavigationBackground:NO];
    }
    
    [super pushViewController:viewController animated:animated];
    
    
}

- (void)dismissModalViewControllerAnimated:(BOOL)animated{
    
    [super dismissModalViewControllerAnimated:animated];
    
    
}


- (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
        [super presentViewController:modalViewController animated:animated completion:NULL];
    }else{
        [super presentModalViewController:modalViewController animated:animated];
    }
}

- (void)setNavigationBackground:(BOOL)isLottery
{
    if (isLottery)
    {
        [self setNavBarBackgoundWithColor:RGBACOLOR(247, 247, 248, 0.8)];
        
    }
    else
    {
        [self setNavBarBackgoundWithColor:RGBACOLOR(247, 247, 248, 0.8)];
    }
}

- (void)setNavBarBackgoundWithColor:(UIColor *)color
{
    self.navigationBar.alpha = 0.8f;
    
    self.navigationBar.barTintColor = [UIColor orangeColor];
    
    
}

#pragma mark ----------------------------- navigationController delegate

- (void)setDelegate:(id<UINavigationControllerDelegate>)delegate
{
    NSAssert(delegate == self, @"AuthNavViewController can only accept self as delegate");
    [super setDelegate:delegate];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  
}

@end
