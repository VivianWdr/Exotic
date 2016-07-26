//
//  HCKeyFrameAnimationView.h
//  HCKeyFrameAnimationView
//
//  Created by 王恕 on 16/3/3.
//  Copyright © 2016年 王恕. All rights reserved.
//
/*
 1.常规动画属性设置（可以同时选择多个进行设置）
 UIViewAnimationOptionLayoutSubviews：子视图跟随父视图一起动画
 UIViewAnimationOptionAllowUserInteraction：动画过程中允许用户交互。
 UIViewAnimationOptionBeginFromCurrentState：从当前状态开始运行
 UIViewAnimationOptionRepeat：重复运行动画。
 UIViewAnimationOptionAutoreverse：动画运行到结束点后仍然以动画方式回到初始点，前提是设置动画无限重复
 UIViewAnimationOptionOverrideInheritedDuration：忽略外层嵌套动画时间设置
 UIViewAnimationOptionOverrideInheritedCurve：忽略外层嵌套动画速度设置。
 UIViewAnimationOptionAllowAnimatedContent：动画过程中重绘视图，仅适用于转场动画
 UIViewAnimationOptionShowHideTransitionViews：视图切换时直接隐藏旧视图、显示新视图，而不是将旧视图从父视图移除，仅转场动画
 UIViewAnimationOptionOverrideInheritedOptions：不继承父动画设置或动画类型。
 
 2.动画速度控制（可从其中选择一个设置）
 UIViewAnimationOptionCurveEaseInOut：动画先缓慢，然后逐渐加速
 UIViewAnimationOptionCurveEaseIn：动画逐渐变慢
 UIViewAnimationOptionCurveEaseOut：动画逐渐加速
 UIViewAnimationOptionCurveLinear：动画匀速执行，默认值。
 
 3.转场类型（仅适用于转场动画设置，可以从中选择一个进行设置，基本动画、关键帧动画不需要设置）
 UIViewAnimationOptionTransitionNone：没有转场动画效果。
 UIViewAnimationOptionTransitionFlipFromLeft：从左侧翻转效果。
 UIViewAnimationOptionTransitionFlipFromRight：从右侧翻转效果。
 UIViewAnimationOptionTransitionCurlUp：向后翻页的动画过渡效果。
 UIViewAnimationOptionTransitionCurlDown：向前翻页的动画过渡效果。
 UIViewAnimationOptionTransitionCrossDissolve：旧视图溶解消失显示下一个新视图的效果。
 UIViewAnimationOptionTransitionFlipFromTop：从上方翻转效果。
 UIViewAnimationOptionTransitionFlipFromBottom：从底部翻转效果。
 */
#import <UIKit/UIKit.h>

@interface HCKeyFrameAnimationView : UIView

+(instancetype) keyFrameAnimationView;

@end
