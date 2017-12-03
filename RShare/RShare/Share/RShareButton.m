//
//  RShareButton.m
//  HyCurrency
//
//  Created by rui on 2017/11/23.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "RShareButton.h"

@implementation RShareButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initSet];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
       [self initSet];
    }
    return self;
}

- (void)initSet
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.imageView.contentMode = UIViewContentModeCenter;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
     return CGRectMake(0,contentRect.size.height * 0.66, contentRect.size.width, contentRect.size.height * 0.33);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0,0, contentRect.size.width, contentRect.size.height * 0.66);
}
@end
