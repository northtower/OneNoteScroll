//
//  testViewCtl.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/11.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "oneNoteMainViewCtl.h"
#import "publicSettings.h"
#import "docPreviewCtl.h"


@interface oneNoteMainViewCtl (){
    
    QMBTabViewController * oTabViewCtl;
    
    //正文数据
    NSMutableArray *_dataSourceArray;
    
    docPreviewCtl * DocPreviewCtl;
    
}

@property (nonatomic, strong) UIView *contentView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation oneNoteMainViewCtl


- (void) initData{
    
    _dataSourceArray = [[NSMutableArray alloc] init];
    
}

- (void) initTableView{
    
    DocPreviewCtl = [[docPreviewCtl alloc]init];
    [DocPreviewCtl createTableContent];
    self.tableView.dataSource = DocPreviewCtl;
    self.tableView.delegate = DocPreviewCtl;
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}

- (QMBTabsAppearance *)getDefaultAppearance
{
    QMBTabsAppearance *appearance =  [[QMBTabsAppearance alloc] init];;
    
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

    self.delegate = self;
    
    
    for (int i = 0; i<3; i++) {
        UIViewController *viewController = [[UIViewController alloc]init];
        [self addViewController:viewController withCompletion:^(QMBTab *tabItem) {
            tabItem.titleLabel.text = [NSString stringWithFormat:@"%d月", i];
           
        }];
    }
     
    [self initTableView];
    
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
    DocPreviewCtl.nsPage = tabIndex;
    [self.tableView reloadData];
    
 //   QMBTab *tab = (QMBTab*)self.tabBar.items[tabIndex];
    
}



@end
