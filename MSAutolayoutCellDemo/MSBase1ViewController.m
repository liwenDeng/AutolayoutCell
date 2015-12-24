//
//  MSBase1ViewController.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/21.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSBase1ViewController.h"
#import "MSCell1.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface MSBase1ViewController ()

@end

@implementation MSBase1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"self-sizing";
    
    self.tableView.estimatedRowHeight = 200;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
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
    MSCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    if (!cell) {
        cell = [[MSCell1 alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Cell1"];
    }
    
    MSCellModel *model = self.dataArray[indexPath.row] ;
    cell.cellModel = model;
    return cell;
}


@end
