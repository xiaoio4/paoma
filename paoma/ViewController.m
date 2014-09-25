//
//  ViewController.m
//  paoma
//
//  Created by xiang_ying on 13-10-28.
//  Copyright (c) 2013年 xiang_ying. All rights reserved.
//

#import "ViewController.h"
#import "PaoMaLabel.h"
#import "DebuggerGridView.h"
#import "Test.h"
#import "TestView.h"
#import "TableViewCell.h"

static BOOL isSave = NO;

@interface ViewController ()
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *array;
@end

@implementation ViewController
@synthesize tField,button,label;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CGRect rect = CGRectMake(0, 40, self.view.frame.size.height-40, self.view.frame.size.width);
    _tableView = [[UITableView alloc] initWithFrame:rect];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _array = [NSMutableArray arrayWithObjects:@"ssss",@"qqqq",@"aaa",@"uu",@"ooo",@"pp",@"nnn", nil];
    
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cellString";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
//    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isSave"]) {
//        [self test:indexPath.row];
//    }
    cell.textLabel.text = _array[indexPath.row];
  
    label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 40, 40)];
    //    label.backgroundColor = [UIColor redColor];
    //    label.textColor = [UIColor yellowColor];
    [cell.contentView addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(260, 0, 40, 40);
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"编辑" forState:UIControlStateNormal];
    button.tag = indexPath.row;
    label.tag = indexPath.row;
    [cell.contentView addSubview:button];
    
    tField = [[UITextField alloc] initWithFrame:label.frame];
    tField.tag = indexPath.row;
    //    textField.backgroundColor = [UIColor cyanColor];
    tField.delegate = self;
    tField.hidden = YES;
    [cell.contentView addSubview:tField];
    
    return cell;
}
- (void)click:(UIButton *)btn
{
    
//    UIButton *butn = (UIButton *)btn;
    label = (UILabel *)[label viewWithTag:btn.tag];
    
    tField = (UITextField *)[tField viewWithTag:btn.tag];
    NSLog(@"isSave=%d",isSave);
    NSLog(@"tag=%ld",btn.tag);
    if (isSave) {
        //        NSString *str = textField.text;
        //        NSLog(@"str=%@",str);
        //        textField.text = str;
        isSave = NO;
        [btn setTitle:@"编辑" forState:UIControlStateNormal];
        //        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSave"];
        tField.hidden = YES;
        label.hidden = NO;
        label.text = tField.text;
        [[NSUserDefaults standardUserDefaults] setObject:tField.text forKey:@"text"];
    }else
    {
        
        [btn setTitle:@"保存" forState:UIControlStateNormal];
        tField.text = label.text;
        tField.hidden = NO;
        [tField resignFirstResponder];
        label.hidden = YES;
        isSave = YES;
    }
}

- (void)test:(NSInteger)row
{
    TableViewCell *cell = (TableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
    NSString *str = [_array objectAtIndex:row];
//    cell.textField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"text"];
    [_tableView reloadData];
//    __block NSInteger count = 0;
//    [_array enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
//        if ([obj isEqualToString:[_array objectAtIndex:row]]) {
//             count = idx;
//            *stop = YES;
//        }
//    }];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
