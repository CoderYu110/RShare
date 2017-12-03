//
//  RSharePanel.h
//  HyCurrency
//
//  Created by rui on 2017/11/22.
//  Copyright © 2017年 ---. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RShareManager.h"

@protocol RShareDelegate <NSObject>
@optional
- (NSString *)titleWithScene:(JYScene)scene;
- (NSString *)messageWithScene:(JYScene)scene;
- (NSString *)linkWithScene:(JYScene)scene;

- (UIImage *)imageWithScene:(JYScene)scene;//默认使用logo

@end


@interface RSharePanel : UIView

+ (id)loadFromXib;

@property (weak, nonatomic) id<RShareDelegate>delegate;

- (void)show;

@end
