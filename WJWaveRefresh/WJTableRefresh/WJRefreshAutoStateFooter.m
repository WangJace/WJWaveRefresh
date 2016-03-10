//
//  WJRefreshAutoStateFooter.m
//  WJWaveRefresh
//
//  Created by Wang on 16/3/10.
//  Copyright © 2016年 WangJace. All rights reserved.
//

#import "WJRefreshAutoStateFooter.h"
#import "WJRefreshAnimation.h"
#import "UIView+Additions.h"

@interface WJRefreshAutoStateFooter ()

@property (nonatomic, weak) WJRefreshAnimation *logoView;

@end

@implementation WJRefreshAutoStateFooter

- (WJRefreshAnimation *)logoView
{
    if (!_logoView) {
        WJRefreshAnimation *logoView = [[WJRefreshAnimation alloc] initWithFrame:CGRectMake(100, 100, 100, 20)
                                                                       grayImage:[UIImage imageNamed:@"grayLogo"]
                                                                        redImage:[UIImage imageNamed:@"lightGrayLogo"]];
        [self addSubview:_logoView = logoView];
    }
    return _logoView;
}

#pragma makr - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
    self.mj_h = 60;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    CGFloat centerY = self.mj_h * 0.5;
    self.stateLabel.frame = CGRectMake(0, 0, self.width, 30);
    self.stateLabel.center = CGPointMake(self.mj_w * 0.5, centerY + 15);
    self.logoView.center = CGPointMake(self.mj_w * 0.5, centerY - 8);
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
        [self.logoView stopAnimating];
        [self setFooterHidden:YES];
    } else if (state == MJRefreshStateRefreshing) {
        [self.logoView startAnimating];
        [self setFooterHidden:NO];
    }
}


- (void)setFooterHidden:(BOOL)hidden
{
    self.logoView.hidden = hidden;
    self.stateLabel.hidden = hidden;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
