//
//  MSCell4.h
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/29.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSBaseTableViewCell.h"

@class MSCell4;
@protocol MSCell4Delegate <NSObject>

- (void)cell:(MSCell4*) cell clickedAtIndexPath:(NSIndexPath *) indexPath;

@end

@interface MSCell4 : MSBaseTableViewCell

@property (nonatomic, weak) id<MSCell4Delegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
