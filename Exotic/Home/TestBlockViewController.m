//
//  TestBlockViewController.m
//  Exotic
//
//  Created by HCZH on 16/7/25.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "TestBlockViewController.h"
#import "Task.h"

@interface TestBlockViewController ()

@end

@implementation TestBlockViewController
- (IBAction)pushViewWithBlock:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    Task *task = [[Task alloc] init];
    
    [task beginTaskCallbackBlock:^{
        NSLog(@"Task End!");
    }];
    
    task.callbackBlock = ^(){
        NSLog(@"Task End!!!!");
    };
    
    self.blockProperty = ^{
        //NSLog(@"blockProperty is called");
    };
    
    void (^blockas)(void) = ^ {
        //NSLog(@"blockProperty is called");
    };
    
    //blockPropertyWithInput
    self.blockPorpertyWithInput = ^(int i){
        //NSLog(@"blockPropertyWithInput is Called! I Value is %d", i);
    };
    self.blockPorpertyWithInput(150);
    
    blockas();
    self.blockProperty ();
    
    [self pushView:^(int num) {
        NSLog(@"%d",num);
    }];

}

- (void)pushView:( void (^) (int))blocks{
    [self blocks:blocks];
    NSLog(@"blockProperty is called");
}

- (void)blocks:(void (^) (int))blocks{
    blocks(15);
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
