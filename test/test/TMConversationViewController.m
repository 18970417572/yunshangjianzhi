//
//  TMConversationViewController.m
//  test
//
//  Created by dean on 2019/8/27.
//  Copyright © 2019 dean. All rights reserved.
//

#import "TMConversationViewController.h"

@interface TMConversationViewController ()

@end

@implementation TMConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"与HR沟通中";
    // Do any additional setup after loading the view.
}





- (RCMessage *)willAppendAndDisplayMessage:(RCMessage *)message{
    message.sentStatus = SentStatus_SENT;
    return message;
};





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
