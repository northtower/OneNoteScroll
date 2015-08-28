//
//  docPreviewCtl.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/19.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "docPreviewCtl.h"

#import "DocContentModel.h"
#import "DocContentCell.h"
#import "publicSettings.h"



@interface docPreviewCtl (){
    
    //不同文件夹数据模拟
    NSMutableArray * _tablePage1;
    NSMutableArray * _tablePage2;
    NSMutableArray * _tablePage3;
}

@end

@implementation docPreviewCtl


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableContent];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if(_nsPage == 0)
        return _tablePage1.count;
    else if(_nsPage == 1)
        return _tablePage2.count;
    else
        return 0;
//    return 3;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 74;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"allcourseCell";
    DocContentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[DocContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        //下划线
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 73.5, screen_width - 15, 0.5)];
        lineView.backgroundColor = [UIColor brownColor];//separaterColor;
        [cell addSubview:lineView];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DocContentModel * item;
    if(_nsPage == 0)
        item = _tablePage1[indexPath.row];
    else if(_nsPage == 1)
        item = _tablePage2[indexPath.row];
    
    
    
    [cell putDocTitle:item.nsDocHead withContent:item.nsDocBody];
    return cell;

}


- (void) createTableContent{
    
    _tablePage1 = [[NSMutableArray alloc]initWithCapacity:3];
    [_tablePage1 addObject:[DocContentModel createDocHead:@"迈进数据化社会" withDocBody:@"贝尔曾经设想的社会：从产品生产经济渐变为服务性经济；专业与技术人员处于社会的主导地位；理论知识处于社会经济发展的中心地位；"]];
    
    [_tablePage1 addObject:[DocContentModel createDocHead:@"《Hallelujah》的故事" withDocBody:@"Hallelujah，哈利路亚，希伯来语，意为“赞美上帝”。德国作曲家亨德尔曾将“哈利路亚”这一主题用作于1742 年的清唱剧《弥赛亚》中第二幕终曲合唱，整曲洋溢着虔诚和赞美之情，表达了对万能上帝的无限歌颂。在现代西方音乐中，也不乏著名歌者以此为题。在众多或祈祷或赞颂的哈利路亚声中"]];
    
    [_tablePage1 addObject:[DocContentModel createDocHead:@"我是查理，我也是我自己" withDocBody:@"2015年，新年伊始。1月7日上午，巴黎，三名恐怖袭击者，带着AK47冲锋枪冲进《查理周刊》编辑部，打死十个平民两名巡警，其中包括杂志社主编、身为漫画家的副刊主编，另外两个漫画家，以及来开会的一名经济学家，另有多人受伤。第二天，一名女警察在地铁被枪击死亡。"]];
 
    
    _tablePage2 = [[NSMutableArray alloc]initWithCapacity:3];
    [_tablePage2 addObject:[DocContentModel createDocHead:@"《极简欧洲史》" withDocBody:@"中国文明灿烂发光与春秋战国时代，那是一个科技突破（铁工具）和知识大量释出的时代，本质上就是周朝诸侯国的一次“全球化”，其结果是秦始皇建立了统一帝国。欧洲的兴盛也是科技突破与知识大量释出（印刷术传入，助长宗教革命）的结果，赋予了帝国主义进行全球化的力量。"]];
    
    [_tablePage2 addObject:[DocContentModel createDocHead:@"从希腊说起，讲到日耳曼" withDocBody:@"Hallelujah，哈利路亚，希伯来语，意为“赞美上帝”。德国作曲家亨德尔曾将“哈利路亚”这一主题用作于1742 年的清唱剧《弥赛亚》中第二幕终曲合唱，整曲洋溢着虔诚和赞美之情，表达了对万能上帝的无限歌颂。在现代西方音乐中，也不乏著名歌者以此为题。在众多或祈祷或赞颂的哈利路亚声中"]];
    
    [_tablePage2 addObject:[DocContentModel createDocHead:@"从追杀到独尊" withDocBody:@"2015年，新年伊始。1月7日上午，巴黎，三名恐怖袭击者，带着AK47冲锋枪冲进《查理周刊》编辑部，打死十个平民两名巡警，其中包括杂志社主编、身为漫画家的副刊主编，另外两个漫画家，以及来开会的一名经济学家，另有多人受伤。第二天，一名女警察在地铁被枪击死亡。"]];
    
    _nsPage = 0;

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
