//
//  DEMODiscViewController.h
//  Airfield-Manager
//
//  Created by Terry on 8/26/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <sqlite3.h>

@class LocationInfo;
@class LocationDetailViewController;

@import CoreLocation;

@interface DiscViewController : UIViewController <GMSMapViewDelegate, UITextFieldDelegate> {
    NSString *databasePath;
    sqlite3 *_locationsDB;
    NSString *field_lat;
    NSString *field_lng;
    NSString *field_zoom;
    NSString *field_disc;
    NSString *field_color;
    NSString *field_pic;
    NSString *field_date;
    NSString *field_name;
    NSString *field_notes;
    LocationDetailViewController *_details;
}

@property (nonatomic, retain) LocationDetailViewController *details;
@property (nonatomic, retain) NSMutableArray *locationInfos;

+ (DiscViewController*)locationsDB;
- (DiscViewController*)idParam:(int)uniqueId discParam:(NSString*)disc latParam:(NSString*)lat lngParam:(NSString*)lng picParam:(NSString*)pic dateParam:(NSString*)date nameParam:(NSString*)name notesParam:(NSString*)notes;
- (NSMutableArray *)locationInfos;
- (LocationInfo *)locationInfos:(int)uniqueId;
- (LocationInfo *)deleteLocation:(int)uniqueId;
- (IBAction)showMenu;

- (void)viewDidLoad;

@end
