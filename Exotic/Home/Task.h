//
//  Task.h
//  Exotic
//
//  Created by HCZH on 16/7/25.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ CallbackBlock) (void);

@interface Task : NSObject

@property (nonatomic,copy) CallbackBlock callbackBlock;

-(void) beginTaskCallbackBlock:(CallbackBlock)callbackBlock;

@end
