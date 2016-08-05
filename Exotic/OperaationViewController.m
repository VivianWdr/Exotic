//
//  OperaationViewController.m
//  Exotic
//
//  Created by HCZH on 16/8/4.
//  Copyright © 2016年 陈维维. All rights reserved.
//
/*
 NSOperation:NSInvocationOperation、NSBlockOperation、CustomOperation
 */
#import "OperaationViewController.h"

@interface OperaationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIImageView *icon1;

@end

@implementation OperaationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *   调用operation的start方法，在当前线程中串行执行，无队列
 */
-(void) executeInCurrentThread{
    
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1____________%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2__________%@",[NSThread currentThread]);
    }];
    
    //调用start方法，会在当前线程中串行执行
    [task1 start];
    [task2 start];
}

/**
 *   1、同时开启多个线程，多个任务并行执行；
 2、maxConcurrentOperationCount决定了“并发”任务的数量，而不是创建线程的数量。即便设置为1，不同的任务也有可能在不同的线程中执行
 */
-(void) executeInQueue{
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1____________%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2__________%@",[NSThread currentThread]);
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 2;
    
    [queue addOperation:task1];
    [queue addOperation:task2];
}

/**
 *  在任务中添加新任务，所有的任务都会被执行
 */
-(void) addTaskInOperation{
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1____________%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2__________%@",[NSThread currentThread]);
    }];
    
    [task2 addExecutionBlock:^{
        NSLog(@"task22_____________%@",[NSThread currentThread]);
    }];
    
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //添加任务到队列
    [queue addOperation:task1];
    [queue addOperation:task2];
}

/**
 *  队列中直接添加任务
 */
-(void) addTaskInQueue{
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //在queue中添加任务
    [queue addOperationWithBlock:^{
        NSLog(@"queue task-----%@", [NSThread currentThread]);
    }];
    
}

/**
 *  可以给任务Operation结束后添加block，但是block中的任务会在新的线程中执行，即：仅仅是添加了一个任务执行的先后顺序关系
 */
-(void) addComletionBlock{
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1____________%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2__________%@",[NSThread currentThread]);
    }];

    [task1 addExecutionBlock:^{
        NSLog(@"task1 add task-----%@", [NSThread currentThread]);
    }];
    
    task2.completionBlock = ^{
        NSLog(@"task2 end!!! %@", [NSThread currentThread]);
    };
    
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    
    //添加任务到队列
    [queue addOperation:task1];
    [queue addOperation:task2];
}

/**
 *  线程间通信
 *
 *  @param sender <#sender description#>
 */
- (IBAction)downloadImage:(id)sender {
    
    NSBlockOperation *task = [NSBlockOperation blockOperationWithBlock:^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic3.nipic.com/20090625/389213_182209008_2.jpg"]];
        UIImage *image = [UIImage imageWithData:imageData];
        
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.icon.image = image;
        }];
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [queue addOperation:task];
}

- (IBAction)downloadTwoImage:(id)sender {
    
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        //下载网络图片
        NSString *urlStr = @"http://pic3.nipic.com/20090625/389213_182209008_2.jpg";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image1 = [UIImage imageWithData:imageData];
        
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.icon.image = image1;
        }];
    }];
    
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        //下载网络图片
        NSString *urlStr = @"http://pic3.nipic.com/20090625/389213_182209008_2.jpg";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image2 = [UIImage imageWithData:imageData];
        
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.icon1.image = image2;
        }];
    }];
    
    NSBlockOperation *task3 = [NSBlockOperation blockOperationWithBlock:^{
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            NSLog(@"下载完成");
        }];
    }];
    
    //设置任务之间的执行依赖关系
    [task3 addDependency:task1];
    [task3 addDependency:task2];
    [task2 addDependency:task1];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:task1];
    [queue addOperation:task2];
    [queue addOperation:task3];
    
    
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
