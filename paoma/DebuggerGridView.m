//
//  DebuggerGridView.m
//  paoma
//
//  Created by xiaoche on 14-9-22.
//  Copyright (c) 2014年 xiang_ying. All rights reserved.
//

#import "DebuggerGridView.h"

@implementation DebuggerGridView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    // Drawing code
    //横线：
    int h = [UIScreen mainScreen].bounds.size.height;
    int w = [UIScreen mainScreen].bounds.size.width;
    
    for (int i=0; i<=h/20; i++) {
        
//        drawSingleLine(context,(CGPoint){0, (i)*20},(CGPoint){w,(i)*20}, [UIColor cyanColor], 0.5f);
        [self drawHorizontalLinesHeight:(i)*20 width:w];
        
        if (i%2 == 0) {
            
            NSString* str = [NSString stringWithFormat:@"%d",i*20];
            
            [[UIColor cyanColor] set];
            [str drawAtPoint:CGPointMake(0, (i*20)) withFont:[UIFont systemFontOfSize:8.0f]];
        }
    }
    
    //竖线：
    for (int i=0; i<=w/20; i++) {
        
//        drawSingleLine(context, (CGPoint){i*20,0}, (CGPoint){i*20,h}, [UIColor cyanColor], 0.5f);
        [self drawVerticalLinesHeight:(i)*20 width:h];
        if (i % 2 == 0) {
            NSString* str = [NSString stringWithFormat:@"%d",i*20];
            
            [[UIColor cyanColor] set];
            [str drawAtPoint:CGPointMake((i*20),0) withFont:[UIFont systemFontOfSize:8.0f]];
            
        }
    }
}


- (void)drawHorizontalLinesHeight:(NSUInteger)height width:(NSUInteger)width
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //NO.1画一条线
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
    CGContextMoveToPoint(context, 0, height);
    CGContextAddLineToPoint(context, width,height);
    CGContextStrokePath(context);
    CGContextStrokePath(context);
}


- (void)drawVerticalLinesHeight:(NSUInteger)height width:(NSUInteger)width
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //NO.1画一条线
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
    CGContextMoveToPoint(context, height, 0);
    CGContextAddLineToPoint(context, height,width);
    CGContextStrokePath(context);
}



//- (void)drawSingleLine(CGPoint point1,CGPoint point2,UIColor *color,UIFont *font)
//{
//     CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
//    CGContextMoveToPoint(context, 0, point1.x);
//    CGContextAddLineToPoint(context, self.frame.size.width,self.frame.size.height-40+1);
//    CGContextStrokePath(context);
//    
//    CGContextMoveToPoint(context, self.frame.size.width/3, self.frame.size.height-40+1);
//    CGContextAddLineToPoint(context, self.frame.size.width/3,self.frame.size.height-1);
//    CGContextStrokePath(context);
//    
//    CGContextMoveToPoint(context, self.frame.size.width*2/3, self.frame.size.height-40+1);
//    CGContextAddLineToPoint(context, self.frame.size.width*2/3,self.frame.size.height-1);
//    CGContextStrokePath(context);
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
