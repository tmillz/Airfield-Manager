//
//  CalcViewControllerAAppch.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "CalcViewControllerAAppch.h"

@interface CalcViewControllerAAppch ()

@end

@implementation CalcViewControllerAAppch

@synthesize editObjectHeight;
@synthesize editDistanceFromThreshold;
@synthesize distanceFromThreshold;
@synthesize objectHeight;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    [self.parentViewController.navigationItem setTitle:@"Class A Approach Surface"];
    
}

- (IBAction) calculateDistance {
    
    NSDecimalNumber *fifty = [NSDecimalNumber decimalNumberWithString:@"50"];
    NSDecimalNumber *twohundred = [NSDecimalNumber decimalNumberWithString:@"200"];
    
    if (self.editObjectHeight.text.length > 0 ) {
        
        NSDecimalNumber *oh = [NSDecimalNumber decimalNumberWithString:self.editObjectHeight.text];
        NSDecimalNumber *xfifty = [oh decimalNumberByMultiplyingBy:fifty];
        NSDecimalNumber *plustwohundred = [xfifty decimalNumberByAdding:twohundred];
        
        [distanceFromThreshold setText:[NSString stringWithFormat:@"%@", plustwohundred.stringValue]];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You must enter an object height" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (IBAction) calculateObjectHeight {
    
    NSDecimalNumber *fifty = [NSDecimalNumber decimalNumberWithString:@"50"];
    NSDecimalNumber *twohundred = [NSDecimalNumber decimalNumberWithString:@"200"];
    
    if (self.editDistanceFromThreshold.text.length > 0 ) {
        
        NSDecimalNumber *distance = [NSDecimalNumber decimalNumberWithString:self.editDistanceFromThreshold.text];
        NSDecimalNumber *minustwohundred = [distance decimalNumberBySubtracting:twohundred];
        NSDecimalNumber *divfifty = [minustwohundred decimalNumberByDividingBy:fifty];
        
        [objectHeight setText:[NSString stringWithFormat:@"%@", divfifty.stringValue]];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You must enter the distance from the threshold" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (IBAction) reset {
    [objectHeight setText:[NSString stringWithFormat:@""]];
    [distanceFromThreshold setText: [NSString stringWithFormat:@""]];
    [editDistanceFromThreshold setText: [NSString stringWithFormat:@""]];
    [editObjectHeight setText: [NSString stringWithFormat: @""]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
@end
