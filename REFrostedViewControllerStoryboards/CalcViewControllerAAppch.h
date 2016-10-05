//
//  CalcViewController4.h
//  Airfield-Manager
//
//  Created by Terry on 12/29/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcViewControllerAAppch : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *editObjectHeight;
@property (strong, nonatomic) IBOutlet UITextField *editDistanceFromThreshold;
@property (strong, nonatomic) IBOutlet UITextField *distanceFromThreshold;
@property (strong, nonatomic) IBOutlet UITextField *objectHeight;

- (IBAction)calculateDistance;
- (IBAction)calculateObjectHeight;
- (IBAction)reset;


@end
