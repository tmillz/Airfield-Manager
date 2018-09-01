//
//  DEMOBowmonkViewController.h
//  Airfield-Manager
//
//  Created by Terry on 8/13/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface BowmonkViewController : UIViewController {
    UITextField *rcr;
}

@property (strong, nonatomic) IBOutlet UITextField *text;
@property (strong, nonatomic) IBOutlet UITextField *rcr;

- (IBAction)showMenu;

- (IBAction)calculate;

@end