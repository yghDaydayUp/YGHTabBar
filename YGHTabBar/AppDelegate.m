//
//  AppDelegate.m
//  YijietongBuy
//
//  Created by YangGH on 15/10/9.
//  Copyright © 2015年 YangGH. All rights reserved.
//

#import "AppDelegate.h"
#import "Header.h"

static char szListenTabbarViewMove[] = "listenTabViewMove";
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize tabBarViewController = tabBarViewController_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    /*初始化视图*/
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:frame];
    self.window.backgroundColor = [UIColor blackColor];
    [self changeToHomeViewController];
    [self.window makeKeyAndVisible];
    
#ifdef __IPHONE_7_0
   
       [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
   
#else
       [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
#endif
    
    
    return YES;
}

-(void) changeToHomeViewController{

    tabBarViewController_ = [[TabBarController alloc] init];
    self.window.rootViewController = tabBarViewController_;
    

    
#if kPanUISwitch
    self.screenshotView = [[YGHScreenShotView alloc] initWithFrame:CGRectMake(0, 0,kDeviceWidth, KDeviceHeight)];
    [self.window insertSubview:_screenshotView atIndex:0];
    
    [self.window.rootViewController.view addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:szListenTabbarViewMove];
    
    self.screenshotView.hidden = YES;
    
#endif

    
    
}


+ (AppDelegate *)currentAppDelegate
{
    
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

#if kPanUISwitch
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == szListenTabbarViewMove)
    {
        NSValue *value  = [change objectForKey:NSKeyValueChangeNewKey];
        CGAffineTransform newTransform = [value CGAffineTransformValue];
       
        [self.screenshotView showEffectChange:CGPointMake(newTransform.tx, 0) ];
    }
}
#endif

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
