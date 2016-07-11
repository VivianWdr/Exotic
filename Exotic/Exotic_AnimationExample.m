//
//  Exotic_AnimationExample.m
//  Exotic
//
//  Created by HCZH on 16/7/11.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "Exotic_AnimationExample.h"
#import "Masonry.h"

@interface Exotic_AnimationExample ()
@property (strong, nonatomic) UIView *moveView;
@end

@implementation Exotic_AnimationExample


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initMoveView];
    [self initWithCABasicAnimation];
}

/**
 *  coreAnimation的实现
 */
- (void)initMoveView{
    __weak typeof(self) weakSelf = self;
    self.moveView = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        view.backgroundColor = [UIColor grayColor];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(50);
            make.left.offset(50);
            make.size.mas_offset(CGSizeMake(50, 50));
        }];
        view;
    });
}

- (void)initWithCABasicAnimation{
    //初始化动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    //设置动画keyPath
    animation.keyPath = @"position";
    //设置变化的属性值
    CGPoint orignalPosition = self.moveView.layer.position;
    CGFloat orgnalX = orignalPosition.x;
    CGFloat orgnalY = orignalPosition.y;
    
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(orgnalX + 50, orgnalY)];
    animation.duration = 2;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.moveView.layer addAnimation:animation forKey:nil];
    animation.timingFunction = kCAMediaTimingFunctionLinear;
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
