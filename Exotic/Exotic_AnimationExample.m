//
//  Exotic_AnimationExample.m
//  Exotic
//
//  Created by HCZH on 16/7/11.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "Exotic_AnimationExample.h"

@interface Exotic_AnimationExample ()

@end

@implementation Exotic_AnimationExample


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
 *  coreAnimation的实现
 */
- (void)initWithCABasicAnimation{
    //初始化动画对象
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    //设置动画keyPath
    animation.keyPath = @"string";
    //设置变化的属性值
    //设置动画时长、重复次数等属性
    //设置动画结束后是否返回原位
    //添加动画对象到view.layer
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
