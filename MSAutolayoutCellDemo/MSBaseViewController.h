//
//  MSBaseViewController.h
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/21.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import <MJExtension.h>

@interface MSBaseViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end
