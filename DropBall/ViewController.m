//
//  ViewController.m
//  DropBall
//
//  Created by Nguyen Minh Khue on 7/25/15.
//  Copyright (c) 2015 Nguyen Minh Khue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat ballRadius;
    CGFloat x,y,velocityY,accellerateX,accelerateY,maxHeight;
    CGFloat StatusBarHeight;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    StatusBarHeight = 20;
    
    [self drawGround];

    [self addBall];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
    
}

- (void) addBall{
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football.png"]];
    ballRadius = 57.0;
    x = mainViewSize.width * 0.5; //giua man hinh
    y= ballRadius + StatusBarHeight; //+20 de ben duoi Status Bar

    velocityY = 0.0;
    accelerateY = 8.0;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    maxHeight = mainViewSize.height - ballRadius - statusNavigationBarHeight - StatusBarHeight + 15;
    //- 10 khoang cach mat san co
    
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}

- (void) dropBall{
    velocityY += accelerateY;
    y+=velocityY;
    if (y>maxHeight)
    {
        velocityY =-velocityY * 0.98; //damper: he so tieu hao dong nang
        y=maxHeight;
    }
    ball.center=CGPointMake(x,y);
    
}

- (void)drawGround{
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football ground.png"]];
    
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFit;
    
    self.edgesForExtendedLayout = UIRectEdgeNone; //toa do bat dau tu ben duoi NavigationBar
    
    [self.view addSubview:background];
    
}

@end
