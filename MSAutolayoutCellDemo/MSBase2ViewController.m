//
//  MSBase2ViewController.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/22.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSBase2ViewController.h"
#import "MSCell1.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface MSBase2ViewController ()

@end

@implementation MSBase2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"FDTemplateLayoutCell";
    self.tableView.frame = self.view.frame;
    [self.tableView registerClass:[MSCell1 class] forCellReuseIdentifier:@"Cell1"];
    
//    self.tableView.estimatedRowHeight = 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITabelViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];

    MSCellModel *model = self.dataArray[indexPath.row] ;
    cell.cellModel = model;
//    cell.contentView.bounds = CGRectMake(0, 0, 9999, 9999);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 这里会打印约束不正常
    return [tableView fd_heightForCellWithIdentifier:@"Cell1" configuration:^(MSCell1 *cell) {
        cell.cellModel = self.dataArray[indexPath.row];
    }];
}


@end
