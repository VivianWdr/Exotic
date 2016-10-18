//
//  KVOViewController.m
//  Exotic
//
//  Created by HCZH on 16/10/17.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "KVOViewController.h"
#import "myKVO.h"

@interface KVOViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (nonatomic, strong) myKVO *myKVO;
@property (nonatomic, assign) int num;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myKVO = [[myKVO alloc]init];
    
    /*1.注册对象myKVO为被观察者:
     option中，
     NSKeyValueObservingOptionOld 以字典的形式提供 “初始对象数据”;
     NSKeyValueObservingOptionNew 以字典的形式提供 “更新后新的数据”;
     */
    [self addObserver:self forKeyPath:@"num" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:NULL];
    
}

/* 2.只要object的keyPath属性发生变化，就会调用此回调方法，进行相应的处理：UI更新：*/
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"num"])
    {
        // 响应变化处理：UI更新（label文本改变）
        self.numLab.text = [NSString stringWithFormat:@"当前的num值为：%@",[change valueForKey:@"new"]];
        
        //上文注册时，枚举为2个，因此可以提取change字典中的新、旧值的这两个方法
        NSLog(@"\noldnum:%@ newnum:%@",[change valueForKey:@"old"],[change valueForKey:@"new"]);
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)dealloc{
    /* 3.移除KVO */
    [self removeObserver:self forKeyPath:@"num" context:nil];
}

- (IBAction)addCount:(id)sender {
    self.num += 1;
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
