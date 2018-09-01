//
//  DEMOCalcViewController.h
//  Airfield-Manager
//
//  Created by Terry on 8/13/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface CalcViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *editObjectHeight;
@property (strong, nonatomic) IBOutlet UITextField *editDistanceFromCenterline;
@property (strong, nonatomic) IBOutlet UITextField *distanceFromCenterline;
@property (strong, nonatomic) IBOutlet UITextField *objectHeight;

- (IBAction)calculateDistance;
- (IBAction)calculateObjectHeight;
- (IBAction)reset;


@end

