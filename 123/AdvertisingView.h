//
//  AdvertisingView.h
//  123
//
//  Created by ZLMac on 14-11-4.
//  Copyright (c) 2014年 lgwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvertisingView : UIView<UIScrollViewDelegate>
{
    int TimeNum;
    
    BOOL Tend;
    
    NSArray *imageArray;
}
@property (retain, nonatomic)  UIScrollView *sv;

@property (retain, nonatomic)  UIPageControl *PageControl;

- (void)configAdvert:(NSArray *) imgArray;

-(void)configUserInterface;

@end