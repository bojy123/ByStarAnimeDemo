//
//  ByStarView.m
//  ByStarAnimeDemo
//
//  Created by boyu on 16/10/10.
//  Copyright © 2016年 boyu. All rights reserved.
//

#import "ByStarView.h"

@implementation ByStarView

- (void)drawRect:(CGRect)rect {
    CGRect frame = self.bounds;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    UIColor *color = [UIColor colorWithRed:1.0 green:1 blue:1 alpha:0.8];
    CGContextSetBlendMode(ctx, kCGBlendModeClear);//混合俩种颜色
    CGContextSetStrokeColorWithColor(ctx, color.CGColor);////线框颜色
    
    
    CGContextFillEllipseInRect(ctx, CGRectMake((frame.size.width-_width)/2, (frame.size.height-_width)/2, _width, _width));
    CGContextStrokePath( ctx );//开始绘制
    
    CGContextRestoreGState(ctx);
}

@end
