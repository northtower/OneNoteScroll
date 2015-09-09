//
//  DocContentCell.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/19.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "DocContentCell.h"
#import "publicSettings.h"

@implementation DocContentCell{
    
    UILabel * _titleLabel;
    UILabel * _bodyLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, screen_width - 25, 20)];
 //   _titleLabel.font = [UIFont systemFontOfSize:15];
    [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [self addSubview:_titleLabel];
    
    _bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 22, screen_width - 25, 40)];
    _bodyLabel.font = [UIFont systemFontOfSize:15];
    //自动折行设置
    _bodyLabel.lineBreakMode = UILineBreakModeTailTruncation;
    _bodyLabel.numberOfLines = 2;
    
    [self addSubview:_bodyLabel];
    
    
    return self;
}

-(void) putDocTitle:(NSString *)nsTitle withContent:(NSString *)nsContent{
    
    _titleLabel.text = nsTitle;
    _bodyLabel.text = nsContent;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
