//
//  ViewController.m
//  FirstTest
//
//  Created by xia  on 2017/3/10.
//  Copyright © 2017年 xia . All rights reserved.
//
#define M_PI  3.14
#define MAX(a,b)  ((a>b):a?b)
#define DEGREES_TO_RADIANS(d) (d * 3.14 / 180)
#import "ViewController.h"
#import "MyOperation-1.h"
#import "MyOperation-2.h"

@interface ViewController ()
@property(retain,nonatomic) UIView * myView;
@property(retain,nonatomic) NSMutableArray * imageArr;
@property(assign,nonatomic) int  number;
@property(copy,nonatomic)NSString * string;
@property(retain,nonatomic) UIScrollView * myScrollView;
@property(retain,nonatomic) UICollectionView * myCollectionView;
@property(retain,nonatomic) customCollectionViewLayout * customCollectionViewLayout;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:3];
//
    self.number = 2;
//    MyView * view = [[MyView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
//    self.myView = view;
//    view.delegate = self;
//    view.backgroundColor = [UIColor greenColor];
////    [self.view addSubview:view];
//    CGRect rect = self.view.bounds;
//    self.view.backgroundColor = [UIColor greenColor];
//     UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
//    iv.image  = [UIImage imageNamed:@"1.jpg"];
//    iv.contentMode = UIViewContentModeScaleAspectFit;
//   // [self.view addSubview: iv];
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(120, 120),NO,0);
////    [self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#>]
//    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 100, 100)];
//    [[UIColor whiteColor]set];
//    [path fill];
//    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(21 , 21, 98, 98)];
//    [path addClip];
//    [iv.image drawAtPoint:CGPointMake(-50, 0)];
//    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//    
////    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size,NO,0);
////    CGContextRef ctx =UIGraphicsGetCurrentContext();
////    [self.view.layer renderInContext:ctx];
////    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImageView * iv2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    iv2.image = newImage;
    //[self.view addSubview: iv2];
    
//    MyOperation_1 * opera1 = [[MyOperation_1 alloc]init];
//    [opera1 start];
//    MyOperation_2 * opera2 = [[MyOperation_2 alloc]init];
//    [opera2 start];
//    NSLog(@"hsohoi#########");
//    NSOperationQueue * myqueue = [[NSOperationQueue alloc]init];//创建子线程 并行执行
//    [myqueue addOperation:opera1];
//    [myqueue addOperation:opera2];
//    [self setLeftBarItems:@"aaa",@"bbb",@"ccc",nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self creatScollView];
    [self creatCollectionView];
//    UICollectionView
}
-(void)creatCollectionView{
    _customCollectionViewLayout = [[customCollectionViewLayout alloc]init];
    UICollectionView * collectView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:_customCollectionViewLayout];
    collectView.dataSource = self;
    collectView.delegate = self;
    self.myCollectionView = collectView;
    [self.view addSubview:collectView];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UICollectionViewCell alloc]initWithFrame:collectionView.bounds];
    }
    UIImageView * iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"01.jpg"]];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    iv.frame =CGRectMake(20,20,CGRectGetWidth(self.view.bounds)-40,CGRectGetHeight(self.view.bounds)-40);
    [cell.contentView addSubview:iv];
    
    return cell;
}
-(void)creatScollView{
    
    NSMutableArray * array  = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"], nil];
    self.imageArr = array;
    
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    _myScrollView = scrollView;
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.delegate = self;
    scrollView.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 200);
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(_imageArr.count*CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.myScrollView.bounds));
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    //    scrollView.
    UIView * myView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, _imageArr.count*CGRectGetWidth(self.view.bounds), 80)];
    self.myView = myView;
    [self.imageArr enumerateObjectsUsingBlock:^(UIImage * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView * iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"01.jpg"]];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        iv.frame =CGRectMake(idx*CGRectGetWidth(self.myScrollView.bounds), 0, CGRectGetWidth(self.myScrollView.bounds), CGRectGetHeight(self.myScrollView.bounds));
        [self.myScrollView addSubview:iv];
        
        
        UIImageView * iv_1 = [[UIImageView alloc]initWithImage:obj];
        iv_1.contentMode = UIViewContentModeScaleAspectFit;
        iv_1.frame =CGRectMake(idx*CGRectGetWidth(self.myScrollView.bounds)+self.myScrollView.bounds.size.width/2-40, 0, 80, 80);
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80),NO,[UIScreen mainScreen].scale);
        UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 80, 80)];
        [[UIColor whiteColor]set];
        [path fill];
        CGContextRef  context = UIGraphicsGetCurrentContext();
        
//        CGContextAddPath(context, [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1, 1, 78, 78)].CGPath);
        path =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(1, 1, 78, 78)];
        [path addClip];
//        CGContextClip(context);
        [obj drawInRect:CGRectMake(1, 1, 78, 78)];
        UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//        [[[[UIApplication sharedApplication]delegate]window].layer renderInContext:context];
        
        [iv_1 setImage:newImage];
        
        UIGraphicsEndImageContext();
        [self.myView addSubview:iv_1];
        
    }];
    self.myView.userInteractionEnabled =NO;
    [self.view addSubview:_myScrollView];
    [self.view addSubview:myView];
    [self.view bringSubviewToFront:myView];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   __block CGRect IVFrame = self.myView.frame;
    [UIView animateWithDuration:0.2 animations:^{
        IVFrame.origin.x = -scrollView.contentOffset.x;
        [self.myView setFrame:IVFrame];
    }];
    
    
}
- (void)setLeftBarItems:(NSString*)leftNames,...
{
    NSMutableArray *leftItemStringgArray = [NSMutableArray new];
    va_list args;
    va_start(args, leftNames);
    
    if (leftNames)
    {
        [leftItemStringgArray addObject:leftNames];
        
        NSString *otherString;
        while ((otherString = va_arg(args, NSString *)))
        {
            //依次取得所有参数
            if (!otherString.length) {
                continue;
            }
            [leftItemStringgArray addObject:otherString];
        }
    }
    va_end(args);
}
-(void)run{
    NSLog(@"aaaaaaa");
}
//+(void)uploadImageWithUrl:(NSString *)strUrl dataParams:(NSMutableDictionary *)dataParams imageParams:(NSMutableDictionary *) imageParams Success:(void(^)(NSDictionary *resultDic)) success Failed:(void(^)(NSError *error))fail {
//    NSArray *keys = [imageParams allKeys];
//    UIImage * image = [imageParams objectForKey:[keys firstObject]];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    //对SSL做处理，防止上传失败
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];    securityPolicy.allowInvalidCertificates = YES;
//    securityPolicy.validatesDomainName = NO;
//    manager.securityPolicy = securityPolicy;
//    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    manager.requestSerializer.timeoutInterval = 120;
//    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//    [manager POST:strUrl parameters:dataParams constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.5) name:[keys firstObject] fileName:[NSString stringWithFormat:@"%@.jpeg",[keys firstObject]] mimeType:@"image/jpeg"];    }
//          success:^(AFHTTPRequestOperation operation, id responseObject){
//              if (success){            success(responseObject);
//              }
//          }
//          failure:^(AFHTTPRequestOperation operation, NSError *error) {
//              if (fail) {            fail(error);
//              }
//          }];
//}

/*
- (void)viewDidLoad {
 
 
    [super viewDidLoad];
    
    
    
    
    
    //self.title = [[self class] displayName];
    
    
    
    
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    
    
    
    CGFloat radius = 30.0f;
    
    
    CGFloat diameter = radius * 2;
    
    
    CGPoint arcCenter = CGPointMake(radius, radius);
    
    
    
    
    
    // Create a UIBezierPath for Pacman's open state
    
    /*
    pacmanOpenPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                       
                       
                                                     radius:radius
                       
                       
                                                 startAngle:DEGREES_TO_RADIANS(35)
                       
                       
                                                   endAngle:DEGREES_TO_RADIANS(315)
                       
                       
                                                  clockwise:YES];
    
    
    
    
    
    
    
    
    
    
    [pacmanOpenPath addLineToPoint:arcCenter];
    
    
    [pacmanOpenPath closePath];
    
 
    pacmanOpenPath = [UIBezierPath bezierPathWithRect:CGRectMake(-20, 0, 90, 2)];
    
    //[pacmanOpenPath moveToPoint:CGPointMake(-20, 100)];
    //[pacmanOpenPath addLineToPoint:CGPointMake(100, 100)];
    pacmanOpenPath.lineWidth = 1.0f;
    [[UIColor yellowColor]set];
    [pacmanOpenPath stroke];
    
    
    
    
    // Create a UIBezierPath for Pacman's close state
    
    /*
    pacmanClosedPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                        
                         
                                                       radius:radius
                         
                         
                                                   startAngle:DEGREES_TO_RADIANS(1)
                         
                         
                                                     endAngle:DEGREES_TO_RADIANS(359)
                         
                         
                                                    clockwise:YES];
 
    
    pacmanClosedPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 50, 2)];
    pacmanClosedPath.lineWidth = 1.0f;
    //[pacmanClosedPath moveToPoint:CGPointMake(-20, 100)];
    //[pacmanOpenPath addLineToPoint:CGPointMake(50, 100)];
    [[UIColor yellowColor]set];
    [pacmanClosedPath stroke];
  //  [pacmanClosedPath addLineToPoint:arcCenter];
    
    
    //[pacmanClosedPath closePath];
    
    
    
    
    
    // Create a CAShapeLayer for Pacman, fill with yellow
    
    
    shapeLayer = [CAShapeLayer layer];
    
    
    shapeLayer.fillColor = [UIColor yellowColor].CGColor;
    
    
    shapeLayer.path = pacmanClosedPath.CGPath;
    
    
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    
    shapeLayer.lineWidth = 1.0f;
    
    
    shapeLayer.bounds = CGRectMake(0, 0, diameter, diameter);
    
    
    shapeLayer.position = CGPointMake(-40, -100);
    
    
    [self.view.layer addSublayer:shapeLayer];
    
    
    
    
    
    SEL startSelector = @selector(startAnimation);
    
    
    UIGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:startSelector];
    
    
    [self.view addGestureRecognizer:recognizer];
    
    
    
    
    
    
    // start animation after short delay
    
    
    [self performSelector:startSelector withObject:nil afterDelay:1.0];
    
    
}






- (void)startAnimation {
    
    
    
    
    
    
    // Create CHOMP CHOMP animation
    
    CABasicAnimation *chompAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    
    chompAnimation.duration = 0.25;
    
    
    
    
    
    chompAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    
    chompAnimation.repeatCount = HUGE_VALF;
    
    
    chompAnimation.autoreverses = YES;
    
    
    // Animate between the two path values
    
    
    chompAnimation.fromValue = (id)pacmanClosedPath.CGPath;
    
    
    chompAnimation.toValue = (id)pacmanOpenPath.CGPath;
    
    
    
    
    
    [shapeLayer addAnimation:chompAnimation forKey:@"chompAnimation"];
    
    
    
    
    
    // Create digital '2'-shaped path
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    
    [path moveToPoint:CGPointMake(-40, 100)];
    
    
    [path addLineToPoint:CGPointMake(360, 100)];
    
    
    [path addLineToPoint:CGPointMake(360, 200)];
    
    
    [path addLineToPoint:CGPointMake(-40, 200)];
    
    
    [path addLineToPoint:CGPointMake(-40, 300)];
    
    
    [path addLineToPoint:CGPointMake(360, 300)];
    
    
    
    
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    
    moveAnimation.path = path.CGPath;
    
    
    moveAnimation.duration = 8.0f;
    
    
    // Setting the rotation mode ensures Pacman's mouth is always forward.  This is a very convenient CA feature.
    
    
    moveAnimation.rotationMode = kCAAnimationRotateAuto;
    
    
    [shapeLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
}
*/
-(void)creatScrollViewWithImageArr:(NSArray*)imageArr{
    
//    UIImageView * iv = [[UIImageView alloc]init];
}
-(void)viewButonClick:(UIView *)view{
    NSString * className = [NSString stringWithFormat:@"%@",[view class]];
    NSLog(@"%@",className);
    [self.myView setNeedsLayout];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

@implementation collectionViewLayout

-(instancetype)init{
    self = [super init];
    if (self) {
        self.
    }
    
}

@end
