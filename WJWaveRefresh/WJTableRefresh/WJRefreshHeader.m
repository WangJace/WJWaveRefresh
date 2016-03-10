//
//  WJRefreshHeader.m
//  WJWaveRefresh
//
//  Created by Wang on 16/3/10.
//  Copyright © 2016年 WangJace. All rights reserved.
//

#import "WJRefreshHeader.h"
#import "WJRefreshAnimation.h"

@interface WJRefreshHeader ()

@property (nonatomic,weak) UILabel *label;
@property (nonatomic,weak) WJRefreshAnimation *logoView;

@end

@implementation WJRefreshHeader

- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 60;
    
    // title
    UILabel *label = [UILabel label];
    [self addSubview:label];
    self.label = label;
    WJRefreshAnimation *logoView = [[WJRefreshAnimation alloc] initWithFrame:CGRectMake(100, 100, 100, 20)
                                                                   grayImage:[UIImage imageNamed:@"grayLogo"]
                                                                    redImage:[UIImage imageNamed:@"redLogo"]];
    [self addSubview:logoView];
    self.logoView = logoView;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    CGFloat centerY = self.mj_h * 0.5;
    self.label.frame = CGRectMake(0, 0, 100, 30);
    self.label.center = CGPointMake(self.mj_w * 0.5, centerY + 15);
    
    self.logoView.center = CGPointMake(self.mj_w * 0.5, centerY - 8);
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            [self.logoView stopAnimating];
            self.label.text = @"下拉可以刷新";
            break;
        case MJRefreshStatePulling:
            [self.logoView stopAnimating];
            self.label.text = @"松开立即刷新";
            break;
        case MJRefreshStateRefreshing:
            self.label.text = @"正在刷新数据中...";
            [self.logoView startAnimating];
            break;
        default:
            break;
    }
}

@end
