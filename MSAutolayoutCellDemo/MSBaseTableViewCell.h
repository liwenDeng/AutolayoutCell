//
//  MSBaseTableViewCell.h
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/21.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import <MMPlaceHolder.h>
#import <UIImageView+WebCache.h>
#import "MSCellModel.h"

@interface MSBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) MSCellModel* cellModel;

@end
