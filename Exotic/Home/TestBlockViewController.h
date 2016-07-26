//
//  TestBlockViewController.h
//  Exotic
//
//  Created by HCZH on 16/7/25.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestBlockViewController : UIViewController

@property (copy, nonatomic) void (^Complete) (BOOL isComplete);

@property (copy) void (^blockProperty) (void);
@property (copy, nonatomic) void (^blockPorpertyWithInput) (int);

@end
