//
//  MyOperation-2.m
//  FirstTest
//
//  Created by xia  on 2017/3/27.
//  Copyright © 2017年 xia . All rights reserved.
//

#import "MyOperation-2.h"

@implementation MyOperation_2
-(void)main{
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        NSLog(@"bbbbbbbb22222222");
        NSLog(@"%@",[NSThread currentThread]);
    }];
    

}
-(BOOL)isConcurrent{
    return YES;
}
@end
