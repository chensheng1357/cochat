//
//  CoChatViewController.h
//  mechat
//
//  Created by 陈 胜 on 14-6-19.
//  Copyright (c) 2014年 Ruaho Technology. All rights reserved.
//

#import "BaseViewController.h"

static NSString *TableViewCellIdentifier = @"TableViewCells";
@interface CoChatViewController : BaseViewController<UITableViewDataSource>
- (void)setInfoNumber:(NSUInteger)number;
@end
