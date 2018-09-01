//
//  BowmonkViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
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
