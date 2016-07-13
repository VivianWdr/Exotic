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

@property (strong, nonatomic) UIView *birdImageView;
@property (strong, nonatomic) UIImageView *searchImageView;
@property (strong, nonatomic) UIImageView *shakeImageView;
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
//    self.moveView = ({
//        UIView *view = [UIView new];
//        [self.view addSubview:view];
//        view.backgroundColor = [UIColor grayColor];
//        
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.offset(50);
//            make.left.offset(50);
//            make.size.mas_offset(CGSizeMake(50, 50));
//        }];
//        view;
//    });


    self.searchImageView = ({
        UIImageView *view = [[UIImageView alloc] init];
        view.image = [UIImage imageNamed:@"Search-50"];
        [self.view addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.view).offset(50);
            make.top.equalTo(weakSelf.view).offset(120);
            make.size.mas_offset(CGSizeMake(30, 30));
        }];
        view;
    });
    
//    self.birdImageView = ({
//        UIImageView *view = [UIImageView new];
//        view.image = [UIImage imageNamed:@"Twitter-50"];
//        [self.view addSubview:view];
//        
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(weakSelf.searchImageView);
//            make.left.equalTo(weakSelf.searchImageView.mas_right).offset(30);
//            make.size.equalTo(weakSelf.searchImageView);
//        }];
//        view;
//    });
//    
//    self.shakeImageView = ({
//        UIImageView *view = [UIImageView new];
//        view.image = [UIImage imageNamed:@"Contacts-50"];
//        [self.view addSubview:view];
//        
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(weakSelf.birdImageView.mas_right).offset(30);
//            make.top.equalTo(weakSelf.birdImageView);
//            make.size.equalTo(weakSelf.birdImageView);
//        }];
//        view;
//    });
}

- (void)initWithCABasicAnimation{

    [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [self.searchImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(220);
        }];
        [self.view layoutIfNeeded];
    } completion:nil];
//    [Exotic_PageAnimationUtil viewAnimationWithView:self.moveView];
//    [Exotic_PageAnimationUtil ViewKeyframeAnimationWithImageView:self.searchImageView];
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
