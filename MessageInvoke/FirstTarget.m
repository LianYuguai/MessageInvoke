//
//  FirstTarget.m
//  MessageInvoke
//
//  Created by yulong on 16/9/12.
//  Copyright © 2016年 com.YL. All rights reserved.
//

#import "FirstTarget.h"
#import <objc/runtime.h>
#import "SecondTarget.h"
#import "ThirdTarget.h"
@implementation FirstTarget
void jump (id self,SEL _cmd){
    NSLog(@"*%@ %s*",self,sel_getName(_cmd));
}
//方案一
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(run))
    {
        class_addMethod([self class], sel, (IMP) jump, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
//方案二
- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    SecondTarget *secondTarget = [[SecondTarget alloc] init];
    if ([secondTarget respondsToSelector: aSelector]) {
        return secondTarget;
    }
    return [super forwardingTargetForSelector:aSelector];
}
//方案三
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"walk"]) {
        NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return sig;
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL selector = [anInvocation selector];
    ThirdTarget *thirdTarget = [[ThirdTarget alloc] init];
    if ([NSStringFromSelector(selector) isEqualToString:@"walk"]) {
        [anInvocation invokeWithTarget:thirdTarget];
    }
}
@end
