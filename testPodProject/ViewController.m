//
//  ViewController.m
//  testPodProject
//
//  Created by 陈培爵 on 2018/11/3.
//  Copyright © 2018年 PeiJueChen. All rights reserved.
//

#import "ViewController.h"
#import <OrderPlaceSDK/OrderPlaceSDK-Swift.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [OrderPlace openUrlWithCaller:self url:@"" options:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
