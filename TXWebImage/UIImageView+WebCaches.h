//
//  UIImageView+WebCaches.h
//  TXWebImage
//
//  Created by deng on 16/6/16.
//  Copyright © 2016年 txx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebCaches)


-(void)tx_setImageWithUrlString:(NSString *)urlString placeholdImageName:(NSString *)placeholdImageName failureImageName:(NSString *)failureImageName;

@end
