//
//  RShareManager.m
//  HyCurrency
//
//  Created by rui on 2017/11/22.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "RShareManager.h"
#import "WXApi.h"

@interface RShareManager()<WXApiDelegate>

@end

@implementation RShareManager

static RShareManager *_shareManager;
+ (id)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[RShareManager alloc] init];
    });
    return _shareManager;
}

+ (void)registerShareAppKeys
{
    [self registerWXApp];
}

+ (void)registerWXApp
{
    [WXApi registerApp:@"wxXXXXXXXXXXXXXX" enableMTA:YES];
    //向微信注册支持的文件类型
    UInt64 typeFlag = MMAPP_SUPPORT_TEXT | MMAPP_SUPPORT_PICTURE | MMAPP_SUPPORT_LOCATION | MMAPP_SUPPORT_VIDEO |MMAPP_SUPPORT_AUDIO | MMAPP_SUPPORT_WEBPAGE | MMAPP_SUPPORT_DOC | MMAPP_SUPPORT_DOCX | MMAPP_SUPPORT_PPT | MMAPP_SUPPORT_PPTX | MMAPP_SUPPORT_XLS | MMAPP_SUPPORT_XLSX | MMAPP_SUPPORT_PDF;
    [WXApi registerAppSupportContentFlag:typeFlag];
}

+ (BOOL)handleOpenURL:(NSURL *)url
{
   return [WXApi handleOpenURL:url delegate:[RShareManager defaultManager]];
}

+ (void)sendReq:(RShareInfo *)shareInfo
{
    JYScene scene = shareInfo.scene;
    if (scene == JYSceneWXSession || scene == JYSceneWXTimeline) {
        [self sendWXReq:shareInfo];
    }
}
/**
 分享到微信
 */
+ (void)sendWXReq:(RShareInfo *)shareInfo
{
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = shareInfo.link;
    WXMediaMessage *mediaMessage = [WXMediaMessage message];
    mediaMessage.title = shareInfo.title;
    mediaMessage.description = shareInfo.message;
    mediaMessage.mediaObject = ext;
    [mediaMessage setThumbImage:shareInfo.image];
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    if (shareInfo.scene == JYSceneWXSession) {
        req.scene = WXSceneSession;
    }else{
        req.scene = WXSceneTimeline;
    }
    req.message = mediaMessage;
    [WXApi sendReq:req];
}


#pragma mark - WXApiDelegate

-(void)onResp:(BaseResp*)resp
{
    NSString *msg = resp.errStr;
    if (resp.errCode == WXSuccess) {
        msg = @"分享成功";
    }else {
        msg = @"分享失败";
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareManagerDidRecvMessageResponse:)]) {
        [self.delegate shareManagerDidRecvMessageResponse:msg];
    }
}

@end
