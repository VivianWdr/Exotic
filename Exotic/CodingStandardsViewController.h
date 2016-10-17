//
//  CodingStandardsViewController.h
//  Exotic
//
//  Created by HCZH on 16/10/12.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodingStandardsViewController : UIViewController

@end

/**
 *  第七条：在对象内部尽量直接访问实例变量
 */
@interface ExoticPerson : NSObject

@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic, strong, readonly) NSSet *friends;


- (id)initWithFirstName:(NSString*)firstName andLastName:(NSString*)lastName;
- (void)addFriend:(ExoticPerson*)person;
- (void)removeFriend:(ExoticPerson*)person;

/**
 *  方法命名：每个冒号左边的方法部分最好与右边的参数名一致。
 */

- (id)initWithWidth:(float)width andHeight:(float)height;

/**
 *  获取”是否“的布尔值，应该增加“is”前缀：- isEqualToString:
 */
/**
 *  获取“是否有”的布尔值，应该增加“has”前缀：- hasPrefix:
 */

/**
 *  为私有方法加前缀
 */
- (void)publicMethod;
- (void)p_privateMethod;

@end