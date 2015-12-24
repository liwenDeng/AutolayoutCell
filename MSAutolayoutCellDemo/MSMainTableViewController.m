//
//  MSMainTableViewController.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/21.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSMainTableViewController.h"
#import "MSBaseViewController.h"

@interface MSMainTableViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation MSMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]init];

    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    for (int i = 0; i < self.tableView.constraints.count; i++) {
        NSLog(@"cccc:%@",self.tableView.constraints[i]);
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Cell"];
    }
    
    NSString *str = [NSString stringWithFormat:@"MSBase%ldViewController",indexPath.row + 1];
    
    cell.textLabel.text = str;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = [NSString stringWithFormat:@"MSBase%ldViewController",indexPath.row + 1];
    Class cls = NSClassFromString(str);
    
    if ([cls isSubclassOfClass:[MSBaseViewController class]] && cls) {
       ;
        [self.navigationController pushViewController:[cls new] animated:YES];
    }
    
}

@end
