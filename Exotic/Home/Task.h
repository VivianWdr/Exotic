//
//  Task.h
//  Exotic
//
//  Created by HCZH on 16/7/25.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

-(void) beginTaskCallbackBlock:(void (^) (void))callbackBlock;

@end
