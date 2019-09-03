//
//  MyInfoViewController.m
//  test
//
//  Created by dean on 2019/8/24.
//  Copyright © 2019 dean. All rights reserved.
//

#import "MyInfoViewController.h"
#import "User.h"
#import "ObjectModel.h"
#import <Toast.h>

@interface MyInfoViewController ()
//- (IBAction)phone_text:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *phone_text;
@property (weak, nonatomic) IBOutlet UITextField *age_text;
@property (weak, nonatomic) IBOutlet UITextField *name_text;
@property (weak, nonatomic) IBOutlet UITextField *workTime_text;
@property (weak, nonatomic) IBOutlet UITextField *jobType_text;
@property (weak, nonatomic) IBOutlet UITextField *edu_text;

@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"简历";
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem=item;
    
    // Do any additional setup after loading the view.
}

/**
 保存个人简历
 */
-(void)save{
    

    NSString * path = [ObjectModel infoPath];//找到路径
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    if (dic == nil) {
        dic = [NSMutableDictionary  dictionary];
    }
    
    [dic setValue:self.phone_text.text forKey:@"phone"];
    [dic setValue:self.age_text.text forKey:@"age"];
    [dic setValue:self.name_text.text forKey:@"name"];
    [dic setValue:self.workTime_text.text forKey:@"workTime"];
    [dic setValue:self.jobType_text.text forKey:@"jobType"];
    [dic setValue:self.edu_text.text forKey:@"edu"];
    
    BOOL r = [dic writeToFile:path atomically:1];
    if (r) {
        NSLog(@"保存成功");
    }else{
        NSLog(@"保存失败");
    }
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:1];
}



- (IBAction)phone_text:(id)sender {
}
@end
