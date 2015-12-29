//
//  MSBase4ViewController.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/29.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSBase4ViewController.h"
#import "MSCell4.h"
#import "MSCellModel.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface MSBase4ViewController () <MSCell4Delegate>

@end

@implementation MSBase4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"可变Cell";
    self.tableView.frame = self.view.frame;
    [self.tableView registerClass:[MSCell4 class] forCellReuseIdentifier:@"Cell4"];
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
    MSCell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell4" forIndexPath:indexPath];
    
    MSCellModel *model = self.dataArray[indexPath.row] ;
    cell.cellModel = model;
    cell.delegate = self;
    cell.indexPath = indexPath;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"Cell4" configuration:^(MSCell4 *cell) {
        cell.cellModel = self.dataArray[indexPath.row];
    }];
}

- (void)cell:(MSCell4 *)cell clickedAtIndexPath:(NSIndexPath *)indexPath
{
    MSCellModel *model = self.dataArray[indexPath.row] ;
    model.isOpen = !model.isOpen;
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];

}
@end
