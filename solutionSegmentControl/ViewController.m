//
//  ViewController.m
//  solutionSegmentControl
//
//  Created by bigcd on 16/8/4.
//  Copyright © 2016年 chendi. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "BViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

/** 分段选择器 */
@property (nonatomic, strong) UISegmentedControl *segment;

/** uitableview */
@property (nonatomic, strong) UITableView *tableView;

/** 数据源1 */
@property (nonatomic, strong) NSArray *arr1;

/** 数据源2 */
@property (nonatomic, strong) NSArray *arr2;

@end

@implementation ViewController

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
static NSString *ID = @"cell";

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        [_tableView setFrame:CGRectMake(0, 180, screenWidth, screenHeight - 180)];
        [_tableView setRowHeight:80];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
        _tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:0.8]];
    self.arr1 = @[@"测试1", @"测试2"];
    self.arr2 = @[@"界面1", @"界面2"];
    [self setupSegment];
    [self.tableView reloadData];
}

- (void)setupSegment
{
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"第一", @"第二"]];
    self.segment.frame = CGRectMake(60, 100, 200, 40);
    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(segmentClick) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segment];
}

- (void)segmentClick
{
    if(self.segment.selectedSegmentIndex == 0)
    {
        [self.tableView reloadData];
    }else
    {
        [self.tableView reloadData];
    }
}

#pragma mark --UITableViewDataSource--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    switch (self.segment.selectedSegmentIndex) {
        case 0:
            cell.textLabel.text = self.arr1[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = self.arr2[indexPath.row];
            break;
        default:
            break;
    }
    return cell;
}
/* cell点击触发 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(self.segment.selectedSegmentIndex) {
        AViewController *vc1 = [[AViewController alloc] init];
        [self.navigationController pushViewController:vc1 animated:YES];
    }else{
        BViewController *vc2 = [[BViewController alloc] init];
        [self.navigationController pushViewController:vc2 animated:YES];
    }
//    switch (self.segment.selectedSegmentIndex) {
//        case 0:
//        {
//            AViewController *vc1 = [[AViewController alloc] init];
//            [self.navigationController pushViewController:vc1 animated:YES];
//            break;
//        }
//        case 1:
//        {
//            BViewController *vc2 = [[BViewController alloc] init];
//            [self.navigationController pushViewController:vc2 animated:YES];
//            break;
//        }
//        default:
//            break;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
