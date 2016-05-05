//
//  ViewController.m
//  RoundedAnimation
//
//  Created by Fabio Yudi Takahara on 12/08/15.
//  Copyright (c) 2015 Nutrisoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)startAnimationWithImage:(UIImageView*)image {
    
    [UIView animateWithDuration:0.3 animations:^{
        image.alpha = 1;
        image.transform = CGAffineTransformMakeScale(1.5, 1.5);
        _imcLabel.alpha = 1;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            image.transform = CGAffineTransformIdentity;
        }completion:^(BOOL finished) {
            [self startSecondAnimationWithImage:_appleImage];
        }];
    }];
}

- (void)startSecondAnimationWithImage:(UIImageView*)image {
    
    [UIView animateWithDuration:0.3 animations:^{
        image.alpha = 1;
        image.transform = CGAffineTransformMakeScale(1.5, 1.5);
        _caloryLabel.alpha = 1;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            image.transform = CGAffineTransformIdentity;
        }completion:^(BOOL finished) {
            [self startThirdAnimationWithImage:_heartImage];
        }];
    }];
}

- (void)startThirdAnimationWithImage:(UIImageView*)image {
    
    [UIView animateWithDuration:0.3 animations:^{
        image.alpha = 1;
        image.transform = CGAffineTransformMakeScale(1.5, 1.5);
        _waterLabel.alpha = 1;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            image.transform = CGAffineTransformIdentity;
        }completion:^(BOOL finished) {
            
            [self displayValueLabels];
        }];
    }];
}

- (void)displayValueLabels {
    
    [UIView animateWithDuration:0.4 animations:^{
        
        _imcValue.alpha = 1;
        _caloryValue.alpha = 1;
        _waterValue.alpha = 1;
        
        _imcValue.frame = CGRectMake(_imcValue.frame.origin.x + 10, _imcValue.frame.origin.y, _imcValue.frame.size.width, _imcValue.frame.size.height);
        
        _caloryValue.frame = CGRectMake(_caloryValue.frame.origin.x, _caloryValue.frame.origin.y - 10, _caloryValue.frame.size.width, _caloryValue.frame.size.height);
        
        _waterValue.frame = CGRectMake(_waterValue.frame.origin.x - 10, _waterValue.frame.origin.y, _waterValue.frame.size.width, _waterValue.frame.size.height);
        
    } completion:^(BOOL finished) {
        [self displayStart];
    }];
}

- (void)displayStart {
    
    [UIView animateWithDuration:0.6 animations:^{
        _start.frame = CGRectMake(20, 510, 284, 40);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imcImage.alpha = 0;
    _appleImage.alpha = 0;
    _heartImage.alpha = 0;
    
    _resultLabel.alpha = 0;
    _dateLabel.alpha = 0;
    
    _imcLabel.alpha = 0;
    _caloryLabel.alpha = 0;
    _waterLabel.alpha = 0;
    
    _imcValue.alpha = 0;
    _caloryValue.alpha = 0;
    _waterValue.alpha = 0;
    
    _start.layer.cornerRadius = 4;
    _start.layer.borderWidth = 1;
    _start.layer.borderColor = [UIColor colorWithWhite:0.4 alpha:1].CGColor;
    
    
    [UIView animateWithDuration:0.6 animations:^{
        
        _resultLabel.alpha = 1;
        _resultLabel.frame = CGRectMake(_resultLabel.frame.origin.x + 10, _resultLabel.frame.origin.y, _resultLabel.frame.size.width, _resultLabel.frame.size.height);
        
        _dateLabel.alpha = 1;
        _dateLabel.frame = CGRectMake(_dateLabel.frame.origin.x - 10, _dateLabel.frame.origin.y, _dateLabel.frame.size.width, _dateLabel.frame.size.height);
        
    } completion:^(BOOL finished) {
        [self startAnimationWithImage:_imcImage];
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //FirstAnimation
    
    /*
     UIView *redLineView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, 2, 185)];
    redLineView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redLineView];
    
    UIView *whiteLineView = [[UIView alloc]initWithFrame:redLineView.frame];
    whiteLineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteLineView];

    [UIView animateWithDuration:0.6 animations:^{
        
        whiteLineView.frame = CGRectMake(self.view.frame.size.width/2, 185, 2, 0);
        
    } completion:^(BOOL finished) {
        
        whiteLineView.frame = CGRectMake(self.view.frame.size.width/2, 0, 2, 0);
        
        [UIView animateWithDuration:1.1 animations:^{
            whiteLineView.frame = CGRectMake(self.view.frame.size.width/2, 0, 2, 185);
        }];

        [self drawCircle];
        
    }];
     */
}

- (void)drawCircle
{
    int radius = 100;
    int strokeWidth = 2;
    CGColorRef color = [UIColor redColor].CGColor;
    int timeInSeconds = 1.2;
    
    CGFloat startAngle = 0;
    CGFloat endAngle = 1;
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    
    circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius) cornerRadius:radius].CGPath;
    
    circle.position = CGPointMake(CGRectGetMidX(self.view.frame)-radius, CGRectGetMidY(self.view.frame)-radius);
    
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = color;
    circle.lineWidth = strokeWidth;
    
    [self.view.layer addSublayer:circle];
    
    // Change the model layer's property first.
    circle.strokeEnd = endAngle;
    
    // Then apply the animation.
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration            = timeInSeconds;
    drawAnimation.fromValue = [NSNumber numberWithFloat:startAngle];
    drawAnimation.toValue   = [NSNumber numberWithFloat:endAngle];
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
    //kCAMediaTimingFunctionEaseInEaseOut
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
