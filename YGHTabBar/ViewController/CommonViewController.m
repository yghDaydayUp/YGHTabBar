//
//  CommonViewController.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "CommonViewController.h"
#import "YGHAuthManagerNavViewController.h"
#import "YGHScreenShotNavViewController.h"
#import "NSObject+BoardManage.h"
#import "Header.h"
#import "YGHUIBarButtonItem.h"
@implementation CommonViewController{

 
}
-(void)viewDidLoad{
    
    [super viewDidLoad];

    YGHUIBarButtonItem *item = [YGHUIBarButtonItem itemWithTitle:nil
                                                         Style:SNNavItemStyleBack
                                                        target:self
                                                        action:@selector(backForePage)];
    self.navigationItem.leftBarButtonItem = item;

}

- (void)backForePage
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    UILabel *_titleView = [[UILabel alloc] init];
    UInt32 hex=0x313131;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    
    _titleView.textColor =  [UIColor colorWithRed:r / 255.0f
                                            green:g / 255.0f
                                             blue:b / 255.0f
                                            alpha:1.0f];
    
    _titleView.backgroundColor = [UIColor clearColor];
    _titleView.font = [UIFont systemFontOfSize:19.0f];
    _titleView.textAlignment = NSTextAlignmentCenter;
    
    
    CGRect frame = _titleView.frame;
    
    _titleView.frame = CGRectMake(frame.origin.x, 5, frame.size.width, 34);
    self.navigationItem.titleView = _titleView;
    _titleView.text = title;
    
    
}

- (void)goAround
{
    [self jumpToHomeBoard];
}

@end
