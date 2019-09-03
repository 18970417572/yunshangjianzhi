//
//  ObjectModel.m
//  test
//
//  Created by dean on 2019/8/22.
//  Copyright © 2019 dean. All rights reserved.
//

#import "ObjectModel.h"

@implementation ObjectModel

+(NSArray *)modelWithArray:(NSArray *)array{
    NSMutableArray * mine_array = [NSMutableArray array];
    
    for (NSDictionary*dic in array) {
        ObjectModel * model = [ObjectModel new];
//        ObjectModel * model = [[ObjectModel init]alloc];
        model.fieldid=dic[@"fieldid"];
        model.comName=dic[@"comName"];
        model.jobName=dic[@"jobName"];
        model.jobLocation=dic[@"jobLocation"];
        model.jobMoney=dic[@"jobMoney"];
        model.jobAbout=dic[@"jobAbout"];
        model.qq=dic[@"qq"];
        model.workTime=dic[@"workTime"];
        model.sexChoose=dic[@"sexChoose"];
        model.ageMax=dic[@"ageMax"];
        model.ageMin=dic[@"ageMin"];
        model.needPeople=dic[@"needPeople"];
        model.comType=dic[@"comType"];
        model.comScale=dic[@"comScale"];
        model.tipTime=dic[@"tipTime"];
        model.education=dic[@"education"];
        model.dic = dic;
        [mine_array addObject:model];
    }
    
    
    
    return [mine_array copy];
    
}


/**
 路径
 */
-(NSString*)path{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
    NSString * path = [paths objectAtIndex:0];//tmp目录NSString *tmpDir = NSTemporaryDirectory();
    NSString * pathTemp = [NSString stringWithFormat:@"%@/collectionList.plist",path];
    NSLog(@"pathTemp  %@",pathTemp);
    return pathTemp;
}



/**
 简历path
 */
+(NSString*)infoPath{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
    NSString * path = [paths objectAtIndex:0];//tmp目录NSString *tmpDir = NSTemporaryDirectory();
    NSString * pathTemp = [NSString stringWithFormat:@"%@/info.plist",path];
    NSLog(@"pathTemp  %@",pathTemp);
    return pathTemp;
    
}



@end
