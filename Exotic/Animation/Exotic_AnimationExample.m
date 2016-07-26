//
//  Exotic_AnimationExample.m
//  Exotic
//
//  Created by HCZH on 16/7/11.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "Exotic_AnimationExample.h"
#import "Masonry.h"

@interface Exotic_AnimationExample ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *titleName;
@property (strong, nonatomic) NSMutableArray *className;

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
    
    self.tableView.tableFooterView = [UIView new];
    
    self.titleName = @[].mutableCopy;
    self.className = @[].mutableCopy;
    
    [self addCell:@"Basic" class:@"Exotic_AnimationViewController"];
    
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = ({
            UITableView *view = [UITableView new];
            [self.view addSubview:view];
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view);
            }];
            view.dataSource = self;
            view.delegate = self;
            view;
        });
    }
    return _tableView;
}

- (void)addCell:(NSString *)titleName class:(NSString *)className{
    [_titleName addObject:titleName];
    [_className addObject:className];
}
#pragma mark TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleName.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnimationCell"];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"AnimationCell"];
    }
    cell.textLabel.text = self.titleName[indexPath.row];
    return cell;
}

#pragma mark TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *className = _className[indexPath.row];
    Class class = NSClassFromString(className);

    if (class) {
        UIViewController *viewCtr = class.new;
        viewCtr.title = _titleName[indexPath.row];
        viewCtr.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewCtr animated:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
