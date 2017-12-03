//
//  RSharePanel.m
//  HyCurrency
//
//  Created by rui on 2017/11/22.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "RSharePanel.h"
//#import "PopView.h"

@interface RSharePanel ()
@end

@implementation RSharePanel

+ (id)loadFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.cornerRadius = 10;
}

- (IBAction)wxTimeLine:(id)sender
{
    [self RShare:JYSceneWXTimeline];
}

- (IBAction)wxSession:(id)sender
{
    [self RShare:JYSceneWXSession];
}

- (IBAction)cancel:(id)sender
{
//    [[PopView popView:self] dismiss];
}

- (void)RShare:(JYScene)scene
{
    if (self.delegate == nil) return;
    
    RShareInfo *shareInfo = [RShareInfo new];
    
    if ([self.delegate respondsToSelector:@selector(titleWithScene:)]) {
        shareInfo.title = [self.delegate titleWithScene:scene];
    }
    if ([self.delegate respondsToSelector:@selector(messageWithScene:)]) {
        shareInfo.message = [self.delegate messageWithScene:scene];
    }
    if ([self.delegate respondsToSelector:@selector(linkWithScene:)]) {
        shareInfo.link = [self.delegate linkWithScene:scene];
    }
    if ([self.delegate respondsToSelector:@selector(imageWithScene:)]) {
        shareInfo.image = [self.delegate imageWithScene:scene];
    }else {
        shareInfo.image = [UIImage imageNamed:@"login_icon.png"];
    }
    
    shareInfo.scene = scene;
//    [[PopView popView:self] dismiss:^{
        [RShareManager sendReq:shareInfo];
//    }];
}

- (void)show
{
//    PopView *pop =  [[PopView alloc] initWithContentView:self];
//    pop.popType = PopViewAnimationFromBottom;
//    [pop popInRect:CGRectMake(10, SCREEN_HEIGHT - self.height - 10, SCREEN_WIDTH-20, self.height)];
}

@end
