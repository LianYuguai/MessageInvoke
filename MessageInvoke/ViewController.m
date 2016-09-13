//
//  ViewController.m
//  MessageInvoke
//
//  Created by yulong on 16/9/12.
//  Copyright © 2016年 com.YL. All rights reserved.
//

#import "ViewController.h"
#import "FirstTarget.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    id firstTarget = [[FirstTarget alloc] init];
    [firstTarget run];
//    [firstTarget noneClassMethod];
//    [firstTarget performSelector:@selector(noneClassMethod)];
    [firstTarget performSelector:@selector(walk)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
