//
//  ONTabViewCtl.h
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/12.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ONTabBar.h"
#import "ONTabView.h"


@interface ONTabViewCtl : UIViewController

@property(nonatomic,strong) NSMutableArray *viewControllers;
@property(nonatomic,assign) UIViewController *selectedViewController;
@property(nonatomic,strong, readonly) ONTabBar *tabBar;

//top offset to rearrange the tabBar below the statusbar, by default its set to the status bar height (set it to 0) for fullsize
@property float tabBarTopOffset;


- (void)addViewController:(UIViewController *)controller withCompletion:(void (^)(ONTabView *tabItem))completition;


@end
