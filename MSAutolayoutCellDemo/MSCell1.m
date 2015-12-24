//
//  MSCell1.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/22.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSCell1.h"

@interface MSCell1 ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation MSCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    
    return self;
}

- (void)initUI
{
    UIView *bgView = ({
        UIView *view = [UIView new];
        [self.contentView addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        view;
    });
    
    self.bgView = bgView;
    
    self.nameLabel = ({
        UILabel *label = [UILabel new];
        [bgView addSubview:label];
        label.numberOfLines = 0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(bgView).offset(10);
            make.right.lessThanOrEqualTo(bgView).offset(-10);
        }];
        
        label;
    });
    
    self.titleLabel = ({
        UILabel *label = [UILabel new];
        [bgView addSubview:label];
        label.numberOfLines = 0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(10);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
            make.right.lessThanOrEqualTo(bgView).offset(-10);
        }];
        
        label;
    });
    
    self.contentLabel = ({
        UILabel *label = [UILabel new];
        [bgView addSubview:label];
        label.numberOfLines = 0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(10);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.right.lessThanOrEqualTo(bgView).offset(-10);
        }];
        
        label;
    });
    
    self.imgView = ({
        UIImageView *imgView = [UIImageView new];
        [bgView addSubview:imgView];

        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bgView);
            make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
            make.right.lessThanOrEqualTo(bgView).offset(-10);
        }];
        
        imgView;
    });
    
    self.timeLabel = ({
        UILabel *label = [UILabel new];
        [bgView addSubview:label];
        label.numberOfLines = 0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(10);
            make.top.equalTo(self.imgView.mas_bottom).offset(10);
            make.right.lessThanOrEqualTo(bgView).offset(-10);
        }];
        
        label;
    });
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.timeLabel.mas_bottom).offset(10);
    }];
    
    self.nameLabel.backgroundColor = [UIColor grayColor];
    self.titleLabel.backgroundColor = [UIColor blueColor];
    self.contentLabel.backgroundColor = [UIColor redColor];
    self.imgView.backgroundColor = [UIColor greenColor];
    self.timeLabel.backgroundColor = [UIColor lightGrayColor];
}


- (void)setCellModel:(MSCellModel *)cellModel
{
    [super setCellModel:cellModel];

    self.nameLabel.text = cellModel.username;
    self.nameLabel.hidden = [cellModel.username isEqualToString:@""] ? YES : NO;
    
    self.titleLabel.text = cellModel.title;
    self.titleLabel.hidden = [cellModel.title isEqualToString:@""] ? YES : NO;
    
    self.contentLabel.text = cellModel.content;
    self.contentLabel.hidden = [cellModel.content isEqualToString:@""] ? YES : NO;
    
    //    [self.imgView sd_setImageWithURL:[NSURL URLWithString:cellModel.imageName]];
    NSString *str = cellModel.imageName;
    if (![str isEqualToString:@""]) {
        self.imgView.hidden = NO;
        self.imgView.image = [UIImage imageNamed:cellModel.imageName];
    }else {
        self.imgView.image = nil;
        self.imgView.hidden = YES;
    }
    
    self.timeLabel.text = cellModel.time;
    self.timeLabel.hidden = [cellModel.time isEqualToString:@""] ? YES : NO;
}


//- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
//{
//    CGSize size = [super systemLayoutSizeFittingSize:targetSize withHorizontalFittingPriority:horizontalFittingPriority verticalFittingPriority:verticalFittingPriority];
//    NSLog(@"size: width %lf,height:%lf",size.width,size.height);
//    
////    CGSize size2 = [self.bgView systemLayoutSizeFittingSize:CGSizeZero];
////    
////    NSLog(@"size2: width %lf,height:%lf",size2.width,size2.height);
//     
//    return size;
//}


@end
