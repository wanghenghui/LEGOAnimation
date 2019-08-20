
//
//  LEGOViewController.m
//  LEGOAnimation
//
//  Created by 杨庆人 on 2019/8/5.
//  Copyright © 2019年 杨庆人. All rights reserved.
//

#import "LEGOViewController.h"
#import <Masonry/Masonry.h>
#import "LEGOCABasicViewController.h"
#import "LEGOCAKeyframeViewController.h"
#import "LEGOStretchViewController.h"
#import "LEGOCASpringViewController.h"
#import "LEGOSceneViewController.h"
#import "LEGOKnobViewController.h"
#import "LEGORouletteViewController.h"
#import "LEGOTransformViewController.h"

@interface LEGOViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <NSDictionary *> *dataSource;

@end

@implementation LEGOViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = (id <UITableViewDataSource>)self;
        _tableView.delegate = (id <UITableViewDelegate>)self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"iOS 动画";
    
    self.dataSource = @[@{@"section":@"基础动画",@"row":@[@"缩放",@"旋转",@"渐变"]},
                        @{@"section":@"关键帧",@"row":@[@"关键帧",@"路径",@"抖动"]},
                        @{@"section":@"形变",@"row":@[@"挤压",@"拉扯",@"形变"]},
                        @{@"section":@"仿真（一）",@"row":@[@"旋钮"]},
                        @{@"section":@"仿真（二）",@"row":@[@"轮盘"]},
                        @{@"section":@"仿真（三）",@"row":@[@"移动"]},
                        @{@"section":@"仿真（四）",@"row":@[@"翻转"]},
                        @{@"section":@"场景",@"row":@[@"场景动画"]},];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)self.dataSource[section][@"row"]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identity = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    cell.textLabel.text = ((NSArray *)self.dataSource[indexPath.section][@"row"])[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            LEGOCABasicViewController *vc = [[LEGOCABasicViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            }
            break;
        case 1: {
            LEGOCAKeyframeViewController *vc = [[LEGOCAKeyframeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2: {
            LEGOStretchViewController *vc = [[LEGOStretchViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3: {
            LEGOKnobViewController *vc = [[LEGOKnobViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4: {
            LEGORouletteViewController *vc = [[LEGORouletteViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5: {
            LEGOTransformViewController *vc = [[LEGOTransformViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6: {
            LEGOCASpringViewController *vc = [[LEGOCASpringViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7: {
            LEGOSceneViewController *vc = [[LEGOSceneViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor colorWithRed:244/255.0 green:239/255.0 blue:249/255.0 alpha:1];
    label.text = [NSString stringWithFormat:@"   %@",(NSArray *)self.dataSource[section][@"section"]];
    return label;
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
