//
//  docPreviewCtl.h
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/19.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  文档预览控制器，实现多标签切换时，文档预览界面得到正常响应
 */
@interface docPreviewCtl : UITableViewController

@property(nonatomic , assign) NSUInteger nsPage;
- (void) createTableContent;

@end
