//
//  GCDViewController.m
//  Exotic
//
//  Created by HCZH on 16/8/1.
//  Copyright © 2016年 陈维维. All rights reserved.
//
/*
 任务：同步、异步
 对列：串行、并行
 */
#import "GCDViewController.h"

@interface GCDViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIImageView *icon1;


@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //dispatch_async(<#dispatch_queue_t queue#>, <#^(void)block#>) 异步任务：另外线程执行
    //dispatch_sync(<#dispatch_queue_t queue#>, <#^(void)block#>) 同步任务：在目前的线程执行
    
//    dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>) 并行队列：任务分配多线程执行
//    dispatch_queue_create(<#const char *label#>, <#dispatch_queue_attr_t attr#>) 串行队列：同一线程按顺序执行
//    dispatch_get_main_queue() 主队列
    
    // Do any additional setup after loading the view from its nib.
}
/**
 *  异步任务+并行队列,异步任务会在不同的线程中执行
 *
 *  @param sender UIButton
 */

- (IBAction)clickBasic1:(UIButton *)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2----%@",[NSThread currentThread]);

    });
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3----%@",[NSThread currentThread]);
    });
}
/**
 *  异步任务+串行队列,每个任务会在新开的线程中,按顺序执行
 *
 *  @param sender UIButton
 */
- (IBAction)clickBasic3:(UIButton *)sender {
    NSLog(@"task----%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_queue_create("dispatch", NULL);
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2----%@",[NSThread currentThread]);
        
    });
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3----%@",[NSThread currentThread]);
        
    });
    
}

/**
 *  线程间通信，下载图片完成更新ImageView,嵌套子任务，嵌套的子任务可以设置为在主线程中执行的任务。
 *
 *  @param sender UIButton
 */
- (IBAction)downLoadImageView:(UIButton *)sender {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
        NSString *imageUrl = @"http://pic3.nipic.com/20090625/389213_182209008_2.jpg";
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        NSLog(@"1___________%@",[NSThread currentThread]);
        
        //返回主线程设置UI
        dispatch_async(dispatch_get_main_queue(), ^{
            _icon.image = image;
            NSLog(@"2__________%@",[NSThread currentThread]);
        });
    });
}
/**
 *  队列组dispatch group(并行队列)
 *
 *  @param sender UIButton
 */
- (IBAction)startGroupTask:(UIButton *)sender {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        NSString *imageUrl = @"http://pic3.nipic.com/20090625/389213_182209008_2.jpg";
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        NSLog(@"1___________%@",[NSThread currentThread]);
        
        //返回主线程设置UI
        dispatch_async(dispatch_get_main_queue(), ^{
            _icon.image = image;
            NSLog(@"2__________%@",[NSThread currentThread]);
        });
    });
    
    dispatch_group_async(group, queue, ^{
        NSString *imageUrl = @"http://pic3.nipic.com/20090625/389213_182209008_2.jpg";
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        NSLog(@"111___________%@",[NSThread currentThread]);
        
        //返回主线程设置UI
        dispatch_async(dispatch_get_main_queue(), ^{
            _icon1.image = image;
            NSLog(@"22__________%@",[NSThread currentThread]);
        });
    });
    
    //任务组中的任务完成后，执行的动作
    dispatch_group_notify(group, queue, ^{
        NSLog(@"3--%@", [NSThread currentThread]);
    });
}

/**
 *  延迟执行操作
 *
 *  @param sender <#sender description#>
 */
- (IBAction)after:(UIButton *)sender {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), queue, ^{
        NSLog(@"延迟2.0秒后打印出来的日志！");
    });
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
