//
//  ONTabView.h
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/11.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ONTabView : UIView

@property (nonatomic, assign) CGRect orgFrame;

@property (nonatomic, weak) UILabel *titleLabel;

@property (strong, nonatomic) UIColor *innerBackgroundColor;
@property (strong, nonatomic) UIColor *foregroundColor;

@property (nonatomic, strong) UIColor *highlightColor;
@property (nonatomic, strong) UIColor *normalColor;


@end
