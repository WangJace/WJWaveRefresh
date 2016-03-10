//
//  WJRefreshAnimation.h
//  WJWaveRefresh
//
//  Created by Wang on 16/3/10.
//  Copyright © 2016年 WangJace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJRefreshAnimation : UIView

@property (nonatomic) CGFloat frequency;//波浪频率
@property (strong, nonatomic) UIImage *grayLogoImage;
@property (strong, nonatomic) UIImage *redLogoImage;


/**
 *  初始化
 *
 *  @param frame
 *  @param grayImage 底部灰色图片
 *  @param redImage 需要显示出来的图片
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame grayImage:(UIImage *)grayImage redImage:(UIImage *)redImage;

- (void)startAnimating;

- (void)stopAnimating;

@end
