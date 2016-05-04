//
//  YGHScreenShotView.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "YGHScreenShotView.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "Header.h"
@implementation YGHScreenShotView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.arrayImage = [NSMutableArray array];
        self.backgroundColor = [UIColor blackColor];
        self.imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        self.maskView = [[UIView alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.4];
        [self addSubview:_imgView];
        [self addSubview:_maskView];
    }
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
}

- (void)showEffectChange:(CGPoint)pt
{
    if (pt.x > 0)
    {
        
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:-pt.x / kDeviceWidth * 0.4 + 0.4];
        _imgView.transform = CGAffineTransformMakeScale(0.95 + (pt.x / kDeviceWidth * 0.05), 0.95 + (pt.x /kDeviceWidth * 0.05));
    }
}

- (void)restore
{
    if (_maskView && _imgView)
    {
        
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.4];
        _imgView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    }
}

@end

