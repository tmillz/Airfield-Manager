//
//  DEMOCalcViewController.m
//  Airfield-Manager
//
//  Created by Terry on 8/13/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "CalcViewController.h"

@interface CalcViewController ()

@end

@implementation CalcViewController

@synthesize editObjectHeight;
@synthesize editDistanceFromCenterline;
@synthesize objectHeight;
@synthesize distanceFromCenterline;

- (void)viewDidAppear:(BOOL)animated {
    [self.parentViewController.navigationItem setTitle:@"Class B Trans Surface"];
}

- (IBAction) calculateDistance {
    
    NSDecimalNumber *seven = [NSDecimalNumber decimalNumberWithString:@"7"];
    NSDecimalNumber *onethousand = [NSDecimalNumber decimalNumberWithString:@"1000"];
    
    if (self.editObjectHeight.text.length > 0 ) {
        
        NSDecimalNumber *oh = [NSDecimalNumber decimalNumberWithString:self.editObjectHeight.text];
        NSDecimalNumber *xseven = [oh decimalNumberByMultiplyingBy:seven];
        NSDecimalNumber *plusonethousand = [xseven decimalNumberByAdding:onethousand];
        
        [distanceFromCenterline setText:[NSString stringWithFormat:@"%@", plusonethousand.stringValue]];
        
    } else {
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You must enter an object height" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (IBAction) calculateObjectHeight {
    
    NSDecimalNumber *seven = [NSDecimalNumber decimalNumberWithString:@"7"];
    NSDecimalNumber *onethousand = [NSDecimalNumber decimalNumberWithString:@"1000"];
    
    if (self.editDistanceFromCenterline.text.length > 0 ) {
        
        NSDecimalNumber *distance = [NSDecimalNumber decimalNumberWithString:self.editDistanceFromCenterline.text];
        
        NSDecimalNumber *minusonethousand = [distance decimalNumberBySubtracting:onethousand];
        NSDecimalNumber *divseven = [minusonethousand decimalNumberByDividingBy:seven];
        
        [objectHeight setText:[NSString stringWithFormat:@"%@", divseven.stringValue]];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You must enter the distance from the centerline" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (IBAction) reset {
    [objectHeight setText:[NSString stringWithFormat:@""]];
    [distanceFromCenterline setText: [NSString stringWithFormat:@""]];
    [editDistanceFromCenterline setText: [NSString stringWithFormat:@""]];
    [editObjectHeight setText: [NSString stringWithFormat: @""]];
    
}

@end
