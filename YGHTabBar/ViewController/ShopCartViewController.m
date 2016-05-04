//
//  ShopCartViewController.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "ShopCartViewController.h"
#import "Header.h"
#import "AppDelegate.h"

static int badgeValue;
@implementation ShopCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"购物车"];
    self.navigationItem.leftBarButtonItem = nil;
    [self.view addSubview:self.goHomeButton];
    [self.view addSubview:self.addButton];
    [self.view addSubview:self.clearButton];
}

- (AppDelegate *)appDelegate
{
    return [AppDelegate currentAppDelegate];
}
- (UIButton *)goHomeButton
{
    if (!_goHomeButton)
    {
        _goHomeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _goHomeButton.frame = CGRectMake((kDeviceWidth-80)/2, 160, 80, 50);
        [_goHomeButton setBackgroundColor:[UIColor grayColor]];
        [_goHomeButton setTitle:@"去首页" forState:UIControlStateNormal];
        [_goHomeButton.layer setMasksToBounds:YES];
        [_goHomeButton.layer setCornerRadius:5.0];
        [_goHomeButton addTarget:self
                           action:@selector(goHome)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    return _goHomeButton;
}
- (UIButton *)addButton
{
    if (!_addButton)
    {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.frame = CGRectMake((kDeviceWidth-150)/2, 230, 150, 50);
        [_addButton setBackgroundColor:[UIColor grayColor]];
        [_addButton.layer setMasksToBounds:YES];
        [_addButton.layer setCornerRadius:5.0];
        [_addButton setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addButton addTarget:self
                          action:@selector(add)
                forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}
-(void)add{

     [self.appDelegate.tabBarViewController showBadgeValue:[NSString stringWithFormat:@"%d",badgeValue]];
    badgeValue++;

}

- (UIButton *)clearButton
{
    if (!_clearButton)
    {
        _clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearButton.frame = CGRectMake((kDeviceWidth-150)/2, 290, 150, 50);
        [_clearButton setBackgroundColor:[UIColor grayColor]];
        [_clearButton.layer setMasksToBounds:YES];
        [_clearButton.layer setCornerRadius:5.0];
        [_clearButton setTitle:@"清空购物车" forState:UIControlStateNormal];
        [_clearButton addTarget:self
                       action:@selector(clear)
             forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearButton;
}
-(void)clear{
    
    [self.appDelegate.tabBarViewController showBadgeValue:@"0"];
    badgeValue=0;
    
}

-(void)goHome{

  [self goAround];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    badgeValue=1;

}

@end
