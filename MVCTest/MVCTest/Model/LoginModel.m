//
//  LoginModel.m
//  MVCTest
//
//  Created by XuBill on 16/9/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
+ (instancetype)shareInstance
{
    static LoginModel *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (void)loginStateWithAccount:(NSString*)account pwd:(NSString*)pwd success:(void(^)())LoginSuccess faile:(void(^)())faile{

    if ([account isEqualToString:@"22"]&&[pwd isEqualToString:@"xb"]) {
        NSLog(@"%@",@"ok");
        LoginSuccess();
    }else{
        NSLog(@"%@",@"faile");
        faile();
    }


}
@end
