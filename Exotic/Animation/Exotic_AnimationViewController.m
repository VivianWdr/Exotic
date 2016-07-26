//
//  Exotic_AnimationViewController.m
//  Exotic
//
//  Created by HCZH on 16/7/13.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "Exotic_AnimationViewController.h"
#import "HCKeyFrameAnimationView.h"

@interface Exotic_AnimationViewController ()
@property (nonatomic, weak) HCKeyFrameAnimationView *keyFrameAnimationView;

@end

@implementation Exotic_AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self keyFrameAnimationView];
}

-(HCKeyFrameAnimationView *)keyFrameAnimationView{
    if (_keyFrameAnimationView == nil) {
        HCKeyFrameAnimationView *keyFrameAnimationView = [HCKeyFrameAnimationView keyFrameAnimationView];
        _keyFrameAnimationView = keyFrameAnimationView;
        
        //设置frame
        keyFrameAnimationView.frame = CGRectMake(0, 190, 375, 219);
        
        [self.view addSubview:keyFrameAnimationView];
    }
    return _keyFrameAnimationView;
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
