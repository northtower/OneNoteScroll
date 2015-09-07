//
//  DocContentModel.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/19.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "DocContentModel.h"

@implementation DocContentModel


- (DocContentModel *)initDocument:(NSString *)oHead WithBody:(NSString *) oBody{
    
    if (self=[super init]) {
        self.nsDocHead =oHead;
        self.nsDocBody=oBody;
    }
    return self;
}


+ (DocContentModel *)createDocHead:(NSString *)oHead withDocBody:(NSString *)oBody {
    
    DocContentModel * status = [[DocContentModel alloc]initDocument:oHead WithBody:oBody];
    return status;
}

@end