//
//  SecondTarget.m
//  MessageInvoke
//
//  Created by yulong on 16/9/12.
//  Copyright © 2016年 com.YL. All rights reserved.
//

#import "SecondTarget.h"

@implementation SecondTarget
+(void)load
{
    NSLog(@"NoneClass _cmd: %@", NSStringFromSelector(_cmd));
}

- (void) noneClassMethod
{
    NSLog(@"_cmd: %@", NSStringFromSelector(_cmd));
}
@end
