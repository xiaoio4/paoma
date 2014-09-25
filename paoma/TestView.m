//
//  TestView.m
//  paoma
//
//  Created by xiaoche on 14-9-24.
//  Copyright (c) 2014年 xiang_ying. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor yellowColor];
       
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
     [self drawLinesX:70 Y:80];
}

- (void)drawLinesX:(NSUInteger)x Y:(NSUInteger)y
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //NO.1画一条线
    CGContextSetRGBStrokeColor(context, 0.8, 0.8, 0.3, 0.3);//线条颜色
    CGContextMoveToPoint(context, 0, y);
    CGContextAddLineToPoint(context, x,y);
    CGContextStrokePath(context);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
