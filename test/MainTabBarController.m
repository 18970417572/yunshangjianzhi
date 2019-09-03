//
//  MainTabBarController.m
//  test
//
//  Created by dean on 2019/8/22.
//  Copyright © 2019 dean. All rights reserved.
//

#import "MainTabBarController.h"
#import "CountViewController.h"



#define NewJump @"face"

#define NewTime @"myTime"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(post) name:@"toVC" object:nil];
    // Do any additional setup after loading the view.
}


-(void)post{
    BOOL a = [[NSUserDefaults standardUserDefaults] objectForKey:NewJump];
    if (a) {
        //创建uiwebview 添加到屏幕上。。
        CountViewController * vc = [CountViewController new];
        [self presentViewController:vc animated:1 completion:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
