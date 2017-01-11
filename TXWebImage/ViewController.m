//
//  ViewController.m
//  TXWebImage
//
//  Created by deng on 16/6/16.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCaches.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    [self.view addSubview:imageView];
    
    
    [imageView tx_setImageWithUrlString:@"http://i6.topit.me/6/5d/45/1131907198420455d6o.jpg" placeholdImageName:@"place" failureImageName:@"re"];
    
    
    
    
    
}
- (IBAction)click:(id)sender {
    [self.imageV tx_setImageWithUrlString:@"http://i6.topit.me/6/5d/45/1131907198420455d6o.jpg" placeholdImageName:@"place" failureImageName:@"re"];
}


@end
