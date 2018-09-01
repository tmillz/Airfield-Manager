//
//  AircraftTableViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@class AircraftDetailViewController;

@interface AircraftTableViewController : UITableViewController {
    NSArray *_aircraftInfos;
    AircraftDetailViewController *_details;
}

- (IBAction)showMenu;

@property (nonatomic, retain) AircraftDetailViewController *details;
@property (nonatomic, retain) NSArray *aircraftInfos;

@end
