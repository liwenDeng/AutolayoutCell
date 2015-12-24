//
//  MSBase3ViewController.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/22.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSBase3ViewController.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "MSCell3.h"

@interface MSBase3ViewController ()

@end

@implementation MSBase3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"StackView";
    self.tableView.frame = self.view.frame;
    [self.tableView registerClass:[MSCell3 class] forCellReuseIdentifier:@"Cell3"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -UITabelViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSCell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3" forIndexPath:indexPath];
    
    MSCellModel *model = self.dataArray[indexPath.row] ;
    cell.cellModel = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"Cell3" configuration:^(MSCell3 *cell) {
        cell.cellModel = self.dataArray[indexPath.row];
    }];
}


@end
