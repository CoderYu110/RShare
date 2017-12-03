//
//  RShareManager.h
//  HyCurrency
//
//  Created by rui on 2017/11/22.
//  Copyright © 2017年 ---. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RShareInfo.h"

@protocol RShareManagerDelegate <NSObject>

- (void)shareManagerDidRecvMessageResponse:(NSString *)responseMsg;

@end

@interface RShareManager : NSObject

@property (weak, nonatomic) id<RShareManagerDelegate> delegate;

+ (id)defaultManager;

+ (void)registerShareAppKeys;

+ (BOOL)handleOpenURL:(NSURL *)url;

+ (void)sendReq:(RShareInfo *)shareInfo;

@end
