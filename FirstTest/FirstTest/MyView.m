//
//  SelfView.m
//  FirstTest
//
//  Created by xia  on 2017/3/14.
//  Copyright © 2017年 xia . All rights reserved.
//

#import "MyView.h"
#import "UIView+MJView.h"

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton * button = [[UIButton alloc]init];
        button.backgroundColor  = [UIColor redColor];
        button.frame = CGRectMake(0, 100, 320, 100);
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        self.myButton = button;
        [self addSubview:button];
    }
    return self;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return self;
}
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return YES;
}

-(void)action:(UIButton*)sender{
    [UIView animateWithDuration:2 animations:^{
        self.frame = CGRectMake(0, self.frame.origin.y+50,  self.bounds.size.width, 300);
    }];
    [self.delegate viewButonClick:self];
}
-(void)setNeedsLayout{
    [super setNeedsLayout];
    NSLog(@"heeloMyView");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
