//
//  CalcViewControllerATrans.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "CalcViewControllerATrans.h"

@interface CalcViewControllerATrans ()

@end

@implementation CalcViewControllerATrans

@synthesize editObjectHeight;
@synthesize editDistanceFromCenterline;
@synthesize objectHeight;
@synthesize distanceFromCenterline;

- (void)viewDidAppear:(BOOL)animated {
    [self.parentViewController.navigationItem setTitle:@"Class A Trans Surface"];
}

- (IBAction) calculateDistance {
    
    NSDecimalNumber *seven = [NSDecimalNumber decimalNumberWithString:@"7"];
    NSDecimalNumber *fivehundred = [NSDecimalNumber decimalNumberWithString:@"500"];
    
    if (self.editObjectHeight.text.length > 0 ) {
        
        NSDecimalNumber *oh = [NSDecimalNumber decimalNumberWithString:self.editObjectHeight.text];
        NSDecimalNumber *xseven = [oh decimalNumberByMultiplyingBy:seven];
        NSDecimalNumber *plusonethousand = [xseven decimalNumberByAdding:fivehundred];
        
        [distanceFromCenterline setText:[NSString stringWithFormat:@"%@", plusonethousand.stringValue]];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You must enter an object height" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (IBAction) calculateObjectHeight {
    
    NSDecimalNumber *seven = [NSDecimalNumber decimalNumberWithString:@"7"];
    NSDecimalNumber *fivehundred = [NSDecimalNumber decimalNumberWithString:@"500"];
    
    if (self.editDistanceFromCenterline.text.length > 0 ) {
        
        NSDecimalNumber *distance = [NSDecimalNumber decimalNumberWithString:self.editDistanceFromCenterline.text];
        
        NSDecimalNumber *minusonethousand = [distance decimalNumberBySubtracting:fivehundred];
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
