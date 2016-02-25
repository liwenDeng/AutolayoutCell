//
//  MSCell4.m
//  MSAutolayoutCellDemo
//
//  Created by dengliwen on 15/12/29.
//  Copyright © 2015年 dengliwen. All rights reserved.
//

#import "MSCell4.h"

@interface MSCell4 ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIView *imgBgView;    //装imgView;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *extendLabel;  //延展label;

@end

@implementation MSCell4

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
    
    self.imgBgView = ({
        UIView *view = [UIView new];
        [stackView addArrangedSubview:view];
        view.backgroundColor = [UIColor orangeColor];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(bgView).offset(-20);
        }];
        view;
    });
    
    self.imgView = ({
        UIImageView *imgView = [UIImageView new];
        [self.imgBgView addSubview:imgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.imgBgView);
            make.width.lessThanOrEqualTo(self.imgBgView);
            //            make.edges.equalTo(self.imgBgView);
        }];
        imgView;
    });
    
    [self.imgBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.imgView);
    }];
    
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
    
    self.extendLabel = ({
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
    self.extendLabel.backgroundColor = [UIColor orangeColor];
    
    [stackView setAxis:(UILayoutConstraintAxisVertical)];
    [stackView setDistribution:(UIStackViewDistributionEqualSpacing)];
    [stackView setAlignment:(UIStackViewAlignmentLeading)];
    stackView.spacing = 10;
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setTitle:@"Click" forState:(UIControlStateNormal)];
    [self.contentView addSubview:btn];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.right.mas_equalTo(-10);
    }];

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
    if (str.length > 0) {
        self.imgView.hidden = NO;
        self.imgView.image = [UIImage imageNamed:cellModel.imageName];
        
        self.imgBgView.hidden = NO;
        
    }else {
        self.imgView.image = nil;
        self.imgView.hidden = YES;
        
        self.imgBgView.hidden = YES;
    }
    
    self.timeLabel.text = cellModel.time;
    self.timeLabel.hidden = [cellModel.time isEqualToString:@""] ? YES : NO;
    
    if (cellModel.isOpen == YES) {
        self.extendLabel.text = @"这里是延展部分这里是延展部分这里是延展部分这里是延展部分这里是延展部分这里是延展部分这里是延展部分";
        self.extendLabel.hidden = NO;

    }else {
        self.extendLabel.text = @"";
        self.extendLabel.hidden = YES;
    }
}

- (void)btnClicked:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(cell:clickedAtIndexPath:)]) {
        [self.delegate cell:self clickedAtIndexPath:self.indexPath];
    }
}
@end
