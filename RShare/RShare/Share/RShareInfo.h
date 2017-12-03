//
//  RShareInfo.h
//  HyCurrency
//
//  Created by rui on 2017/11/23.
//  Copyright © 2017年 ---. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, JYScene) {
    JYSceneNone                 = 0,
    JYSceneWXSession            = 1 << 0, /**< 微信聊天界面    */
    JYSceneWXTimeline           = 1 << 1, /**< 微信朋友圈      */
};

@interface RShareInfo : NSObject

@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSString *message;

@property (strong, nonatomic) NSString *link;

@property (strong, nonatomic) UIImage *image;

@property (assign, nonatomic) JYScene scene;

@end
