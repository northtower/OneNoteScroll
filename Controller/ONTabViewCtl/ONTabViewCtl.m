//
//  ONTabViewCtl.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/12.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "ONTabViewCtl.h"


@interface ONTabViewCtl ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation ONTabViewCtl

- (void)viewDidLoad {
    [super viewDidLoad];

    _viewControllers = [NSMutableArray array];
    
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    
    if (!_tabBarTopOffset){
        // set default offset to statusbar height
        _tabBarTopOffset = 20.0f;
    }
    
    [_tabBar setFrame:CGRectMake(0, _tabBarTopOffset,width, 44.0f)];
    
//    ONTabView * oTabView = [[ONTabView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    oTabView.backgroundColor=[UIColor whiteColor];
    
    
    
    UIView *tabBarContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0,width, _tabBar.frame.size.height + _tabBar.frame.origin.y)];
    [tabBarContainer setBackgroundColor:[UIColor whiteColor]];
    [tabBarContainer setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [tabBarContainer addSubview:_tabBar];
    
    [self.view addSubview:tabBarContainer];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _tabBar.frame.size.height+_tabBarTopOffset, width, height-_tabBar.frame.size.height)];
    [contentView setClipsToBounds:YES];
    [contentView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.view addSubview:contentView];
     _contentView = contentView;
    
   
    
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addViewController:(UIViewController *)controller withCompletion:(void (^)(ONTabView *))completition {
    
    if ([_viewControllers containsObject:controller])
        return;
    
    /*
    if ([self.delegate respondsToSelector:@selector(tabViewController:willAddViewController:)]){
        [self.delegate performSelector:@selector(tabViewController:willAddViewController:) withObject:self withObject:controller];
    }
     */
    
    [self addChildViewController:controller];
    [_viewControllers addObject:controller];
    
    
    [_tabBar addTabItemWithCompletition:completition];
    
    /*
    if([_viewControllers count] == 1){
        [self selectViewController:controller];
    }
    
    [controller didMoveToParentViewController:self];
    
    if ([self.delegate respondsToSelector:@selector(tabViewController:didAddViewController:)]){
        [self.delegate performSelector:@selector(tabViewController:didAddViewController:) withObject:self withObject:controller];
    }
     */
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
