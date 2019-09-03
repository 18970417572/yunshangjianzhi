//
//  AdviceViewController.m
//  test
//
//  Created by dean on 2019/8/24.
//  Copyright © 2019 dean. All rights reserved.
//

#import "AdviceViewController.h"

#import <Toast.h>

@interface AdviceViewController ()
@property (weak, nonatomic) IBOutlet UITextView *advice_textview;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

@implementation AdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    // Do any additional setup after loading the view.
}
- (IBAction)confirmAction:(id)sender {
    if ([self.advice_textview.text isEqualToString:@""]) {
         [self.navigationController.view makeToast:@"请输入您的建议" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
        return ;
    }
    
    
    [self.view endEditing:1];
    
    //假装提交
    [self.navigationController.view makeToast:@"我们已经收到您的建议，会尽快与您取得联系。" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
    
//    NSLog(@"我们已经收到您的建议，会尽快与您取得联系。");
    
    
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
