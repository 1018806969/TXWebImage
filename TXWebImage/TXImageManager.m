//
//  TXImageManager.m
//  TXWebImage
//
//  Created by deng on 16/6/16.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TXImageManager.h"

@implementation TXImageManager


+(instancetype)shareImageManager
{
    static TXImageManager *manager;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[TXImageManager alloc]init];
    });
    return manager ;
}
static NSMutableDictionary *imageDic ;
-(id)init
{
    self = [super init];
    if (self) {
        imageDic = [[NSMutableDictionary alloc]init];
    }
    return self ;
}

-(UIImage *)searchFromMemoryWithUrlString:(NSString *)urlString
{
    UIImage *image = [imageDic objectForKey:urlString];
    NSLog(@"------search------%@-----------%@",image,urlString);
    return image ;
}
-(UIImage *)seatchFromSandBoxWithUrlString:(NSString *)urlString
{
    NSString *imagePath = [self getFilePathWithUrlString:urlString];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (image) {
        [imageDic setObject:image forKey:urlString];
    }
    return image;
}
-(NSString *)getFilePathWithUrlString:(NSString *)urlString
{
    NSString *name = [[urlString componentsSeparatedByString:@"/"] lastObject];
    NSString * directoryPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/imageCaches"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:directoryPath]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@",directoryPath,name];
    return imagePath ;
}
-(void)downloadWithUrlString:(NSString *)urlString sccessed:(txBlock)sccessed failure:(txBlock)failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        UIImage *image = [UIImage imageWithData:data];
        if (image) {
            [imageDic setObject:image forKey:urlString];
            NSLog(@"----set--------%@----------%@-------image=%@",image,urlString,[imageDic objectForKey:urlString]);
            [data writeToFile:[self getFilePathWithUrlString:urlString] atomically:YES];
            dispatch_async(dispatch_get_main_queue(), ^{
                sccessed(image);
            });
        }else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(nil);
            });
        }
    });
}
@end
