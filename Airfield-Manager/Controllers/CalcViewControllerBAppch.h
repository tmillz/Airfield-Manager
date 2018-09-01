//
//  CalcViewControllerBAppch.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcViewControllerBAppch : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *editObjectHeight;
@property (strong, nonatomic) IBOutlet UITextField *editDistanceFromThreshold;
@property (strong, nonatomic) IBOutlet UITextField *distanceFromThreshold;
@property (strong, nonatomic) IBOutlet UITextField *objectHeight;


- (IBAction)calculateDistance;
- (IBAction)calculateObjectHeight;
- (IBAction)reset;


@end

