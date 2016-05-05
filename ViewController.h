//
//  ViewController.h
//  RoundedAnimation
//
//  Created by Fabio Yudi Takahara on 12/08/15.
//  Copyright (c) 2015 Nutrisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *appleImage;
@property (weak, nonatomic) IBOutlet UIImageView *heartImage;
@property (weak, nonatomic) IBOutlet UIImageView *imcImage;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *imcLabel;
@property (weak, nonatomic) IBOutlet UILabel *caloryLabel;
@property (weak, nonatomic) IBOutlet UILabel *waterLabel;

@property (weak, nonatomic) IBOutlet UILabel *imcValue;
@property (weak, nonatomic) IBOutlet UILabel *caloryValue;
@property (weak, nonatomic) IBOutlet UILabel *waterValue;

@property (weak, nonatomic) IBOutlet UILabel *start;



@end

