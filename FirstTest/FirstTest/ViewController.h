//
//  ViewController.h
//  FirstTest
//
//  Created by xia  on 2017/3/10.
//  Copyright © 2017年 xia . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"
@interface ViewController : UIViewController<MyViewDelegate,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIBezierPath *pacmanOpenPath;
    UIBezierPath *pacmanClosedPath;
    CAShapeLayer * shapeLayer;
}
//@property(retain,nonatomic)UIBezierPath *pacmanOpenPath;
@end
@interface customCollectionViewLayout : UICollectionViewFlowLayout

@end
