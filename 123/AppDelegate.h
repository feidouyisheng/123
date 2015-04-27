//
//  AppDelegate.h
//  123
//
//  Created by ZLMac on 14-11-4.
//  Copyright (c) 2014年 lgwh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdvertisingView.h"
#import "ImagePlayerView.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,ImagePlayerViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) AdvertisingView *ADView;
@property (nonatomic,strong) ImagePlayerView *player;

@property (nonatomic, strong) NSArray *imageURLs;
@end
