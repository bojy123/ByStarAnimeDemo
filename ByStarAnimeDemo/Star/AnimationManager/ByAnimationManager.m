//
//  ByAnimationManager.m
//  ByStarAnimeDemo
//
//  Created by boyu on 16/10/10.
//  Copyright © 2016年 boyu. All rights reserved.
//

#import "ByAnimationManager.h"

#import "ByStarView.h"

@interface ByAnimationManager ()
{
    NSInteger _timeCount;
}

@property (nonatomic, assign) ByStarView *yellowView;
@property (nonatomic, assign) UIButton *statBtn;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ByAnimationManager

+ (ByAnimationManager *)sharedManager {
    static id byAnimationManager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        byAnimationManager = [self new];
    });
    return byAnimationManager;
}

- (void)animationFavorites:(UIButton *)button{
    _statBtn = button;
    //去掉空心星星
    [button setImage:nil forState:UIControlStateNormal];
    
    if (!self.yellowView) {
        //黄色圆形底，用来做放大圆形和空心消失过度
        ByStarView *yellowView = [[ByStarView alloc] initWithFrame:CGRectMake((button.frame.size.width-20)/2, (button.frame.size.height-20)/2, 20, 20)];
        yellowView.backgroundColor = [UIColor colorWithRed:0.952941 green:0.545098 blue:0.125490 alpha:0.9];
        yellowView.layer.cornerRadius = 10;
        yellowView.layer.masksToBounds = YES;
        [button addSubview:yellowView];
        yellowView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        self.yellowView = yellowView;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        //放大黄色圆底
        _yellowView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    } completion:^(BOOL finished) {
        
        //定时器，用drawRect逐渐镂空消失效果
        _timeCount = 0;
        [self stopTimer];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(timeClick) userInfo:nil repeats:YES];
    }];
}

- (void)timeClick {
    //刷新黄色圆形镂空效果
    _yellowView.width = _timeCount;
    [_yellowView setNeedsDisplay];
    _timeCount ++;

    //到达指定大小，设置实心星星选中效果
    if (_timeCount == 21) {
        [self stopTimer];
        
        //重置空心星星
        [self.statBtn setImage:[UIImage imageNamed:@"fav_white_n"] forState:UIControlStateNormal];
        self.statBtn.selected = YES;
        self.statBtn.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        
        //销毁黄色圆形视图
        [self.yellowView removeFromSuperview];
        self.yellowView = nil;
        
        //放大缩小效果
        [UIView animateWithDuration:0.25 animations:^{
            self.statBtn.transform = CGAffineTransformMakeScale(1.5, 1.5);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.statBtn.transform = CGAffineTransformMakeScale(1.0, 1.0);
            }];
        }];
    }
}

- (void)stopTimer {
    [_timer invalidate];
    _timer = nil;
}

@end
