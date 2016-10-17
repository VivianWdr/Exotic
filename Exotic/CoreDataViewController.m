//
//  CoreDataViewController.m
//  Exotic
//
//  Created by HCZH on 16/10/13.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "CoreDataViewController.h"
#import "myKVO.h"

@interface CoreDataViewController ()
@property (nonatomic,strong)myKVO *myKVO;

@end

@implementation CoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myKVO = [[myKVO alloc]init];
    
    /*1.注册对象myKVO为被观察者:
     option中，
     NSKeyValueObservingOptionOld 以字典的形式提供 “初始对象数据”;
     NSKeyValueObservingOptionNew 以字典的形式提供 “更新后新的数据”;
     */
    [self.myKVO addObserver:self forKeyPath:@"num" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
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
