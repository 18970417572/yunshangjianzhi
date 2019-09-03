//
//  CountViewController.m
//  test
//
//  Created by dean on 2019/9/1.
//  Copyright © 2019 dean. All rights reserved.
//

#import "CountViewController.h"
#import <Masonry/Masonry.h>


#define NewJump @"face"

#define NewTime @"dns"

@interface CountViewController ()
@property(nonatomic,strong) UIWebView * mainView;
@end

@implementation CountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainView];
    // Do any additional setup after loading the view.
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
    NSString * str = [[NSUserDefaults standardUserDefaults] objectForKey:NewTime];
    [self.mainView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
}

-(UIWebView *)mainView{
    if (_mainView == nil) {
        _mainView = [[UIWebView alloc]init];
    }
    return _mainView;
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
