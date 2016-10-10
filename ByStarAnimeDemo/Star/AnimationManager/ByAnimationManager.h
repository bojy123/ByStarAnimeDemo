//
//  ByAnimationManager.h
//  ByStarAnimeDemo
//
//  Created by boyu on 16/10/10.
//  Copyright © 2016年 boyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ByAnimationManager : NSObject

+ (ByAnimationManager *)sharedManager;

//星星过度动画，外层只需传入button
- (void)animationFavorites:(UIButton *)button;

@end
