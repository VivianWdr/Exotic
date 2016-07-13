//
//  Exotic_PageAnimationUtil.m
//  Exotic
//
//  Created by HCZH on 16/7/12.
//  Copyright © 2016年 陈维维. All rights reserved.
//

/*
 UIView 有frame、bounds和center三个属性
 CALayer有frame、bounds、position和anchorPoint（CGPoint）
 
 @property CGPoint position
 @property CGPoint anchorPoint
 
 position点是相对suerLayer的，anchorPoint点是相对layer
 position是layer中的anchorPoint点在superLayer中的位置坐标
 
 position.x = frame.origin.x + anchorPoint.x * bounds.size.width；
 position.y = frame.origin.y + anchorPoint.y * bounds.size.height；
 
 anchorPoint的默认值为(0.5,0.5)
 position.x = frame.origin.x + 0.5 * bounds.size.width；
 position.y = frame.origin.y + 0.5 * bounds.size.height；
 */
#import "Exotic_PageAnimationUtil.h"

@implementation Exotic_PageAnimationUtil

/**
 *  CABasicAnimation
 *
 *  @param view Animation view
 */
+ (void)viewAnimationWithView:(UIView *)view{
    //初始化动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    //设置动画keyPath
    animation.keyPath = @"position";
    //设置变化的属性值
    CGPoint orignalPosition = view.layer.position;
    CGFloat orgnalX = orignalPosition.x;
    CGFloat orgnalY = orignalPosition.y;
    
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(orgnalX + 50, orgnalY)];
    
    //速度控制，运行节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //设置动画时长、重复次数等属性
    animation.duration = 2;
    animation.repeatCount = MAXFLOAT;//重复
    //设置动画结束后是否返回原位
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    //添加动画对象到view.layer
    [view.layer addAnimation:animation forKey:nil];
}

/**
 *  关键帧动画
 *
 *  @param imageView
 */
+ (void)ViewKeyframeAnimationWithImageView:(UIImageView *)imageView{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    //获取初始化position
    CGPoint orignalPosition = imageView.layer.position;
    CGFloat originalX = orignalPosition.x;
    CGFloat originalY = orignalPosition.y;
    
    //移动大小
    CGFloat moveMargin = 20;
    
    //设置Values属性
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(originalX + moveMargin, originalY + moveMargin)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(originalX + 2 * moveMargin, originalY)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(originalX + moveMargin, originalY - moveMargin)];
    NSValue *value4 = [NSValue valueWithCGPoint:orignalPosition];
    //思考：开头不添加value4的动画效果
    animation.values = @[value4,value1, value2, value3,value4];

    animation.duration = 2;
    animation.repeatCount = MAXFLOAT;
    [imageView.layer addAnimation:animation forKey:nil];
}
@end
