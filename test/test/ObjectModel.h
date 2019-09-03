//
//  ObjectModel.h
//  test
//
//  Created by dean on 2019/8/22.
//  Copyright © 2019 dean. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 兼职model
 */
@interface ObjectModel : NSObject


@property(nonatomic,copy) NSString * jobName;
@property(nonatomic,copy) NSString * fieldid;
@property(nonatomic,copy) NSString * comName;
@property(nonatomic,copy) NSString * jobLocation;
@property(nonatomic,copy) NSString * jobMoney;
@property(nonatomic,copy) NSString * jobAbout;
@property(nonatomic,copy) NSString * qq;
@property(nonatomic,copy) NSString * workTime;
@property(nonatomic,copy) NSString * sexChoose;
@property(nonatomic,copy) NSString * ageMax;
@property(nonatomic,copy) NSString * ageMin;
@property(nonatomic,copy) NSString * needPeople;
@property(nonatomic,copy) NSString * comType;
@property(nonatomic,copy) NSString * comScale;
@property(nonatomic,copy) NSString * tipTime;
@property(nonatomic,copy) NSString * education;


/**
 原始数据字典。
 */
@property(nonatomic,copy) NSDictionary * dic;





+(NSArray*)modelWithArray:(NSArray*)array;

-(NSString*)path;
/**
 简历路径
 */
+(NSString*)infoPath;
@end

NS_ASSUME_NONNULL_END
