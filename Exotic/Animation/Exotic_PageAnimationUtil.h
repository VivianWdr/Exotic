//
//  Exotic_PageAnimationUtil.h
//  Exotic
//
//  Created by HCZH on 16/7/12.
//  Copyright © 2016年 陈维维. All rights reserved.
//

/*
 *子类：CAAnimationGrop CATransition CAPropertyAnimation
 CAPropertyAnimation(不可直接使用，要使用它的子类)：CABasicAnimation CAKeyframeAnimation
 * 常见属性有：
 
 1> duration：动画的持续时间
 
 2> repeatCount：动画的重复次数
 
 3> timingFunction：控制动画运行的节奏
 
 timingFunction可选的值有：
 kCAMediaTimingFunctionLinear（线性）：匀速，给你一个相对静态的感觉
 kCAMediaTimingFunctionEaseIn（渐进）：动画缓慢进入，然后加速离开
 kCAMediaTimingFunctionEaseOut（渐出）：动画全速进入，然后减速的到达目的地
 kCAMediaTimingFunctionEaseInEaseOut（渐进渐出）：动画缓慢的进入，中间加速，然后减速的到达目的地。这个是默认的动画行为。
 4> delegate：动画代理，用来监听动画的执行过程
 
 5> delegate:
 动画开始的时候调用
 - (void)animationDidStart:(CAAnimation *)anim;
 动画停止的时候调用
 - (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
 
 6> repeatCount :重复次数
 
 7> removedOnCompletion:YES
 NO:
 fillMode决定当前对象在非active时间段的行为。（要想fillMode有效，最好设置removedOnCompletion = NO）
 
 kCAFillModeRemoved 这个是默认值，也就是说当动画开始前和动画结束后，动画对layer都没有影响，动画结束后，layer会恢复到之前的状态
 
 kCAFillModeForwards 当动画结束后，layer会一直保持着动画最后的状态
 kCAFillModeBackwards 在动画开始前，只需要将动画加入了一个layer，layer便立即进入动画的初始状态并等待动画开始。
 
 kCAFillModeBoth 这个其实就是上面两个的合成.动画加入后开始之前，layer便处于动画初始状态，动画结束后layer保持动画最后的状态
 
 
 下面我总结一下常用动画的 keyPath
 
 transform.rotation：旋转动画。
 transform.rotation.x：按x轴旋转动画。
 transform.rotation.y：按y轴旋转动画。
 transform.rotation.z：按z轴旋转动画。
 transform.scale：按比例放大缩小动画。
 transform.scale.x：在x轴按比例放大缩小动画。
 transform.scale.y：在y轴按比例放大缩小动画。
 transform.scale.z：在z轴按比例放大缩小动画。
 position：移动位置动画。
 opacity：透明度动画。
 
 动画开始执行的时候触发这个方法:
 - (void)animationDidStart:(CAAnimation *)anim;
 
 动画执行完毕的时候触发这个方法
 - (void)anmiationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Exotic_PageAnimationUtil : NSObject

+ (void)viewAnimationWithView:(UIView *)view;

+ (void)ViewKeyframeAnimationWithImageView:(UIImageView *)imageView;

@end
