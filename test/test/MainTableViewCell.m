//
//  MainTableViewCell.m
//  test
//
//  Created by dean on 2019/8/22.
//  Copyright © 2019 dean. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell()

/**
 工作名称
 */
@property(nonatomic,strong) UILabel * jobName_label;
/**
 公司名称
 */
@property(nonatomic,strong) UILabel * comName_label;
/**
 公司地址
 */
@property(nonatomic,strong) UILabel * comAddress_label;
/**
 报仇
 */
@property(nonatomic,strong) UILabel * money_label;


/**
 火热
 */
@property(nonatomic,strong) UIImageView * hot_imageView;




@end

@implementation MainTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        NSLog(@"%s",__func__);
        self.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = 0;
        
        CGSize size = [UIScreen mainScreen].bounds.size;
        [self initSubViewsWithSize:size];
        
    }
    return self;
}


-(void)initSubViewsWithSize:(CGSize)size{
    [self addSubview:self.jobName_label];
    [self addSubview:self.comName_label];
    [self addSubview:self.comAddress_label];
    [self addSubview:self.money_label];
    [self addSubview:self.hot_imageView];
    
    //计算frame , 设置padding
    CGFloat padding = 10.0;
    CGFloat image_width = 25.0;
    //jobName_label
    CGRect frame = CGRectMake(padding, padding, size.width - padding*3 - image_width, 30);
    self.jobName_label.frame = frame;
    
    //comName_label
    frame =  CGRectMake(frame.origin.x, frame.origin.y+frame.size.height+padding, size.width - padding*2,30);
    self.comName_label.frame = frame;
    
    //comAddress_label
    frame =  CGRectMake(frame.origin.x, frame.origin.y+frame.size.height+padding, size.width - padding*2,30);
    self.comAddress_label.frame = frame;
    
    //money_label
    frame =  CGRectMake(size.width-padding-image_width-150,padding,150,image_width);
    self.money_label.frame = frame;
    
    //hot_imageView
      frame =  CGRectMake(size.width-padding-image_width, padding, image_width,image_width);
    self.hot_imageView.frame = frame;
    
}


-(void)contentWithModel:(ObjectModel *)model{
    self.jobName_label.text = model.jobName;
    self.comName_label.text = model.comName;
    self.comAddress_label.text = model.jobLocation;
    self.money_label.text = [NSString stringWithFormat:@"%@ 元/天",model.jobMoney];
}



-(UILabel *)jobName_label{
    if (_jobName_label == nil) {
        _jobName_label = [UILabel new];
        _jobName_label.text = @"_jobName_label";
        _jobName_label.font=[UIFont systemFontOfSize:20];
        _jobName_label.textColor = [UIColor blackColor];
    }
    return _jobName_label ;
}

-(UILabel *)comName_label{
    if (_comName_label == nil) {
        _comName_label = [ UILabel new];
        _comName_label.text = @"_comName_label";
        _comName_label.textColor = [UIColor lightGrayColor];
        _comName_label.font=[UIFont systemFontOfSize:15];
    }
    return _comName_label;
}
-(UILabel *)comAddress_label{
    if (_comAddress_label == nil) {
        _comAddress_label = [UILabel new];
        _comAddress_label.text = @"_comAddress_label";
        _comAddress_label.textColor = [UIColor lightGrayColor];
        _comAddress_label.font=[UIFont systemFontOfSize:15];
    }return _comAddress_label;
}
- (UILabel *)money_label{
    if (_money_label == nil) {
        _money_label = [UILabel new];
        _money_label.text = @"_money_label";
        
        _money_label.font=[UIFont systemFontOfSize:20];
        _money_label.textAlignment= NSTextAlignmentRight;
        _money_label.textColor  = [UIColor orangeColor];
        
    }return _money_label;
}
-(UIImageView *)hot_imageView{
    if (_hot_imageView == nil) {
        _hot_imageView = [UIImageView new];
        _hot_imageView.image = [UIImage imageNamed:@"hot"];
    }
    return _hot_imageView;
}




@end
