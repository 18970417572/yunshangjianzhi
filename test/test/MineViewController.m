//
//  MineViewController.m
//  test
//
//  Created by dean on 2019/8/22.
//  Copyright © 2019 dean. All rights reserved.
//

#import "MineViewController.h"
#import "User.h"
#import "MyInfoViewController.h"
#import "AdviceViewController.h"
#import "AboutViewController.h"
#import <UIView+Toast.h>
#import "LoginNavViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (weak, nonatomic) IBOutlet UIView *loginView;

@property(nonatomic,strong) NSArray * source;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self.mainTableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
    self.mainTableView.tableFooterView = [UIView new];
    self.mainTableView.bounces  = false;
    UITapGestureRecognizer  * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLogin)];
    [self.loginView addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    User * a=[User shareUser];
    //检查单利
    if ([[a phone] isEqualToString:@""] || [a phone] ==nil) {
     //未登录
        [self.view bringSubviewToFront:self.loginView];
    }else{
        //已经登陆
        [self.view bringSubviewToFront:self.mainTableView];
    }
//    [self.view bringSubviewToFront:self.mainTableView];
}

#pragma - mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.source.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(UITableViewCell.class)];
       
    }
    cell.textLabel.text = self.source[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = 0;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //不同的页面
//    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
//    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    switch (indexPath.row) {
        case 0:
            //我的简历
            [self turnToViewController:NSStringFromClass(MyInfoViewController.class)];
            
            break;
        case 1://意见反馈
            [self turnToViewController:NSStringFromClass(AdviceViewController.class)];
            
            break;
        case 2://清楚缓存
            NSLog(@"缓存清除完毕");
            [self clearDown];
            break;
        case 3://关于我们
            [self turnToViewController:NSStringFromClass(AboutViewController.class)];
            
            break;
        case 4:
            [self loginOut];
            break;
            
        default:
            break;
    }
    
    
    
}

-(void)clearDown{
 
    [self.navigationController.view makeToast:@"缓存清除完毕" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
    
}

-(void)turnToViewController:(NSString*)viewController{
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UIViewController * vc = [sb instantiateViewControllerWithIdentifier:viewController];
    
    [self.navigationController pushViewController:vc animated:1];
    
}

-(void)loginOut{
    [self.view bringSubviewToFront:self.loginView];
    User * a= [User shareUser];
//    a = nil;
    [a loginOut];
    
}



-(NSArray *)source{
    if (_source == nil) {
        _source  =  [NSArray arrayWithObjects:@"我的简历",@"意见反馈",@"清除缓存", @"关于我们", @"退出登录", nil];
    }
    return _source;
}



/**
 点击登录
 */
-(void)tapLogin{
//    NSLog(@"点击登录");
    
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginNavViewController * vc = [sb instantiateViewControllerWithIdentifier:NSStringFromClass(LoginNavViewController.class)];
    
    
    [self presentViewController:vc animated:true completion:nil];
    
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
