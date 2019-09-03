//
//  User.h
//  test
//
//  Created by dean on 2019/8/23.
//  Copyright © 2019 dean. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 用户
 */
@interface User : NSObject

@property(nonatomic,copy) NSString * phone;
@property(nonatomic,copy) NSString * password;
@property(nonatomic,copy) NSString * age;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * workTime;
@property(nonatomic,copy) NSString * qq;
@property(nonatomic,copy) NSString * pre_work;

@property(nonatomic,copy) NSString * edu;


@property(nonatomic,copy) NSDictionary* dic;

-(NSDictionary * )dic;
+(User*)modelWithDic:(NSDictionary*)dic;
/**
 单利
 */
+(User*)shareUser;

/**
 用户存储路径
 */
+(NSString*)path;

/**
 退出
 */
-(void)loginOut;
@end

NS_ASSUME_NONNULL_END
