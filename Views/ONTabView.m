//
//  ONTabView.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/11.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "ONTabView.h"

@implementation ONTabView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setInnerBackgroundColor:(UIColor *)color
{
    if ([_innerBackgroundColor isEqual:color]) {
        return;
    }
    _innerBackgroundColor = color;
    [self setNeedsDisplay];
}

- (void)setForegroundColor:(UIColor *)color
{
    if ([_foregroundColor isEqual:color]) {
        return;
    }
    _foregroundColor = color;
    [self setNeedsDisplay];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _orgFrame = frame;
        
        [self setOpaque:NO];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
        [tapGesture setNumberOfTapsRequired:1];
        [tapGesture setNumberOfTouchesRequired:1];
        [self addGestureRecognizer:tapGesture];
        
        // title label
        if (!self.titleLabel){
            UILabel *titleLabel = [[UILabel alloc] init];
            [titleLabel setText:NSLocalizedString(@"New tab is what it is", nil)];
            [titleLabel setBackgroundColor:[UIColor clearColor]];
            self.titleLabel = titleLabel;
            [self addSubview:self.titleLabel];
        }
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    
    CGMutablePathRef path;
    CGPoint point;
    
    CGFloat qmbTabSideOffset = 0;
    CGFloat qmbTabCurvature = 30;
    
    CGFloat qmbTabWidth = 120 ;
    CGFloat qmbTabHeight = 40;
    
    CGFloat startY = 50;
    
    
    // Shadow
    /**
     *  使用Quartz时涉及到一个图形上下文，其中图形上下文中包含一个保存过的图形状态堆栈。在Quartz创建图形上下文时，该堆栈是空的。CGContextSaveGState函数的作用是将当前图形状态推入堆栈。之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。在修改完成后，您可以通过CGContextRestoreGState函数把堆栈顶部的状态弹出，返回到之前的图形状态。这种推入和弹出的方式是回到之前图形状态的快速方法，避免逐个撤消所有的状态修改；这也是将某些状态（比如裁剪路径）恢复到原有设置的唯一方式。
     */
    
    //取得图形上下文对象
    CGContextRef context = UIGraphicsGetCurrentContext();
    //保存初始状态
    CGContextSaveGState(context);
    
    CGColorRef color = [UIColor grayColor].CGColor;
    //颜色转化，由于Quartz 2D跨平台，所以其中不能使用UIKit中的对象，但是UIkit提供了转化方法
    CGContextSetShadowWithColor(context,CGSizeMake(0 ,0 ),3,color);
    CGContextBeginTransparencyLayer(context, NULL);
    
    //warning 1
    //设置填充色
    CGContextSetRGBFillColor(context, 109/255.0, 35/255.0, 105.0/255.0, 1);
    
    //创建路径对象
    path = CGPathCreateMutable();
    point = CGPointMake(0.0f, startY);
    CGPathMoveToPoint(path, NULL, point.x, point.y);
    
    
    // offset left
    CGPathAddLineToPoint(path, NULL, qmbTabSideOffset, startY);
    
    
    // left curve
    CGPathAddCurveToPoint(path, NULL,
                          qmbTabSideOffset + qmbTabCurvature / 2, startY,
                          qmbTabSideOffset + qmbTabCurvature / 2, startY - qmbTabHeight,
                          qmbTabSideOffset + qmbTabCurvature, startY - qmbTabHeight);
    
    // top line
    CGPathAddLineToPoint(path, NULL, qmbTabWidth - qmbTabSideOffset - qmbTabCurvature, startY - qmbTabHeight);
    
    // right curve
    CGPathAddCurveToPoint(path, NULL,
                          qmbTabWidth - qmbTabSideOffset - qmbTabCurvature / 2, startY - qmbTabHeight,
                          qmbTabWidth - qmbTabSideOffset - qmbTabCurvature / 2, startY,
                          qmbTabWidth - qmbTabSideOffset, startY);
    
    // offset right
    CGPathAddLineToPoint(path, NULL, qmbTabWidth, startY);
    
    
    CGPathCloseSubpath(path);
    //   [_innerBackgroundColor setFill];
    
    //添加路径到图形上下文
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGPathRelease(path);
    
    //将结合对象放入上下文
    CGContextEndTransparencyLayer(context);
    
    //恢复到初始状态
    CGContextRestoreGState(context);
}


#pragma mark - Gesture

- (void) didTap:(id)sender
{
    NSLog(@"didTap");

}
@end
