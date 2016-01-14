//
//  CustomCodeCell.m
//  UITableViewCell-Badge
//
//  Created by XuNing on 16/1/13.
//  Copyright © 2016年 XuNing. All rights reserved.
//

#import "CustomCodeCell.h"

@interface CustomCodeCell ()
@property(nonatomic, strong) UILabel *label;
@end

@implementation CustomCodeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.label];
        self.badgeColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1];
        self.badgeTextColor = [UIColor colorWithRed:0.2 green:0.3 blue:0.2 alpha:1];
        self.forceBadgeCircular = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.label sizeToFit];
    self.label.center = self.contentView.center;
}

- (void)setupWithInfo:(NSDictionary *)info {
    self.label.text = info[@"text"];
    self.badgeString = info[@"badge"];
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

@end
