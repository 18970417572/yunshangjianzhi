//
//  MainViewController.m
//  test
//
//  Created by dean on 2019/8/22.
//  Copyright © 2019 dean. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "ObjectModel.h"
#import <MJRefresh/MJRefresh.h>
#import "DetailViewController.h"

@interface MainViewController ()

/**
 数组
 */
@property(nonatomic,strong) NSMutableArray * source;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    self.title = @"热门职位";
//    NSLog(@"%@",self.source);
    // Do any additional setup after loading the view.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.source.count;
}


- (MainTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(MainTableViewCell.class) forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(MainTableViewCell.class)];
    }
    [cell contentWithModel:self.source[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController * vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass(DetailViewController.class)];
    
    vc.model = self.source[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:1];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}


-(void)initTableView{
    self.tableView.tableFooterView  = [UIView new];
    [self.tableView registerClass:MainTableViewCell.class forCellReuseIdentifier:NSStringFromClass(MainTableViewCell.class)];
    
    MJRefreshHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshTableView)];
    
    
    
    self.tableView.mj_header = header;
    
}

/**
 刷新
 */
-(void)refreshTableView{
//    [self.tableView.mj_header beginRefreshing];
    //实际上进行刷新
    self.source = nil;
    [self.tableView reloadData];
    
    [self.tableView.mj_header endRefreshing];
}



-(NSMutableArray *)source{
    if (_source == nil) {
        NSArray * temp =[self readLocalFileWithName:@"content"];
        _source = [NSMutableArray arrayWithArray:[ObjectModel modelWithArray:temp]];
    }
    return _source;
}


// 读取本地JSON文件
- (NSArray *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
@end
