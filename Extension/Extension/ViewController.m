//
//  ViewController.m
//  Extension
//
//  Created by whde on 16/2/29.
//  Copyright © 2016年 Whde. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>
@interface ViewController ()<ADBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ADBannerView *bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeMediumRectangle];
    bannerView.center = self.view.center;
    bannerView.delegate = self;
    [self.view addSubview:bannerView];
}
- (void)bannerViewWillLoadAd:(ADBannerView *)banner {
    NSLog(@"- (void)bannerViewWillLoadAd:(ADBannerView *)banner ");
}
- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    NSLog(@"- (void)bannerViewDidLoadAd:(ADBannerView *)banner");
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error;");
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    NSLog(@"- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave;");
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner; {
    NSLog(@"- (void)bannerViewActionDidFinish:(ADBannerView *)banner;");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
