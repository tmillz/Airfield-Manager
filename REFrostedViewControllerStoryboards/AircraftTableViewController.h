//
//  AircraftTableViewController.h
//  Airfield-Manager
//
//  Created by Terry on 9/7/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
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
