//
//  TableViewCell.h
//  paoma
//
//  Created by xiaoche on 14-9-24.
//  Copyright (c) 2014年 xiang_ying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *tField;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UILabel *label;
//@property(nonatomic,assign)BOOL isSave;

@end
