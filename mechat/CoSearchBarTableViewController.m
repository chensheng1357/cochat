//
//  CoSearchBarTableViewController.m
//  mechat
//
//  Created by 陈 胜 on 14-6-25.
//  Copyright (c) 2014年 Ruaho Technology. All rights reserved.
//

#import "CoSearchBarTableViewController.h"

@interface CoSearchBarTableViewController ()
@property (nonatomic, strong, readwrite) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *strongSearchDisplayController;
@end

@implementation CoSearchBarTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置搜索条设置
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.placeholder = @"搜索";
    self.searchBar.delegate = self;
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
    
    [self.searchBar sizeToFit];
    
    self.tableView.tableHeaderView = self.searchBar;
    self.strongSearchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    self.searchDisplayController.searchResultsDataSource = self;
    self.searchDisplayController.searchResultsDelegate = self;
    self.searchDisplayController.delegate = self;
}

@end
