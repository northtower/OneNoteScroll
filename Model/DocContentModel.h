//
//  DocContentModel.h
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/19.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocContentModel : NSObject

#pragma mark - 属性
@property (nonatomic, strong) NSString   * nsDocHead;
@property (nonatomic, strong) NSString   * nsDocBody;


/**
 *  初始化微博数据
 *  @param createAt        创建日期
 *  @param source          来源
 *
 */
- (DocContentModel *)initDocument:(NSString *)oHead WithBody:(NSString *) oBody;


#pragma mark - 静态方法

/**
 *  初始化文档展示数据
 *
 *  @param createAt        创建日期
 *  @param source          来源
 *
 */
+ (DocContentModel *)createDocHead:(NSString *)oHead withDocBody:(NSString *)oBody ;

@end
