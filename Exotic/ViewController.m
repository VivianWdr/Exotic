//
//  ViewController.m
//  Exotic
//
//  Created by 陈维维 on 16/7/9.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithView];
}

-(void)initWithView{
    __weak typeof(self) WeakSelf = self;
    
    UIView *view1 = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        view.backgroundColor = [UIColor lightGrayColor];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(WeakSelf.view);
            make.size.mas_offset(CGSizeMake(200, 200));
        }];
        view;
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
