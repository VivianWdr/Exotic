//
//  CodingStandardsViewController.m
//  Exotic
//
//  Created by HCZH on 16/10/12.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "CodingStandardsViewController.h"
#import <objc/runtime.h>

@interface CodingStandardsViewController ()
@end

static void *EOCMyAlertViewKey = "EOCMyAlertViewKey";

@implementation ExoticPerson{
    NSMutableSet *_internalFriends;   //实现文件里的不可变集合
}

- (NSSet *) friends{
    return [_internalFriends copy];  //get方法返回的永远是可变set的不可变型
}


- (void)addFriend:(ExoticPerson*)person {
    [_internalFriends addObject:person]; //在外部增加集合元素的操作
    //do something when add element
}

- (void)removeFriend:(ExoticPerson*)person {
    [_internalFriends removeObject:person]; //在外部移除元素的操作
    //do something when remove element
}

- (id)initWithFirstName:(NSString*)firstName andLastName:(NSString*)lastName {
    
    if ((self = [super init])) {
        //如果属性定义为copy，那么在非设置方法里设定属性的时候，也要遵循copy的语义
        _firstName = [firstName copy];
        _lastName = [lastName copy];
        _internalFriends = [NSMutableSet new];
    }
    return self;
}
@end


@implementation CodingStandardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array = @[@1,@2,@3];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"obj_:%@",obj);
    }];
    
//    NSBundle *bundle = [NSBundle mainBundle];//获取程序目录
    
}
/**
 *  栈块：其所占内存区域是分配在栈中的，而且只在定义它的那个范围内有效（只在if else语句范围内有效）
 */
- (void) setBlock{
    void (^block)();
    if (/* DISABLES CODE */ (1)) {
        block = ^{
            NSLog(@"Block A");
        };
    }else{
        block = ^{
            NSLog(@"Block B");
        };
    }
    
    block ();
}
/**
 *  10.关联对象：objc_setAssociatedObject
 */
- (void) askUserAQuestion{
//    objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
