//
//  DetailViewController.m
//  test
//
//  Created by dean on 2019/8/22.
//  Copyright © 2019 dean. All rights reserved.
//

#import "DetailViewController.h"
#import <Toast/Toast.h>
//#import <EaseUI.h>
#import <RongIMKit/RongIMKit.h>
#import "TMConversationViewController.h"


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *jobName;
@property (weak, nonatomic) IBOutlet UILabel *comName;
@property (weak, nonatomic) IBOutlet UILabel *comLocation;
//@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *needPeople;
@property (weak, nonatomic) IBOutlet UILabel *comType;
@property (weak, nonatomic) IBOutlet UILabel *comSize;
@property (weak, nonatomic) IBOutlet UILabel *pushTime;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UILabel *sexChoose;
@property (weak, nonatomic) IBOutlet UILabel *workTime;
@property (weak, nonatomic) IBOutlet UILabel *edu_label;
@property (weak, nonatomic) IBOutlet UILabel *connection;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"兼职详情";
    
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"举报" style:UIBarButtonItemStyleDone target:self action:@selector(report)];
    self.navigationItem.rightBarButtonItem = item ;
    
    // Do any additional setup after loading the view.
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //安装元素
    
    self.jobName.text = self.model.jobName;
    
    self.comName.text = self.model.comName;
    
    self.comLocation.text = self.model.jobLocation;
    
    self.needPeople.text = self.model.needPeople;
    
    self.comType.text = self.model.comType;
    
    self.comSize.text = [NSString stringWithFormat:@"规模:%@",self.model.comScale];
    
    self.pushTime.text = self.model.tipTime;
    
    self.info.text = self.model.jobAbout;
    
    self.sexChoose.text = self.model.sexChoose;
    
    self.workTime.text = self.model.workTime;
    
    self.edu_label.text = self.model.education;
    self.connection.text = self.model.qq;
    self.moneyLabel.text = self.model.jobMoney;
    return ;
    NSString *s = @"已收藏";
    if ([self isCollected]) {
        
    }else{
        s = @"收藏";
    }
    [self.collectionBtn setTitle:s forState:UIControlStateNormal];
}


-(void)report{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = true;
    
    [self.view makeToast:@"举报成功，我们将会尽快进行审查" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
}


- (IBAction)pushMine:(UIButton *)sender {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = true;
    [self.view makeToast:@"已经接受到您的简历，HR会尽快与你取得联系" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
//    NSLog(@"简历投递");
}


- (IBAction)collectionAction:(UIButton *)sender {
    
    TMConversationViewController *chat = [[TMConversationViewController alloc] initWithConversationType:ConversationType_PRIVATE targetId:@"targetIdYouWillChatIn"];
    
    //设置聊天会话界面要显示的标题
//    chat.title = @"想显示的会话标题";
    //显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];
    
    
//    EMChatViewController *chatController = [[EMChatViewController alloc] initWithConversationId:@"user2" type:EMConversationTypeChat createIfNotExist:YES];
    
    return ;
    NSString *s = @"已收藏";
    if ([self isCollected]) {//收藏了
        [self removeFromCollectionList];//删除收藏
        s = @"收藏";
    }else{//没有收藏
         [self saveCollectionList];//收藏
    }
    [self.collectionBtn setTitle:s forState:UIControlStateNormal];
    //获取得到数据存储的路径
}


/**
 有无收藏
 */
-(BOOL)isCollected{
    
    //遍历收藏列表
    NSString * path = [self.model path];
    NSMutableArray * array = nil;
    //存储时间戳
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {//添加之后再保存
        array = [NSMutableArray arrayWithContentsOfFile:path];
    }else{//保存到这里
        array = [NSMutableArray array];
        
    }
    __block BOOL isExists = false; //有问题，崩溃
    for (NSDictionary * tempDic  in array) {
        //遍历
        if ([self.model.fieldid intValue]==[tempDic[@"fieldid"] intValue]) {
            isExists = true;
        }
    }
    
    return isExists;
}



/**
 保存数据
 */
-(void)saveCollectionList{
    NSString * path = [self.model path];
    NSMutableArray * array = nil;
    //存储时间戳
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {//添加之后再保存
        array = [NSMutableArray arrayWithContentsOfFile:path];
    }else{//保存到这里
        array = [NSMutableArray array];
        
    }
    [array addObject:self.model.dic];
    BOOL r = [array writeToFile:path atomically:true];
    //判断r
    if (r) {//成功
        NSLog(@"save s");
        
        [self.view makeToast:@"收藏成功" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
        
    }else{//失败
        NSLog(@"save f");
        
//        [self.view makeToast:@"取消收藏" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
        
    }
}




/**
 移除数据
 */
-(void)removeFromCollectionList{
    NSString * path = [self.model path];
    NSMutableArray * array = nil;
    //存储时间戳
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {//添加之后再保存
        array = [NSMutableArray arrayWithContentsOfFile:path];
    }else{//保存到这里
        array = [NSMutableArray array];
    }
    //移除数据
    int a = -1;
    for (int i = 0; i<array.count; i++) {
        NSDictionary * dic = array[i];
        if ([dic[@"fieldid"] intValue]   == [self.model.fieldid intValue] ) {
            //记住索引
            a = i;
        }
    }
    if (a>-1) {
    //进行移除
        [array removeObjectAtIndex:a];
    }
    
    
    BOOL r = [array writeToFile:path atomically:true];
    //判断r
    if (r) {//成功
        NSLog(@"remove s");
        
        [self.view makeToast:@"取消收藏成功" duration:1.0 position:NSStringFromCGPoint(self.view.center)];
        
    }else{//失败
        NSLog(@"remove f");
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
