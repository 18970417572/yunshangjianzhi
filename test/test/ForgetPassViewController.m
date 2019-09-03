//
//  ForgetPassViewController.m
//  test
//
//  Created by dean on 2019/8/24.
//  Copyright © 2019 dean. All rights reserved.
//

#import "ForgetPassViewController.h"
#import "User.h"
#import <Toast.h>

@interface ForgetPassViewController ()
@property (weak, nonatomic) IBOutlet UITextField * phone_text;
@property (weak, nonatomic) IBOutlet UITextField * name_text;
@property (weak, nonatomic) IBOutlet UITextField * info_text;//年龄
@property (weak, nonatomic) IBOutlet UITextField * confirm_text;
@property (weak, nonatomic) IBOutlet UITextField * password_text;

@end

@implementation ForgetPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"重置账号";
    // Do any additional setup after loading the view.
}
- (IBAction)confirmAction:(id)sender {
    [self.view endEditing:1];
    
    NSString * path = [User path];
    //路径
//    NSMutableArray * array = [NSMutableArray arrayWithContentsOfURL:[NSURL URLWithString:path]];
    
    NSMutableArray * array = [NSMutableArray arrayWithContentsOfFile:path];
    //进行信息注册。
    if (array == nil) {
        array = [NSMutableArray array];
    }
    /*
     temp.phone = dic[@"phone"]; // 有了
     temp.password = dic[@"password"]; //有了
     temp.age = dic[@"age"]; //无
     temp.name = dic[@"name"]; //无
     temp.workTime = dic[@"workTime"];//无
     temp.qq = dic[@"qq"];//无
     temp.pre_work = dic[@"pre_work"];//无
     temp.edu = dic[@"edu"];//无
     */
    if ([self.password_text.text  isEqualToString:self.confirm_text.text]) {
        //验证通过
        NSLog(@"密码验证不通过");
        return ;
    }
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:self.phone_text.text forKey:@"phone"];
    [dic setValue:self.password_text.text forKey:@"password"];
    [dic setValue:self.info_text.text forKey:@"age"];
    [dic setValue:self.name_text.text forKey:@"name"];
    [dic setValue:@"" forKey:@"workTime"];
    [dic setValue:@"" forKey:@"qq"];
    [dic setValue:@"" forKey:@"pre_work"];
    [dic setValue:@"" forKey:@"edu"];
    [array addObject:dic];
    BOOL r = [array writeToFile:path atomically:1];
    
    
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = true;
    NSString * str = nil;
    if (r) {
        //注册成功
        NSLog(@"重置成功");
        str = @"重置成功";
    }else{
        //注册失败
        NSLog(@"重置失败");
        str = @"重置失败";
    }
    [self.view makeToast:str duration:1.0 position:NSStringFromCGPoint(self.view.center)];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
    
    
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
