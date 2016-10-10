//
//  ViewController.m
//  ByStarAnimeDemo
//
//  Created by boyu on 16/10/10.
//  Copyright © 2016年 boyu. All rights reserved.
//

#import "ViewController.h"
#import "ByAnimationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = self.view.bounds;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((frame.size.width-40)/2, (frame.size.height-40)/2, 40, 40);
    [button setImage:[UIImage imageNamed:@"fav_white_n"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"fav_s"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)button {
    if (button.selected) {
        //取消
        button.selected = NO;
    } else {
        //选中
        [[ByAnimationManager sharedManager] animationFavorites:button];
    }
}

@end
