//
//  testViewCtl.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/11.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "testViewCtl.h"
#import "Views/ONTabView.h"

@interface testViewCtl ()

@end

@implementation testViewCtl



- (QMBTabsAppearance *)getDefaultAppearance
{
    QMBTabsAppearance *appearance = [super getDefaultAppearance];
    
    // Tabs
    
    [appearance setTabBackgroundColorHighlighted:[UIColor colorWithRed:242.0f/255.0f green:140.0f/255.0f blue:19.0f/255.0f alpha:1.0f]];
  //  [appearance setTabBackgroundColorEnabled:[UIColor redColor]];
    
    [appearance setTabBarHighlightColor:[UIColor colorWithRed:242.0f/255.0f green:140.0f/255.0f blue:19.0f/255.0f alpha:1.0f]];
    [appearance setTabBarStrokeHighlightColor:[UIColor colorWithRed:142.0f/255.0f green:90.0f/255.0f blue:19.0f/255.0f alpha:1.0f]];
    
    [appearance setTabDefaultIconHighlightedImage:nil];
    [appearance setTabDefaultIconImage:nil];
    
    [appearance setTabLabelColorHighlighted:[UIColor whiteColor]];
    [appearance setTabLabelColorEnabled:[UIColor blackColor]];
    [appearance setTabLabelFontHighlighted:[UIFont fontWithName:@"Georgia-Italic" size:16.0]];

    
    return appearance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    ONTabView * oTabView = [[ONTabView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    oTabView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:oTabView];
    
    UIViewController * newViewCtl = [[UIViewController alloc]init];
    [self addViewController:newViewCtl withCompletion:^(ONTabView *tabItem) {
        tabItem.titleLabel.text = [NSString stringWithFormat:@"Hello I'm a Tab! %d" , 1];
        
    }];
     */
    
    self.delegate = self;
    
    for (int i = 0; i<3; i++) {
        UIViewController *viewController = [[UIViewController alloc]init];
        [self addViewController:viewController withCompletion:^(QMBTab *tabItem) {
            tabItem.titleLabel.text = [NSString stringWithFormat:@"%d月", i];
           
        }];
    }
    /*
    UIViewController *viewController = [[UIViewController alloc]init];
    [self addViewController:viewController withCompletion:^(QMBTab *tabItem) {
        tabItem.titleLabel.text = @"+";
        tabItem.highlightColor = [UIColor blueColor];
        tabItem.normalColor    = [UIColor redColor];
        
    }];
    */
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)tabViewController:(QMBTabViewController *)tabViewController didSelectViewController:(UIViewController *)viewController
{
 //   NSLog(@"Tab Changed to %d", [tabViewController indexForViewController:viewController]);
    NSUInteger tabIndex = [tabViewController indexForViewController:viewController];
    NSLog(@"Tab Changed to %lu", (unsigned long)tabIndex);
 //   QMBTab *tab = (QMBTab*)self.tabBar.items[tabIndex];
    
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
