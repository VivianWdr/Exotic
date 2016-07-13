//
//  HCKeyFrameAnimationView.m
//  HCKeyFrameAnimationView
//
//  Created by 王恕 on 16/3/3.
//  Copyright © 2016年 王恕. All rights reserved.
//

#import "HCKeyFrameAnimationView.h"

@interface HCKeyFrameAnimationView ()

@property (weak, nonatomic) IBOutlet UIImageView *birdImageView;
@property (weak, nonatomic) IBOutlet UIImageView *searchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


@end

@implementation HCKeyFrameAnimationView
- (IBAction)clickPlay:(id)sender {
    [self moveBirdView];
    
    [self moveSearchView];
    
    [self shakeIconView];
    
}

+(instancetype) keyFrameAnimationView{
    HCKeyFrameAnimationView *view = [[[NSBundle mainBundle] loadNibNamed:@"HCKeyFrameAnimationView" owner:self options:nil] lastObject];
    return view;
}

-(void) moveBirdView{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    //获取初始position
    CGPoint originalPosition = self.birdImageView.layer.position;
    CGFloat originalX = originalPosition.x;
    CGFloat originalY = originalPosition.y;
    CGFloat moveMargin = 20;
    
    //设置values属性
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(originalX + moveMargin, originalY + moveMargin)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(originalX + 2 * moveMargin, originalY)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(originalX + moveMargin, originalY - moveMargin)];
    NSValue *value4 = [NSValue valueWithCGPoint:originalPosition];
    //思考：开头不添加value4的动画效果
    animation.values = @[value4,value1, value2, value3,value4];
    
    animation.duration = 2.0;
    
    animation.repeatCount = MAXFLOAT;
    
    
    [self.birdImageView.layer addAnimation:animation forKey:nil];
}

-(void) moveSearchView{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    //获取初始position
    CGPoint originalPosition = self.searchImageView.layer.position;
    CGFloat originalX = originalPosition.x;
    CGFloat originalY = originalPosition.y;
    
    //初始化一个贝塞尔路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(originalX, originalY, 20, 20)];
    
    animation.path = path.CGPath;
    
    animation.duration = 1.0;
    
    animation.repeatCount = MAXFLOAT;
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.searchImageView.layer addAnimation:animation forKey:nil];
    
}

-(void) shakeIconView{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"transform.rotation";
    
    CGFloat rotationValue1 = (6/180.0) * M_PI;
    CGFloat rotationValue2 = (-6/180.0) * M_PI;
    //注意数组存储基本数据类型的语法格式
    animation.values = @[@(rotationValue2),@(rotationValue1), @(rotationValue2)];
    
    animation.duration = 0.25;
    
    animation.repeatCount = MAXFLOAT;
    
    [self.iconImageView.layer addAnimation:animation forKey:nil];
    
}



@end
