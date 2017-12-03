//
//  ViewController.m
//  RShare
//
//  Created by rui on 2017/12/3.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "ViewController.h"

#import "RShareManager.h"
#import "RSharePanel.h"

@interface ViewController ()<RShareDelegate,RShareManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)share
{
    RSharePanel *sharePanel = [RSharePanel loadFromXib];
    sharePanel.delegate = self;
    [[RShareManager defaultManager] setDelegate:self];
    [sharePanel show];
}

#pragma mark - RShareDelegate

- (NSString *)linkWithScene:(JYScene)scene
{
    return @"http://www.baidu.com";
}

- (NSString *)messageWithScene:(JYScene)scene
{
    return @"描述";
}

- (NSString *)titleWithScene:(JYScene)scene
{
    return @"标题";
}

#pragma mark - JYManagerDelegate
//分享之后的回调
- (void)shareManagerDidRecvMessageResponse:(NSString *)responseMsg
{
  
}


@end
