//
//  YGHScreenShotNavViewController.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "YGHScreenShotNavViewController.h"
#import "AppDelegate.h"
#import "Header.h"
#define DISTANCETOPOP 80
@interface YGHScreenShotNavViewController ()<UIGestureRecognizerDelegate>

@end
@implementation YGHScreenShotNavViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.arrayScreenshot = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesIng:)];
    _panGes.delegate = self;
    [self.view addGestureRecognizer:_panGes];
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {

    return YES;
}


- (void)panGesIng:(UIPanGestureRecognizer *)panGes
{
    //NSLog(@"nav pan");
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIViewController *rootVC = appdelegate.window.rootViewController;
    UIViewController *presentedVC = rootVC.presentedViewController;
    if (self.viewControllers.count == 1)
    {
        
        return;
    }
    if (panGes.state == UIGestureRecognizerStateBegan)
    {
        
        appdelegate.screenshotView.hidden = NO;
        
    }
    else if (panGes.state == UIGestureRecognizerStateChanged)
    {
        
        CGPoint pt = [panGes translationInView:self.view];
        
        if (pt.x >= 100)
        {
            
            rootVC.view.transform = CGAffineTransformMakeTranslation(pt.x - 100, 0);
            presentedVC.view.transform = CGAffineTransformMakeTranslation(pt.x - 100, 0);
        }
    }
    else if (panGes.state == UIGestureRecognizerStateEnded)
    {
        
        CGPoint pt = [panGes translationInView:self.view];
        if (pt.x >= DISTANCETOPOP)
        {
            [UIView animateWithDuration:0.3 animations:^{
                rootVC.view.transform = CGAffineTransformMakeTranslation(kDeviceWidth, 0);
                presentedVC.view.transform = CGAffineTransformMakeTranslation(kDeviceWidth, 0);
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
                appdelegate.screenshotView.hidden = YES;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^{
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                appdelegate.screenshotView.hidden = YES;
            }];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
#if kPanUISwitch
    
    if (self.viewControllers.count == 0)
        return [super pushViewController:viewController animated:animated];
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(kDeviceWidth,KDeviceHeight), NO, 0);
    [appdelegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.arrayScreenshot addObject:viewImage];
    
    appdelegate.screenshotView.imgView.image = viewImage;
#endif
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
#if kPanUISwitch
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.arrayScreenshot removeLastObject];
    UIImage *image = [self.arrayScreenshot lastObject];
    
    if (image)
        appdelegate.screenshotView.imgView.image = image;
#endif
    UIViewController *v = [super popViewControllerAnimated:animated];
    return v;
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
#if kPanUISwitch
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (self.arrayScreenshot.count > 2)
    {
        [self.arrayScreenshot removeObjectsInRange:NSMakeRange(1, self.arrayScreenshot.count - 1)];
    }
    UIImage *image = [self.arrayScreenshot lastObject];
    if (image)
        appdelegate.screenshotView.imgView.image = image;
#endif
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *arr = [super popToViewController:viewController animated:animated];
    
    if (self.arrayScreenshot.count > arr.count)
    {
        for (int i = 0; i < arr.count; i++) {
            
            [self.arrayScreenshot removeLastObject];
        }
    }
    return arr;
}

@end


