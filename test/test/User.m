//
//  User.m
//  test
//
//  Created by dean on 2019/8/23.
//  Copyright © 2019 dean. All rights reserved.
//

#import "User.h"


static User * one = nil;

@implementation User


+(User*)shareUser{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        one = [User new];
    });
    return one;
}

/*
 @property(nonatomic,copy) NSString * phone;
 @property(nonatomic,copy) NSString * password;
 @property(nonatomic,copy) NSString * age;
 @property(nonatomic,copy) NSString * name;
 @property(nonatomic,copy) NSString * workTime;
 @property(nonatomic,copy) NSString * qq;
 @property(nonatomic,copy) NSString * pre_work;
 
 @property(nonatomic,copy) NSString * edu;

 */


+(User*)modelWithDic:(NSDictionary*)dic{
    
    User * temp = [User shareUser];
    
    temp.phone = dic[@"phone"];
    temp.password = dic[@"password"];
    temp.age = dic[@"age"];
    temp.name = dic[@"name"];
    temp.workTime = dic[@"workTime"];
    temp.qq = dic[@"qq"];
    temp.pre_work = dic[@"pre_work"];
    temp.edu = dic[@"edu"];
//    temp.qq = dic[@"qq"];
    temp.dic=dic;
    
    
    return temp  ;
}


/**
 路径
 */
+(NSString*)path{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
    NSString * path = [paths objectAtIndex:0];//tmp目录NSString *tmpDir = NSTemporaryDirectory();
    NSString * pathTemp = [NSString stringWithFormat:@"%@/userList.plist",path];
    NSLog(@"pathTemp  %@",pathTemp);
    return pathTemp;
}


-(void)loginOut{
    self.phone = @"";
    self.password = @"";
//    self.age = @"";
//    self.name  = @"";
//    self.workTime = @"";
//    self.qq  = @"";
//    self.pre_work = @"";
//    self.edu  = @"";
}

@end
