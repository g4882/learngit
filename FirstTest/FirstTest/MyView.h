//
//  SelfView.h
//  FirstTest
//
//  Created by xia  on 2017/3/14.
//  Copyright © 2017年 xia . All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyView;
@protocol MyViewDelegate <NSObject>

-(void)viewButonClick:(MyView*)view;

@end
@interface MyView : UIView
@property(nonatomic,weak)id delegate;
@property(nonatomic,retain) UIButton * myButton;

@end
