//
//  DocContentCell.h
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/19.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DocContentModel.h"

@interface DocContentCell : UITableViewCell

@property(nonatomic , strong) DocContentModel * currentCell;

-(void) putDocTitle:(NSString *)nsTitle withContent:(NSString *)nsContent;

@end
