//
//  ViewController.h
//  paoma
//
//  Created by xiang_ying on 13-10-28.
//  Copyright (c) 2013年 xiang_ying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(nonatomic,strong)UITextField *tField;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UILabel *label;
@end
