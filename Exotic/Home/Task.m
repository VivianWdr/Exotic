//
//  Task.m
//  Exotic
//
//  Created by HCZH on 16/7/25.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "Task.h"

@implementation Task

-(void) beginTaskCallbackBlock:(CallbackBlock) callbackBlock{
    
    
    NSLog(@"Begin Task! After 3s Finish!");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callbackBlock();
        self.callbackBlock();
    });
}
 
@end
