//
//  KVCViewController.m
//  Exotic
//
//  Created by HCZH on 16/10/17.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "KVCViewController.h"

@interface KVCViewController ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *array;

@end
/*
 - (nullable id)valueForKey:(NSString *)key;                          //直接通过Key来取值
 - (void)setValue:(nullable id)value forKey:(NSString *)key;          //通过Key来设值
 - (nullable id)valueForKeyPath:(NSString *)keyPath;                  //通过KeyPath来取值
 - (void)setValue:(nullable id)value forKeyPath:(NSString *)keyPath;  //通过KeyPath来设值
 
 + (BOOL)accessInstanceVariablesDirectly;
 //默认返回YES，表示如果没有找到Set<Key>方法的话，会按照_key，_iskey，key，iskey的顺序搜索成员，设置成NO就不这样搜索
 - (BOOL)validateValue:(inout id __nullable * __nonnull)ioValue forKey:(NSString *)inKey error:(out NSError **)outError;
 //KVC提供属性值确认的API，它可以用来检查set的值是否正确、为不正确的值做一个替换值或者拒绝设置新值并返回错误原因。
 - (NSMutableArray *)mutableArrayValueForKey:(NSString *)key;
 //这是集合操作的API，里面还有一系列这样的API，如果属性是一个NSMutableArray，那么可以用这个方法来返回
 - (nullable id)valueForUndefinedKey:(NSString *)key;
 //如果Key不存在，且没有KVC无法搜索到任何和Key有关的字段或者属性，则会调用这个方法，默认是抛出异常
 - (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key;
 //和上一个方法一样，只不过是设值。
 - (void)setNilValueForKey:(NSString *)key;
 //如果你在SetValue方法时面给Value传nil，则会调用这个方法
 - (NSDictionary<NSString *, id> *)dictionaryWithValuesForKeys:(NSArray<NSString *> *)keys;
 //输入一组key,返回该组key对应的Value，再转成字典返回，用于将Model转到字典。
 */
@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setValue:@"cww" forKey:@"name"];
    NSLog(@"%@",[self valueForKey:@"name"]);

    /**
     *  KVC与容器类
     */
    _array = @[].mutableCopy;
    [self addObserver:self forKeyPath:@"array" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];

    [self.array addObject:@"1"];
    NSArray * arr = [self mutableArrayValueForKey:@"array"];
    NSLog(@"%@",arr);
    
    [[self mutableArrayValueForKey:@"array"] addObject:@"2"];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@",change);
}
+(BOOL)accessInstanceVariablesDirectly{
    return YES;
}
-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"出现异常，该key不存在%@",key);
    return nil;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"出现异常，该key不存在%@",key);
}

- (void) dealloc {
    [self removeObserver:self forKeyPath:@"array" context:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
