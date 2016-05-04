//
//  HomeViewController.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "HomeViewController.h"
#import "OtherViewController.h"
#import "Header.h"
@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"首页"];
    self.navigationItem.leftBarButtonItem = nil;
    [self.view addSubview:self.nextButton];
    
}

- (UIButton *)nextButton
{
    if (!_nextButton)
    {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectMake((kDeviceWidth-80)/2, 180, 80, 50);
        [_nextButton setBackgroundColor:[UIColor grayColor]];
        [_nextButton setTitle:@"下一页" forState:UIControlStateNormal];
        [_nextButton.layer setMasksToBounds:YES];
        [_nextButton.layer setCornerRadius:5.0];
        [_nextButton addTarget:self
                          action:@selector(next)
                forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}
-(void)next{

    OtherViewController* vc = [[OtherViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
