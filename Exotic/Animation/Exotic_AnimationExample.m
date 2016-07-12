//
//  Exotic_AnimationExample.m
//  Exotic
//
//  Created by HCZH on 16/7/11.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "Exotic_AnimationExample.h"
#import "Exotic_PageAnimationUtil.h"
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
    [Exotic_PageAnimationUtil viewAnimationWithView:self.moveView];
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
