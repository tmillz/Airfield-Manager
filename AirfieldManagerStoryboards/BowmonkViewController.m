//
//  BowmonkViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "BowmonkViewController.h"

@interface BowmonkViewController ()

@end

@implementation BowmonkViewController

@synthesize text;
@synthesize rcr = rcr;

- (IBAction)showMenu
{
    // Dismiss keyboard
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)calculate {
    NSDecimalNumber *good = [NSDecimalNumber decimalNumberWithString:@"17"];
    NSDecimalNumber *fair = [NSDecimalNumber decimalNumberWithString:@"12"];
    NSDecimalNumber *poor = [NSDecimalNumber decimalNumberWithString:@"6"];
    NSDecimalNumber *nill = [NSDecimalNumber decimalNumberWithString:@"5"];
    
    NSDecimalNumber *reading = [NSDecimalNumber decimalNumberWithString:self.text.text];
    NSDecimalNumber *multiplier = [NSDecimalNumber decimalNumberWithString:@".323"];
    
    NSDecimalNumber *roundDown = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale: 0 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    
    
    NSDecimalNumber *total = [reading decimalNumberByMultiplyingBy:multiplier withBehavior:roundDown];
    
    if ([total compare:good] == NSOrderedDescending) {
        [rcr setText:[NSString stringWithFormat:@"RCR: %@ Braking Action GOOD", total.stringValue]];
    } else if ([total compare:good] == NSOrderedSame) {
        [rcr setText:[NSString stringWithFormat:@"RCR: %@ Braking Action GOOD", total.stringValue]];
    } else if ([total compare:good] == NSOrderedAscending && [total compare:fair] == NSOrderedDescending || NSOrderedSame) {
        [rcr setText:[NSString stringWithFormat:@"RCR: %@ Braking Action FAIR", total.stringValue]];
    } else if ([total compare:fair] == NSOrderedAscending && [total compare:poor] == NSOrderedDescending || NSOrderedSame) {
        [rcr setText:[NSString stringWithFormat:@"RCR: %@ Braking Action POOR", total.stringValue]];
    } else if ([total compare:nill] == NSOrderedAscending) {
        [rcr setText:[NSString stringWithFormat:@"RCR: %@ Braking Action NILL", total.stringValue]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
