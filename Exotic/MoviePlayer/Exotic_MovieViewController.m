//
//  Exotic_MovieViewController.m
//  Exotic
//
//  Created by HCZH on 16/7/12.
//  Copyright © 2016年 陈维维. All rights reserved.
//

#import "Exotic_MovieViewController.h"
#import "Masonry.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Exotic_MovieViewController ()

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

@end

@implementation Exotic_MovieViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"02" ofType:@"mov"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    NSURL *urls = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:urls];
    [self.view insertSubview:[self.moviePlayer view] atIndex:10];
    [self.moviePlayer.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(self.moviePlayer.view.mas_width).multipliedBy(9.0f/16.0f);
    }];
    [self.moviePlayer play];
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
