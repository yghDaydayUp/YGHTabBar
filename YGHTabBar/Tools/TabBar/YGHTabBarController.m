//
//  YGHTabBarController.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "YGHTabBarController.h"
#import "YGHAuthManagerNavViewController.h"
#import "SearchViewController.h"
#import "MineViewController.h"
#import "CategoryViewController.h"
#import "HomeViewController.h"
#import "ShopCartViewController.h"
#import <objc/runtime.h>
#import "Header.h"
#import "AppDelegate.h"

@interface UITabBarSwappableView : UIView

@end

@implementation UITabBarSwappableView

- (void)setTabBarSwappableFrame:(CGRect)frame
{
    [super setFrame:CGRectMake(-2, -1, 64, 49)];
}

@end


@interface YGHTabBarController()
{
    UIButton                *_badgeValueBtn;
    BOOL                    _firstIn;
}

@property (nonatomic, strong) UIButton *badgeValueBtn;
@end
@implementation YGHTabBarController
@synthesize tabBarDelegate = _tabBarDelegate;

- (id)init{
    
    self = [super init];
    
    if(self){
        
        _firstIn = YES;
        
        UITabBarItem *item1 = [[UITabBarItem alloc] init];
        item1.tag = 1;
        [item1 setTitle:@"首页"];
        [item1 setImage:[UIImage imageNamed:@"homePage_default.png"]];
        [item1 setSelectedImage:[[UIImage imageNamed:@"homePage_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor lightGrayColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateNormal];
        UIColor *titleHighlightedColor = [UIColor orangeColor];
        [item1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       titleHighlightedColor, UITextAttributeTextColor,
                                       nil] forState:UIControlStateSelected];
        
        
        UITabBarItem *item2 = [[UITabBarItem alloc] init];
        item2.tag = 2;
        
        [item2 setTitle:@"收索"];
        [item2 setImage:[UIImage imageNamed:@"search_default.png"]];
        [item2 setSelectedImage:[[UIImage imageNamed:@"search_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor lightGrayColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateNormal];
        [item2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor orangeColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateSelected];
        
        UITabBarItem *item3 = [[UITabBarItem alloc] init];
        item3.tag = 3;
        [item3 setTitle:@"分类"];
        [item3 setImage:[UIImage imageNamed:@"category_default.png"]];
        [item3 setSelectedImage:[[UIImage imageNamed:@"category_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item3 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor lightGrayColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateNormal];
        [item3 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor orangeColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateSelected];
        UITabBarItem *item4 = [[UITabBarItem alloc] init];
        
        item4.tag = 4;
        [item4 setTitle:@"购物车"];
        [item4 setImage:[UIImage imageNamed:@"shopCart_default.png"]];
        [item4 setSelectedImage:[[UIImage imageNamed:@"shopCart_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item4 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor lightGrayColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateNormal];
        [item4 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor orangeColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateSelected];
        
        UITabBarItem *item5 = [[UITabBarItem alloc] init];
        
        item5.tag = 5;
        [item5 setTitle:@"我的"];
        
        [item5 setImage:[UIImage imageNamed:@"myYigou_default.png"]];
        [item5 setSelectedImage:[[UIImage imageNamed:@"myYigou_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item5 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor lightGrayColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateNormal];
        [item5 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor orangeColor], UITextAttributeTextColor,
                                       nil] forState:UIControlStateSelected];
        
        
        
        HomeViewController *homeController = [[HomeViewController alloc] init];
        homeController.tabBarItem = item1;
        YGHAuthManagerNavViewController *homeNavController = [[YGHAuthManagerNavViewController alloc] initWithRootViewController:homeController];
        
        
        SearchViewController *searchVC = [[SearchViewController alloc] init];
        searchVC.tabBarItem = item2;
        YGHAuthManagerNavViewController *searchNavController = [[YGHAuthManagerNavViewController alloc] initWithRootViewController:searchVC];
        
        CategoryViewController *cateViewVC = [[CategoryViewController alloc] init];
        cateViewVC.tabBarItem = item3;
        YGHAuthManagerNavViewController *cateNavController = [[YGHAuthManagerNavViewController alloc] initWithRootViewController:cateViewVC];
        
        
        ShopCartViewController *shoppingCartVC = [[ShopCartViewController alloc]init];
        shoppingCartVC.tabBarItem = item4;
        
        YGHAuthManagerNavViewController *gouwucheNavController = [[YGHAuthManagerNavViewController alloc] initWithRootViewController:shoppingCartVC];
        
        
        MineViewController * MineLaunchViewVC = [[MineViewController alloc] init];
        MineLaunchViewVC.tabBarItem = item5;
        YGHAuthManagerNavViewController *mineNavController = [[YGHAuthManagerNavViewController alloc] initWithRootViewController:MineLaunchViewVC];
        
        self.viewControllers = [NSArray arrayWithObjects:homeNavController,searchNavController,cateNavController,gouwucheNavController,mineNavController, nil];
        
        self.delegate = self;
        
        return  self;
    }
    return  nil;
}

- (void)loadView
{
    [super loadView];
    //修改高度
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat tabBarHeight = 49;
    self.tabBar.frame = CGRectMake(0, height-tabBarHeight, width, tabBarHeight);
    self.tabBar.clipsToBounds = YES;
    /**
     修改抵大杠的背景颜色
     */
    UIView * mView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, tabBarHeight)];//这是整个tabbar的颜色
    [mView setBackgroundColor:[UIColor blackColor]];
    [self.tabBar insertSubview:mView atIndex:1];
    mView.alpha=1;
    
}

- (UIButton *)badgeValueBtn
{
    if (!_badgeValueBtn)
    {
        _badgeValueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_badgeValueBtn setBackgroundImage:[self streImageNamed:@"bagePoint.png"] forState:UIControlStateDisabled];
        [_badgeValueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _badgeValueBtn.alpha = 0;
        
        [_badgeValueBtn setTitleEdgeInsets:UIEdgeInsetsMake(1, 0, 0, 0)];
        _badgeValueBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _badgeValueBtn.enabled = NO;
        int x = kDeviceWidth/5;
        _badgeValueBtn.frame = CGRectMake(x*4, 1, 20, 20);
        _badgeValueBtn.layer.zPosition = 1;
    }
    return _badgeValueBtn;
}


- (UIImage *)streImageNamed:(NSString *)imageName
{
    if (imageName == nil) {
        return nil;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *streImage = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    return streImage;
}


-(void)showBadgeValue:(NSString*)number
{
    if ([number isEqualToString:@"0"])
    {
        self.badgeValueBtn.alpha = 0;
    }
    else
    {
        if ([number intValue] > 99) {
            number = @"99+";
        }
        int length = [number length];
        
        CGSize size = [@"9" sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(64, 20)];
        
        CGRect rect = self.badgeValueBtn.frame;
        rect.size.width = size.width * (length + 0.5)>20?size.width*(length+0.5):20;
        rect.size.height = size.height> 20 ?size.height:20;
        int x = kDeviceWidth/5;
        if (kDeviceWidth==320) {
            rect.origin.x = x*4-rect.size.width+3;
        }else{
            rect.origin.x = x*4-rect.size.width -3;
        }
        
        rect.origin.y = 0.5;
        
        self.badgeValueBtn.frame = rect;
        [self.badgeValueBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self.badgeValueBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        
        self.badgeValueBtn.alpha = 1.0;
        [self.badgeValueBtn setTitle:number forState:UIControlStateNormal];
        [self.badgeValueBtn setTitle:number forState:UIControlStateDisabled];
    }
}

-(void)setBadgeValue:(NSNotification*)data
{
    NSString *strNum = [data object];
    
    [self showBadgeValue:strNum];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if (_firstIn)
    {
        [self.tabBar addSubview:self.badgeValueBtn];
        
        _firstIn = NO;
    }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    return YES;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    
    
    [super setSelectedIndex:selectedIndex];
    
#if kPanUISwitch
    YGHAuthManagerNavViewController *nav = (YGHAuthManagerNavViewController *)[self.viewControllers objectAtIndex:selectedIndex];
    UIImage *image = [nav.arrayScreenshot lastObject];
    if (image)
        [AppDelegate currentAppDelegate].screenshotView.imgView.image = image;
#endif
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if (self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
        [self.tabBarDelegate performSelector:@selector(tabBarController:didSelectViewController:)];
    }
    
#if kPanUISwitch
    YGHAuthManagerNavViewController *nav = (YGHAuthManagerNavViewController *)[self.viewControllers objectAtIndex:self.selectedIndex];
    UIImage *image = [nav.arrayScreenshot lastObject];
    if (image)
        [AppDelegate currentAppDelegate].screenshotView.imgView.image = image;
#endif
}



- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    
}

- (void)loginDidOk
{
    [self setSelectedIndex:4];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationPortrait==interfaceOrientation);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
}

- (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
        [super presentViewController:modalViewController animated:animated completion:NULL];
    }else{
        [super presentModalViewController:modalViewController animated:animated];
    }
}

@end
