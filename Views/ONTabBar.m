//
//  ONTabBar.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/12.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "ONTabBar.h"

@interface ONTabBar(){
    
    NSUInteger _activeTabIndex;
    NSUInteger _currentTabItemWidth;
}

@end

static float qmbMaxTabWidth = 320.0f;
static float qmbMinTabWidth = 150.0f;
static float highlightBarHeight = 5.0f;

@implementation ONTabBar


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        
        _items = [NSMutableArray array];
        _stackedTabOffset = 2.0;
        _activeTabIndex = 0;
        
    //    currentTabItemWidth = qmbMaxTabWidth;
        
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        [self setAlwaysBounceHorizontal:YES];
        [self setClipsToBounds:NO];
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) addTabItem:(ONTabView * )item{
    
    ONTabView *tabItem = [[ONTabView alloc] initWithFrame:CGRectMake([_items count] * _currentTabItemWidth, 0, 0, self.frame.size.height-highlightBarHeight)];
  //  [tabItem setAppearance:self.appearance];
    
    tabItem.titleLabel.text = NSLocalizedString(@"New tab", @"QMBTabBar New Tab Title");
  //  [tabItem setDelegate:self];
    
    /*
    if(completition != nil) {
        completition(tabItem);
    }
     */
    
    [_items addObject:tabItem];
    
    [self addSubview:tabItem];
    
    
}


- (void) addTabItemWithCompletition:(void (^)(ONTabView *tabItem))completition
{
    
    
    ONTabView *tabItem = [[ONTabView alloc] initWithFrame:CGRectMake([_items count] * _currentTabItemWidth, 0, 0, self.frame.size.height-highlightBarHeight)];
  //  [tabItem setAppearance:self.appearance];
    
    tabItem.titleLabel.text = NSLocalizedString(@"New tab", @"QMBTabBar New Tab Title");
  //  [tabItem setDelegate:self];
    
    if(completition != nil) {
        completition(tabItem);
    }
    
    [_items addObject:tabItem];
    
    [self addSubview:tabItem];
    
    
    /*
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self rearrangeTabs];
                     }
                     completion:^(BOOL finished){
                         
                     }];
     */
    
}


@end
