//
//  AdvertisingView.m
//  123
//
//  Created by ZLMac on 14-11-4.
//  Copyright (c) 2014年 lgwh. All rights reserved.
//

#import "AdvertisingView.h"
@implementation AdvertisingView

- (id)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Initialization code
        
        imageArray = [[NSMutableArray alloc] initWithObjects:@"http://img0.bdstatic.com/img/image/shouye/lylbjzg.jpg",@"http://img0.bdstatic.com/img/image/shouye/lyngaomen.jpg",@"http://a.hiphotos.baidu.com/album/crop%3D0%2C116%2C800%2C331%3Bh%3D240/sign=b799554c9f16fdfacc239cae89bfa065/6d81800a19d8bc3ea143a8ad808ba61ea8d34509.jpg",nil];
        
        
        [self configUserInterface];
        
        [self configAdvert:imageArray];
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    
    }
    
    return self;
    
}
-(void)configAdvert:(NSArray *)imgArray

{
    
    
    
    [self AdImg:imgArray];
    
    [self setCurrentPage:_PageControl.currentPage];
    
    
    
}

-(void)configUserInterface{
    
    
    _sv=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 144)];
    
    _sv.delegate=self;
    
    _sv.showsHorizontalScrollIndicator=NO;
    
    _sv.showsVerticalScrollIndicator=NO;
    
    _sv.pagingEnabled=YES;
    
    [self addSubview:_sv ];
    
    
    
    _PageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(320/2-15, _sv.frame.size.height-23 , 30, 30)];
    
    [self addSubview:_PageControl ];
    
    
    
    
    
    
}

-(void)AdImg:(NSArray*)arr{
    
    [_sv setContentSize:CGSizeMake(320*[arr count], 144)];
    
    _PageControl.numberOfPages=[arr count];
    
    
    
    for ( int i=0; i<[arr count]; i++) {
        
        NSString *url=[arr objectAtIndex:i];
        NSLog(@"%@",url);
        UIButton *img=[[UIButton alloc]initWithFrame:CGRectMake(320*i, 0, 320, 144)];
        
        [img addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
        img.tag = i;
        [_sv addSubview:img];
        
        //[img setImage:[UIImage imageNamed:@"jiazai_test@2x.png"] forState:UIControlStateNormal];
        
        UIImageFromURL( [NSURL URLWithString:url], ^( UIImage * image )
                       
                       {
                           
                           [img setBackgroundImage:image forState:UIControlStateNormal];
                           
                       }, ^(void){
                           
                       });
        
    }
    
    
    
}


void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void) )

{
    
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   
                   {
                       
                       NSData * data = [[NSData alloc] initWithContentsOfURL:URL] ;
                       
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           
                           if( image != nil )
                               
                           {
                               
                               imageBlock( image );
                               
                           } else {
                               
                               errorBlock();
                               
                           }
                           
                       });
                       
                   });
    
}
- (void)Action:(UIButton*)sender
{
    NSLog(@"%d",sender.tag);
}
#pragma mark - 5秒换图片

- (void) handleTimer: (NSTimer *) timer

{
    
    if (TimeNum % 3 == 0 ) {
        
        
        
        if (!Tend) {
            
            _PageControl.currentPage++;
            
            if (_PageControl.currentPage==_PageControl.numberOfPages-1) {
                
                Tend=YES;
                
            }
            
        }else{
            
            _PageControl.currentPage--;
            
            if (_PageControl.currentPage==0) {
                
                Tend=NO;
                
            }
            
        }
        
        
        
        [UIView animateWithDuration:0.8 //速度0.7秒
         
                         animations:^{//修改坐标
                             
                             _sv.contentOffset = CGPointMake(_PageControl.currentPage*320,0);
                             
                         }];
        
        
        
        
        
    }
    
    TimeNum ++;
    
}


#pragma mark - scrollView && page

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"我滑动了");
    
    _PageControl.currentPage = scrollView.contentOffset.x/320;
    
    [self setCurrentPage:_PageControl.currentPage];
    
    
    
    
    
}

- (void) setCurrentPage:(NSInteger)secondPage {
    
    
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [_PageControl.subviews count]; subviewIndex++) {
        
        UIImageView* subview = [_PageControl.subviews objectAtIndex:subviewIndex];
        
        //这里犯了一个小错误，如果不加类型判断的话会报错找不到setimage方法的错，所以一定要
        
        //判断是uiview还是uiimageview
        
        if ([subview isKindOfClass:[UIImageView class]]) {
            
            CGSize size;
            
            size.height = 12/2;
            
            size.width = 12/2;
            
            [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                         
                                         size.width,size.height)];
            
            if (subviewIndex == secondPage){
                 NSLog(@"111");
                [subview setImage:[UIImage imageNamed:@"a.png"]];
            }
            else{
                 NSLog(@"222");
                [subview setImage:[UIImage imageNamed:@"d.png"]];}
            
        }
        
        
        
        
        
    }
    
}


@end


