//
//  ViewController.m
//  WJWaveRefresh
//
//  Created by Wang on 16/3/9.
//  Copyright © 2016年 WangJace. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#import "WJRefreshHeader.h"
#import "WJRefreshAutoStateFooter.h"

static const CGFloat MJDuration = 3.0;

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _data = [[NSMutableArray alloc] init];
    _myTableView.mj_header = [WJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [_myTableView.mj_header beginRefreshing];
    
    _myTableView.mj_footer = [WJRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
}

- (void)loadNewData{
    for (int i = 0; i<5; i++) {
        [self.data addObject:@"1"];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [_myTableView reloadData];
        
        // 结束刷新状态
        [_myTableView.mj_header endRefreshing];
        [_myTableView.mj_footer endRefreshing];
    });
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"index: %ld",(long)indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
