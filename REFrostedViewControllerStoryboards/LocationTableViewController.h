//
//  LocationTableViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 2/12/16.
//  Copyright © 2016 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import <sqlite3.h>


@class LocationDetailViewController;

@interface LocationTableViewController : UITableViewController {
    NSMutableArray *_locationInfos;
    LocationDetailViewController *_details;
}

@property (nonatomic, retain) LocationDetailViewController *details;
@property (nonatomic, retain) NSMutableArray *locationInfos;

@end
