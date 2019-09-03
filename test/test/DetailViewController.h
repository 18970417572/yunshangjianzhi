//
//  DetailViewController.h
//  test
//
//  Created by dean on 2019/8/22.
//  Copyright © 2019 dean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewCell.h"
#import "ObjectModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController


@property(nonatomic,strong) ObjectModel * model;


@end

NS_ASSUME_NONNULL_END
