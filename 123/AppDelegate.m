//
//  AppDelegate.m
//  123
//
//  Created by ZLMac on 14-11-4.
//  Copyright (c) 2014年 lgwh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

//    self.ADView = [[AdvertisingView alloc] initWithFrame:CGRectMake(0, 200, 320, 144)];
//    [self.window addSubview:_ADView];
    self.player = [[ImagePlayerView alloc] initWithFrame:CGRectMake(0, 0, 320, 140)];
    self.imageURLs = @[[NSURL URLWithString:@"http://www.ghzw.cn/wzsq/UploadFiles_9194/201109/20110915154150869.bmp"],
                       [NSURL URLWithString:@"http://sudasuta.com/wp-content/uploads/2013/10/10143181686_375e063f2c_z.jpg"],
                       [NSURL URLWithString:@"http://www.yancheng.gov.cn/ztzl/zgycddhsdgy/xwdt/201109/W020110902584601289616.jpg"],
                       [NSURL URLWithString:@"http://fzone.oushinet.com/bbs/data/attachment/forum/201208/15/074140zsb6ko6hfhzrb40q.jpg"]];
    [self.player initWithCount:self.imageURLs.count delegate:self];
    self.player.scrollInterval = 5.0f;
    
    // adjust pageControl position
    self.player.pageControlPosition = ICPageControlPosition_BottomRight;
    
    // hide pageControl or not
     self.player.hidePageControl = NO;
    [self.window addSubview:self.player];
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark - ImagePlayerViewDelegate
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    // recommend to use SDWebImage lib to load web image
    //    [imageView setImageWithURL:[self.imageURLs objectAtIndex:index] placeholderImage:nil];
    
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[self.imageURLs objectAtIndex:index]]];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"did tap index = %d", (int)index);
}

- (void)initADView:(NSArray*)images
{
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
