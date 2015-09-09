//
//  ViewController.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/3.
//  Copyright (c) 2015年 northtower. All rights reserved.
//

#import "startPageViewCtl.h"
#import "Controller/LoginAndRegister/LoginViewCtl.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface startPageViewCtl ()<UIScrollViewDelegate>{
    
    UIPageControl *_pageControl;
    NSInteger   _nsICurrentPage;
    
}

@property (strong, nonatomic) IBOutlet UIScrollView *StartPageScroll;
@property (strong, nonatomic) IBOutlet UIImageView *HeadImageView;

@end


@implementation startPageViewCtl


-(void) addPageController{
    
    _pageControl=[[UIPageControl alloc]init];
    //注意此方法可以根据页数返回UIPageControl合适的大小
    CGSize size= [_pageControl sizeForNumberOfPages:3];
    _pageControl.bounds=CGRectMake(0, 0, size.width, size.height);
 //   _pageControl.center=CGPointMake(160, 500);
    _pageControl.center=CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 50);

    _pageControl.pageIndicatorTintColor=[UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    
    //设置当前页颜色
    _pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    //设置总页数
    _pageControl.numberOfPages=3;
    _nsICurrentPage = 0;
    
    [self.view addSubview:_pageControl];
    
    
}

- (void) addCustomButton{
    
    
}
//overstudy
-(void)addScrollView{
    
    CGSize oSize = [UIScreen mainScreen].applicationFrame.size;
    oSize.height -= 80;
//    oSize.width  += 8;
    
    _StartPageScroll.delegate = self;
    _StartPageScroll.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _StartPageScroll.contentSize = CGSizeMake(3 * oSize.width,  oSize.height);
    [_StartPageScroll setContentOffset:CGPointMake(0, 0) animated:NO];
    _StartPageScroll.showsHorizontalScrollIndicator=NO;
    _StartPageScroll.pagingEnabled=YES;
    
    UIImageView * oImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, oSize.width, oSize.height)];
    oImage.contentMode=UIViewContentModeScaleAspectFill;
    oImage.image = [UIImage imageNamed:@"061"];
     [_StartPageScroll addSubview:oImage];
    
    oImage = [[UIImageView alloc]initWithFrame:CGRectMake(oSize.width, 0, oSize.width, oSize.height)];
    oImage.contentMode=UIViewContentModeScaleAspectFill;
    oImage.image = [UIImage imageNamed:@"062"];
    [_StartPageScroll addSubview:oImage];
    
    oImage = [[UIImageView alloc]initWithFrame:CGRectMake(oSize.width * 2, 0, oSize.width, oSize.height)];
    oImage.contentMode=UIViewContentModeScaleAspectFill;
    oImage.image = [UIImage imageNamed:@"063"];
    [_StartPageScroll addSubview:oImage];
    
    //注册与登陆按钮  注意在多尺寸设备中，按钮的位置要与图标一致
    UIButton *bLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   
    NSLog(@"%f" , SCREEN_HEIGHT / 1.96);
    bLoginBtn.frame = CGRectMake(oSize.width * 2,  SCREEN_HEIGHT / 1.96, SCREEN_WIDTH, 50);
    bLoginBtn.backgroundColor = [UIColor clearColor];
    //   nameBtn.backgroundColor = [UIColor clearColor];
    [bLoginBtn addTarget:self action:@selector(userLoginView) forControlEvents:UIControlEventTouchUpInside];
    [_StartPageScroll addSubview:bLoginBtn];
    
    UIButton *bRegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bRegisterBtn.frame = CGRectMake(oSize.width * 2, SCREEN_HEIGHT / 1.96 + 50, SCREEN_WIDTH, 50);
    bRegisterBtn.backgroundColor = [UIColor clearColor];
    //   nameBtn.backgroundColor = [UIColor clearColor];
    [bRegisterBtn addTarget:self action:@selector(userRegisterView) forControlEvents:UIControlEventTouchUpInside];
    [_StartPageScroll addSubview:bRegisterBtn];
    
    
    /*
    UIView * oView = [[UIView alloc]initWithFrame:CGRectMake(oSize.width * 2, 0, oSize.width, oSize.height)];
    oView.contentMode = UIViewContentModeScaleAspectFill;
    oView.backgroundColor = [UIColor colorWithRed:166/255.0 green:16/255.0 blue:224/255.0 alpha:1];
 
    //添加字符信息
    UILabel *pageLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 300, 240, 80)];
    pageLabel.text = @"记下笔记，更新购物单并检查待办事项";
    pageLabel.textColor = [UIColor whiteColor];
    pageLabel.font = [UIFont fontWithName:@"Georgia-Italic" size:20.0];
    pageLabel.textAlignment = NSTextAlignmentCenter;
    [oView addSubview:pageLabel];
    
    [_StartPageScroll addSubview:oView];
    
    */
}
-(void) addButtonClicked{
    
   
}

- (void) userLoginView{
    
    
    UIStoryboard * storyboard = self.storyboard;
    LoginViewCtl  * svc = [storyboard instantiateViewControllerWithIdentifier:@"SB_LoginView"];
    
    [svc setModalTransitionStyle:2];
    [svc setModalPresentationStyle:UIModalPresentationCurrentContext];
    
    [self presentViewController:svc animated:YES completion:nil];
     
    
//    LoginViewCtl *jzSpeechVC = [[LoginViewCtl alloc] init];
//    [self.navigationController pushViewController:jzSpeechVC animated:YES];
    
}

- (void) userRegisterView{
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addScrollView];
    [self addPageController];
    [self addCustomButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 滚动停止事件
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    
    CGPoint offset=[scrollView contentOffset];
    NSLog(@"scrollViewDidEndDecelerating : X=%f" , offset.x);
    
    if(offset.x > _nsICurrentPage * SCREEN_WIDTH){
        //向右
        _nsICurrentPage += 1;
    }
    else
        _nsICurrentPage -= 1;
    
    //移动到中间
 //   [_StartPageScroll setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    //设置分页
    _pageControl.currentPage=_nsICurrentPage;
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
 //   NSLog(@"scrollViewDidScroll");
}

@end
