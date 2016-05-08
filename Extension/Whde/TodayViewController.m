//
//  TodayViewController.m
//  Whde
//
//  Created by whde on 16/2/29.
//  Copyright © 2016年 Whde. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "CUIButtonTitleImage.h"
#include <objc/runtime.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *a = @[@"定位", @"WiFi",  @"移动网络", @"通知", @"声音", @"墙纸"];
    CGFloat width = self.view.frame.size.width/6.0;
    for (int i=0; i<a.count; i++) {
        CUIButtonTitleImage *btn = [[CUIButtonTitleImage alloc] initWithFrame:CGRectMake(width*i, 2, width, width)];
        [btn setTitle:@"-" forState:UIControlStateHighlighted];
        [btn setUpImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i]] withDownTitle:a[i] andColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, width);
    self.preferredContentSize = CGSizeMake(self.view.frame.size.width, width+2);
}
- (void)btnAction:(UIButton *)btn {
    switch (btn.tag) {
        case 0: {
            // 定位
            NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
            [self.extensionContext openURL:url completionHandler:nil];
            break;
        }
        case 1: {
            // WiFi
            NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
            [self.extensionContext openURL:url completionHandler:nil];
            break;
        }
        case 2: {
            // Network
            NSURL *url = [NSURL URLWithString:@"prefs:root=MOBILE_DATA_SETTINGS_ID"];
            [self.extensionContext openURL:url completionHandler:nil];
            break;
        }
        case 3: {
            // Notification
            NSURL *url = [NSURL URLWithString:@"prefs:root=NOTIFICATIONS_ID"];
            [self.extensionContext openURL:url completionHandler:nil];
            break;
        }
        case 4: {
            // Sounds
            NSURL *url = [NSURL URLWithString:@"prefs:root=Sounds"];
            [self.extensionContext openURL:url completionHandler:nil];
            break;
        }
        case 5: {
            //墙纸
//            NSURL *url = [NSURL URLWithString:@"prefs:root=Wallpaper"];
            NSURL *url = [NSURL URLWithString:@"http://weixin.qq.com/r/OEzUzGjEzTWyrSyv9xkq"];
            [self.extensionContext openURL:url completionHandler:nil];
            NSLog(@"%@", url);
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    completionHandler(NCUpdateResultNewData);
}

@end
