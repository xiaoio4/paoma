//
//  Test.m
//  paoma
//
//  Created by xiaoche on 14-9-23.
//  Copyright (c) 2014年 xiang_ying. All rights reserved.
//

#import "Test.h"
#import "DebuggerGridView.h"

@implementation Test

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.windowLevel= 2001;
        self.hidden=NO;
//        CGRect rect = CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height);
        DebuggerGridView *view = [[DebuggerGridView alloc] initWithFrame:self.frame];
        [self addSubview:view];
        // Initialization code
    }
    return self;
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
