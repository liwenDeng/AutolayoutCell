//
//  MSCell3.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/22.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSCell3.h"

@interface MSCell3 ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation MSCell3

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
    
    UIStackView *stackView = [[UIStackView alloc]init];
    [bgView addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bgView).priorityLow().insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    self.nameLabel = ({
        UILabel *label = [UILabel new];
        
        [stackView addArrangedSubview:label];
        label.numberOfLines = 0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.equalTo(bgView).offset(10);
            make.width.lessThanOrEqualTo(bgView).offset(-20);
//            make.width.lessThanOrEqualTo(@355);
        }];
        
        label;
    });
    
    self.titleLabel = ({
        UILabel *label = [UILabel new];
        
        [stackView addArrangedSubview:label];
        label.numberOfLines = 0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(bgView).offset(-20);
        }];
        
        label;
    });
    
    self.contentLabel = ({
        UILabel *label = [UILabel new];
        
        [stackView addArrangedSubview:label];
        label.numberOfLines = 0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.lessThanOrEqualTo(@355);
            make.width.lessThanOrEqualTo(bgView).offset(-20);
        }];
        
        label;
    });
    
    
    self.imgView = ({
        UIImageView *imgView = [UIImageView new];
        
        [stackView addArrangedSubview:imgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.lessThanOrEqualTo(@355);
//            make.centerX.equalTo(bgView);
            make.width.lessThanOrEqualTo(bgView).offset(-20);
        }];
//        [imgView setContentMode:(UIViewContentModeCenter)];
        
        imgView;
    });
    
    self.timeLabel = ({
        UILabel *label = [UILabel new];
        
        [stackView addArrangedSubview:label];
        label.numberOfLines = 0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.lessThanOrEqualTo(@355);
            make.width.lessThanOrEqualTo(bgView).offset(-20);
        }];
        
        label;
    });
    
    
    self.nameLabel.backgroundColor = [UIColor grayColor];
    self.titleLabel.backgroundColor = [UIColor blueColor];
    self.contentLabel.backgroundColor = [UIColor redColor];
    self.imgView.backgroundColor = [UIColor greenColor];
    self.timeLabel.backgroundColor = [UIColor lightGrayColor];
    
    [stackView setAxis:(UILayoutConstraintAxisVertical)];
    [stackView setDistribution:(UIStackViewDistributionEqualSpacing)];
    [stackView setAlignment:(UIStackViewAlignmentLeading)];
    stackView.spacing = 20;
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
//    [self.imgView setContentMode:(UIViewContentModeCenter)];
    
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
