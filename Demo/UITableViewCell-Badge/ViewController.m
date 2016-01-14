//
//  ViewController.m
//  UITableViewCell-Badge
//
//  Created by XuNing on 16/1/6.
//  Copyright © 2016年 XuNing. All rights reserved.
//

#import "ViewController.h"
#import "CustomCodeCell.h"
#import "CustomXibCell.h"
#import "MGSwipeTableCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 2;
        case 2:
            return 1;
        default:
            return 30;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *const UITableViewCellIdentifier0 = @"UITableViewCell0";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier0];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:UITableViewCellIdentifier0];
            }
            cell.textLabel.text = @"UITableViewCell title";
            cell.detailTextLabel.text = @"This is description, This is description, This is description";
            cell.badgeString = @"20";
            return cell;
        } else {
            static NSString *const UITableViewCellIdentifier1 = @"UITableViewCell1";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier1];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:UITableViewCellIdentifier1];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            cell.textLabel.text = @"UITableViewCell title";
            cell.detailTextLabel.text = @"This is description";
            cell.badgeString = @"8721";
            cell.badgeCornerRadius = @5;
            cell.badgeColor = [UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:1];
            cell.badgeFont = [UIFont fontWithName:@"Georgia" size:12];
            return cell;
        }
        
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            static NSString *const CustomCodeCellIdentifier = @"CustomCodeCellIdentifier";
            CustomCodeCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCodeCellIdentifier];
            if (!cell) {
                cell = [[CustomCodeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCodeCellIdentifier];
            }
            [cell setupWithInfo:@{@"text": @"~~ CustomCodeCell ~~", @"badge": @": )"}];
            
            return cell;
        } else {
            static NSString *const CustomXibCellIdentifier = @"CustomXibCellIdentifier";
            CustomXibCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomXibCellIdentifier];
            if (!cell) {
                cell = [[NSBundle mainBundle] loadNibNamed:@"CustomXibCell" owner:nil options:nil].firstObject;
                [cell.button addTarget:self action:@selector(randomSetBadge) forControlEvents:UIControlEventTouchUpInside];
            }
            cell.badgeString = @"Yo!";
            
            return cell;
        }
        
    } else if (indexPath.section == 2) {
        static NSString *const MGSwipeTableCellIdentifier = @"MGSwipeTableCellIdentifier";
        MGSwipeTableCell * cell = [self.tableView dequeueReusableCellWithIdentifier:MGSwipeTableCellIdentifier];
        if (!cell) {
            cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MGSwipeTableCellIdentifier];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"MGSwipeTableCell: %@", indexPath];
        cell.badgeView.text = @"Egg";
        cell.badgeView.cornerRadius = @2;
        cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"Delete" backgroundColor:[UIColor redColor]],
                              [MGSwipeButton buttonWithTitle:@"More" backgroundColor:[UIColor lightGrayColor]]];
        cell.badgeView.badgeColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.2 alpha:1];
        cell.badgeView.font = [UIFont boldSystemFontOfSize:14];
        return cell;
    } else {
        static NSString *const CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = @"No badge here";
        
        return cell;
    }
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"UITableViewCell";
        case 1:
            return @"CustomCell";
        case 2:
            return @"MGSwipeTableCell";
        case 3:
            return @"CellWithoutBadge";
        default:
            return nil;
    }
}

#pragma mark - UITableViewDelegate

#pragma mark - Event Response
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
}

- (void)randomSetBadge {
    CustomXibCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    cell.badgeString = [NSString stringWithFormat:@"%u", arc4random() % 99999];
    cell.badgeColor = [UIColor colorWithRed:(arc4random() % 255) / 255.00 green:(arc4random() % 255) / 255.00 blue:(arc4random() % 255) / 255.00 alpha:1];
//    cell.badgeTextColor = [UIColor colorWithRed:(arc4random() % 255) / 255.00 green:(arc4random() % 255) / 255.00 blue:(arc4random() % 255) / 255.00 alpha:1];
//    cell.badgeCornerRadius = @(arc4random() % 4 + 1);
}

#pragma mark - Private Method

#pragma mark - Getters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - Setters

@end
