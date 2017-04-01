//
//  MyOperation-1.m
//  FirstTest
//
//  Created by xia  on 2017/3/27.
//  Copyright © 2017年 xia . All rights reserved.
//

#import "MyOperation-1.h"

@implementation MyOperation_1
-(void)main{
    
    NSLog(@"aaaaaaaa11111111");
    NSLog(@"%@",[NSThread currentThread]);
    [NSThread sleepForTimeInterval:1.0f];
}
-(BOOL)isConcurrent{
    return YES;
}
@end
