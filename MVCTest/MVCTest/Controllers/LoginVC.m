//
//  LoginVC.m
//  MVCTest
//
//  Created by XuBill on 16/9/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginVC.h"
#import "LoginView.h"
#import "LoginModel.h"
@interface LoginVC ()
{
    LoginModel *Lmodel;
}
@property (nonatomic,strong) LoginView *loginView;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initLoginModel];
    [self initLoginView];

}

- (void)initLoginModel{

    Lmodel = [LoginModel shareInstance];
    
}

- (void)initLoginView{

    [self.view addSubview:self.loginView];

}

- (LoginView*)loginView{

    if (!_loginView) {
        LoginView *loginV = [[[NSBundle mainBundle]loadNibNamed:@"LoginView" owner:nil options:nil]objectAtIndex:0];
        loginV.frame = CGRectMake(0, 0, 600, 400);
        loginV.center = self.view.center;
        _loginView = loginV;
        kWeakSelf(Lmodel);
        _loginView.loginBlock = ^(NSString *account,NSString *pwd){
            [weakLmodel loginStateWithAccount:account pwd:pwd success:^{
                NSLog(@"%s", "pass");
            } faile:^{
                NSLog(@"%s", "omg,try again");
            }];
        };

    }
    return _loginView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
