//
//  authorInfoHeadView.m
//  kuaikanCartoon
//
//  Created by dengchen on 16/5/5.
//  Copyright © 2016年 name. All rights reserved.
//

#import "authorInfoHeadView.h"
#import <Masonry.h>
#import "userModel.h"
#import <UIImageView+WebCache.h>
#import "CommonMacro.h"
#import "Color.h"
@interface authorInfoHeadView ()

@property (nonatomic,weak) UIImageView *authorIcon;

@property (nonatomic,weak) UILabel *authorName;

@property (nonatomic,weak) UIButton *follow;

@property (nonatomic,weak) UIView *line;

@end



@implementation authorInfoHeadView

static CGFloat spacing = 10;
static CGFloat imageSize = 60;
static CGFloat followSize = 21;


- (void)setUser:(userModel *)user {
    _user = user;
    [self updataUI];
}

- (void)updataUI {
    
    [self.authorIcon sd_setImageWithURL:[NSURL URLWithString:self.user.avatar_url] placeholderImage:[UIImage imageNamed:@"ic_author_info_headportrait_50x50_"]];
    
    [self.authorName setText:self.user.nickname];
    
}



- (void)setupUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.authorIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(spacing);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@(imageSize));
        
    }];
    
    [self.authorName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.authorIcon.mas_right).offset(spacing);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.follow.mas_left).offset(-spacing);
        
    }];
    
    
    [self.follow mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-spacing);
        make.width.height.equalTo(@(followSize));
        
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-SINGLE_LINE_WIDTH);
        make.height.equalTo(@(SINGLE_LINE_WIDTH));
    }];
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSLog(@"%@",NSStringFromCGRect(self.line.frame));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)follow:(UIButton *)sender {
    
    printf("%s\n",__func__);

}


- (UIImageView *)authorIcon {
    if (!_authorIcon) {
        UIImageView *icon = [UIImageView new];
        [self.contentView addSubview:icon];
        
        icon.layer.cornerRadius = imageSize * 0.5;
        icon.layer.masksToBounds = YES;
        
        _authorIcon = icon;
    }
    return _authorIcon;
}

- (UILabel *)authorName {
    if (!_authorName) {
        
        UILabel *name = [UILabel new];
        [self.contentView addSubview:name];
        
        name.font = [UIFont systemFontOfSize:13];
        name.textAlignment = NSTextAlignmentLeft;
        name.textColor = [UIColor lightGrayColor];
        _authorName = name;
    }
    return _authorName;
}

- (UIButton *)follow {
    if (!_follow) {
        UIButton *btn = [UIButton new];
        [self.contentView addSubview:btn];
        
        [btn setImage:[UIImage imageNamed:@"ic_details_top_collection_normal_21x21_"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"ic_details_top_collection_prressed_21x21_"] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(follow:) forControlEvents:UIControlEventTouchUpInside];
        
        _follow = btn;
        
    }
    return _follow;
}

- (UIView *)line {
    if (!_line) {
        UIView *line = [UIView new];
        [self.contentView addSubview:line];
        
        line.backgroundColor = White(0.9);
        
        _line = line;
    }
    
    return _line;
}

@end
