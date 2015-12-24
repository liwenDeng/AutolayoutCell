//
//  MSBaseViewController.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/21.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSBaseViewController.h"
#import "MSCellModel.h"

@interface MSBaseViewController ()

@end

@implementation MSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        NSLog( @"数据解析错误");
    }else {
        NSArray *feedDics = [rootDic objectForKey:@"feed"];
        self.dataArray = [MSCellModel mj_objectArrayWithKeyValuesArray:feedDics];
    }
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}


@end
