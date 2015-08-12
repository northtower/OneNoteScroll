//
//  LoginViewCtl.m
//  OneNoteScroll
//
//  Created by 北塔 on 15/8/11.
//  Copyright (c) 2015年 northtower. All rights reserved.
//


#import "LoginViewCtl.h"

@interface LoginViewCtl ()
@property (strong, nonatomic) IBOutlet UITextField *TFUserName;
@property (strong, nonatomic) IBOutlet UITextField *TFPassword;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BBCancelButton;


@end

@implementation LoginViewCtl

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(UIButton *)sender {
    
    
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
