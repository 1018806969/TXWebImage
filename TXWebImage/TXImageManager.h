//
//  TXImageManager.h
//  TXWebImage
//
//  Created by deng on 16/6/16.
//  Copyright © 2016年 txx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TXImageManager : NSObject

typedef void(^txBlock)(UIImage *image) ;

+(instancetype)shareImageManager;

-(UIImage *)searchFromMemoryWithUrlString:(NSString *)urlString;

-(UIImage *)seatchFromSandBoxWithUrlString:(NSString *)urlString;

-(void)downloadWithUrlString:(NSString *)urlString sccessed:(txBlock)sccessed failure:(txBlock)failure;

@end
