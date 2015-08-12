//
//  ONTabBar.h
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/12.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ONTabView.h"

@interface ONTabBar : UIScrollView<UIScrollViewDelegate>


@property (nonatomic, strong) NSMutableArray * items;
@property (nonatomic, strong) UIColor * highlightColor;
@property (nonatomic, strong) UIColor * normalColor;

/*
 * > 0.0 stacks : tabs to the right, at the end of the last tab
 *
 * < 0.0 stacks : tabs to the left, on the right side of the last tab
 *
 * Default is 2.0, which looks nice on iPhone non-retina and iPad retina
 *
 */
@property (nonatomic) CGFloat stackedTabOffset;

- (void) addTabItem:(ONTabView * )item;
- (void) addTabItemWithCompletition:(void (^)(ONTabView *tabItem))completition;


@end
