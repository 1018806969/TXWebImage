//
//  UIImageView+WebCaches.m
//  TXWebImage
//
//  Created by deng on 16/6/16.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "UIImageView+WebCaches.h"
#import "TXImageManager.h"

@implementation UIImageView (WebCaches)



-(void)tx_setImageWithUrlString:(NSString *)urlString placeholdImageName:(NSString *)placeholdImageName failureImageName:(NSString *)failureImageName;
{
    TXImageManager *Manager = [TXImageManager shareImageManager];
    
    UIImage *image = [Manager searchFromMemoryWithUrlString:urlString];
    if (image) {
        self.image = image;
        return ;
    }

    
    image = [Manager seatchFromSandBoxWithUrlString:urlString];
    if (image) {
        self.image = image ;
        return ;
    }
    
    self.image = [UIImage imageNamed:placeholdImageName];
    [Manager downloadWithUrlString:urlString sccessed:^(UIImage *image) {
        self.image = image ;
    } failure:^(UIImage *image) {
        self.image = [UIImage imageNamed:failureImageName];
    }];
    
}
@end
