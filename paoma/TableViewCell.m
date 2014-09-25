//
//  TableViewCell.m
//  paoma
//
//  Created by xiaoche on 14-9-24.
//  Copyright (c) 2014年 xiang_ying. All rights reserved.
//

#import "TableViewCell.h"

static BOOL isSave = NO;

@implementation TableViewCell
@synthesize tField,button,label;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self laySubviews];
//        UITextField* text = [[UITextField alloc]initWithFrame:self.frame];
//        text.delegate = self;
//        text.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//        text.text = @"test";
//        text.userInteractionEnabled = YES;
//        [self addSubview:text];
        self.userInteractionEnabled = YES;
    }
    return self;
}


- (void)laySubviews
{
    label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width-100, self.frame.size.height)];
//    label.backgroundColor = [UIColor redColor];
//    label.textColor = [UIColor yellowColor];
    [self addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(260, 0, 40, self.frame.size.height);
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"编辑" forState:UIControlStateNormal];
    [self addSubview:button];
    
    tField = [[UITextField alloc] initWithFrame:label.frame];
//    textField.backgroundColor = [UIColor cyanColor];
    tField.delegate = self;
    tField.hidden = YES;
    [self addSubview:tField];
}

- (void)click:(UIButton *)btn
{
    NSLog(@"isSave=%d",isSave);
    NSLog(@"tag=%ld",btn.tag);
    if (isSave) {
//        NSString *str = textField.text;
//        NSLog(@"str=%@",str);
//        textField.text = str;
         isSave = NO;
         [button setTitle:@"编辑" forState:UIControlStateNormal];
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSave"];
        tField.hidden = YES;
        label.hidden = NO;
        label.text = tField.text;
        [[NSUserDefaults standardUserDefaults] setObject:tField.text forKey:@"text"];
    }else
    {
        [button setTitle:@"保存" forState:UIControlStateNormal];
        tField.text = label.text;
        tField.hidden = NO;
        [tField resignFirstResponder];
        label.hidden = YES;
        isSave = YES;
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[textField resignFirstResponder]在哪调用就能把textField对应的键盘往下收
    return YES;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
//    selected = YES;
    // Configure the view for the selected state
}

@end
