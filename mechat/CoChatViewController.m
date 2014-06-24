//
//  CoChatViewController.m
//  mechat
//
//  Created by 陈 胜 on 14-6-19.
//  Copyright (c) 2014年 Ruaho Technology. All rights reserved.
//

#import "CoChatViewController.h"
#import "TestViewController.h"

@interface CoChatViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UISearchBar *searchBar;
@end

#define TITLE @"众信"
@implementation CoChatViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"众信";
    [self setInfoNumber:6];
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat statusHeight = [[UIApplication sharedApplication]statusBarFrame].size.height;
    CGFloat navigationHeight = self.navigationController.navigationBar.frame.size.height;
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, screenHeight - (statusHeight + navigationHeight));
    self.tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ChatTableViewCellIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - TableView Delegate and DataSource

// 总共有多少节
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// 每一节都有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if ([tableView isEqual:self.tableView]) {
        cell = [tableView dequeueReusableCellWithIdentifier:ChatTableViewCellIdentifier forIndexPath:indexPath];
        [cell.textLabel setFont:[UIFont boldSystemFontOfSize:18]];
        cell.textLabel.text = @"测试";
    }
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - set title

// 设置当前信息条数
- (void)setInfoNumber:(NSUInteger)number
{
    NSMutableString *title = [NSMutableString stringWithString:TITLE];
    if (number > 0) {
        if (number < 100) {
            [title appendString:[NSString stringWithFormat:@"(%lu)", (unsigned long)number]];
        } else {
            [title appendString:@"(99+)"];
        }
    }
    self.navigationItem.title = title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
