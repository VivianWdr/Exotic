//
//  Exotic_HomeTableViewController.m
//  Exotic
//
//  Created by HCZH on 16/7/11.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "Exotic_HomeTableViewController.h"

@interface Exotic_HomeTableViewController ()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation Exotic_HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Exotic Example";
    self.tableView.tableFooterView = [UIView new];
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    
    [self addCell:@"CAAnimation" class:@"Exotic_AnimationExample"];
    [self addCell:@"MoviePlayer" class:@"Exotic_MovieViewController"];
    [self addCell:@"testBlock" class:@"TestBlockViewController"];
    [self addCell:@"GCD" class:@"GCDViewController"];
    [self addCell:@"NSOperation" class:@"OperaationViewController"];
    [self addCell:@"CodeGraphics" class:@"CoreGraphicsViewController"];
    [self addCell:@"CodingStandards" class:@"CodingStandardsViewController"];
    [self addCell:@"CoreData" class:@"CoreDataViewController"];
    [self addCell:@"KVC" class:@"KVCViewController"];
    [self addCell:@"KVO" class:@"KVOViewController"];
    
    [self.tableView reloadData];
}

-(void)addCell:(NSString *)title class:(NSString *)className{
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *className = _classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *viewCtr = class.new;
        viewCtr.title = _titles[indexPath.row];
        viewCtr.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewCtr animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
