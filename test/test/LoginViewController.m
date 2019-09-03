//
//  LoginViewController.m
//  test
//
//  Created by dean on 2019/8/24.
//  Copyright © 2019 dean. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPassViewController.h"
#import "RegisterViewController.h"
#import "User.h"
#import <Toast.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *password_text;
@property (weak, nonatomic) IBOutlet UITextField *account_text;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    
    self.loginBtn.layer.cornerRadius = 35;
    self.loginBtn.layer.masksToBounds = true;
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.loginBtn.bounds;
    // 255 .  212  121
    gradient.colors = @[(id)[UIColor colorWithRed:255/255.0 green:212/255.0 blue:121/255.0 alpha:1.0].CGColor,(id)[UIColor whiteColor].CGColor];
    gradient.startPoint = CGPointMake(0, 1);
    gradient.endPoint = CGPointMake(1, 0);
    //    gradient.locations = @[@(0.5f), @(1.0f)];
    [self.loginBtn.layer addSublayer:gradient];
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:1 completion:nil];
    
}
- (IBAction)forgetAction:(id)sender {
    //跳转
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    ForgetPassViewController * vc = [sb instantiateViewControllerWithIdentifier:NSStringFromClass(ForgetPassViewController.class)];
    
    [self.navigationController pushViewController:vc animated:1];
}
- (IBAction)registerAction:(id)sender {
    
    
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    ForgetPassViewController * vc = [sb instantiateViewControllerWithIdentifier:NSStringFromClass(RegisterViewController.class)];
    
    [self.navigationController pushViewController:vc animated:1];
    
    
}
- (IBAction)loginAction:(id)sender {
    //获取路径，检查是否有对象，以及密码匹配。
     [self.view endEditing:1];
    NSString * path = [User path];
//    User * user = [User shareUser];
    //路径
    NSMutableArray * array = [NSMutableArray arrayWithContentsOfFile:path];
    
//    NSMutableArray * array = [NSMutableArray arrayWithContentsOfURL:[NSURL URLWithString:path]];
    if (array == nil) {
        array = [NSMutableArray array];
    }
    
    
    
    //遍历
    __block BOOL r = false;
    for (NSDictionary * dic  in array) {
        //
        if ([dic[@"phone"] isEqualToString:self.account_text.text]) {//有账户
            if ([dic[@"password"] isEqualToString:self.password_text.text]) {
                //验证通过。
                //填充user
                User * a = [User modelWithDic:dic];
                NSLog(@"验证通过");
                r=true;
            }
        }else{
            NSLog(@"密码错误");
        }
    }
    //账户不存在
    NSLog(@"账户不存在");
    
    
    //特殊账户登录
    if ([self.password_text.text isEqualToString:@"123456"] && [self.account_text.text isEqualToString:@"19942125104"]) {
        //直接登录
        User* a = [User shareUser];
        a.phone = @"19942125104";
        a.password  = @"123456";
        r=true;
    }
    
    if (r) {
        //跳转登录成功,发送通知.
        [self dismissViewControllerAnimated:1 completion:nil];
    }else{
        [self.view makeToast:@"账户不存在或者密码错误" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:1];
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
