//
//  DEMODiscViewController.m
//  Airfield-Manager
//
//  Created by Terry on 8/26/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "DiscViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "LocationInfo.h"
#import <QuartzCore/QuartzCore.h>
#import "LocationDetailViewController.h"

@import CoreLocation;

@interface DiscViewController () <GMSMapViewDelegate, CLLocationManagerDelegate, UITextFieldDelegate> {
    UITextField *text;
    //UITextField *text2;
}
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation DiscViewController {
    GMSMapView *mapView_;
    BOOL firstLocationUpdate_;
}

//@synthesize locationInfos = _locationInfos;
@synthesize details = _details;

static DiscViewController *_locationsDB;

+ (DiscViewController*)locationsDB {
    if (_locationsDB == nil) {
        _locationsDB = [[DiscViewController alloc] init];
    }
    return _locationsDB;
}

- (id)init {
    //NSLog(@"init ran");
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"locations" ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_locationsDB) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

- (void)viewDidLoad {
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"locations.db"]];
    //NSLog(@"%@", databasePath);
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO) {
        
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_locationsDB) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS LOCATIONS (ID INTEGER PRIMARY KEY AUTOINCREMENT, FIELD_LAT TEXT, FIELD_LNG TEXT, FIELD_ZOOM TEXT, FIELD_DISC TEXT, FIELD_COLOR TEXT, FIELD_PIC TEXT, FIELD_DATE TEXT, FIELD_NAME TEXT, FIELD_NOTES TEXT)";
            
            if (sqlite3_exec(_locationsDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                //status.text = @"Failed to create table";
                NSLog(@"Failed to create table");
            }
            NSLog(@"database created");
            sqlite3_close(_locationsDB);
            
        } else {
            NSLog(@"Failed to open/create database");
        }
        
    }

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    
    mapView_.myLocationEnabled = YES;
    mapView_.mapType = kGMSTypeSatellite;
    mapView_.settings.compassButton = YES;
    mapView_.settings.myLocationButton = YES;
    mapView_.accessibilityElementsHidden = NO;
    self.view = mapView_;
    mapView_.delegate = self;
    
    //UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //button.frame = CGRectMake(mapView_.bounds.size.width - 110, mapView_.bounds.size.height - 30, 50, 40);
    //button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    //button.center = CGPointMake(280.0, 280.0);
    //[button setBackgroundColor:[UIColor whiteColor]];
    //button.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:0.8];
    //Email button on map!
    //[button setTitle:@"Email" forState:UIControlStateNormal];
    //button.layer.cornerRadius =4;
    //button.clipsToBounds = YES;
    //[mapView_ addSubview:button];
    
    text = [[UITextField alloc] initWithFrame:CGRectMake(8.0, 8.0, 300, 40)];
    //[mapView_ addConstraint:[NSLayoutConstraint constraintWithItem:text attribute:NSLayoutAttributeTrailing   relatedBy:NSLayoutRelationEqual toItem:mapView_ attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:30]];
    //[text setTranslatesAutoresizingMaskIntoConstraints:NO];
    //[text setTag:1];
    text.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    //text.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
    
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    text.leftView = paddingView;
    text.leftViewMode = UITextFieldViewModeAlways;
    //text.center = CGPointMake(0.0, 0.0);
    [text setBackgroundColor:[UIColor whiteColor]];
    [text setReturnKeyType:UIReturnKeyDone];
    text.layer.cornerRadius =4;
    text.clipsToBounds = NO;
    [text setPlaceholder:@"Enter title & long press map"];
    text.userInteractionEnabled = YES;
    text.enabled = YES;
    [mapView_ addSubview:text];
    text.delegate = self;
    
    //text2 = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 200, 40)];
    //text2.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    //text2.leftView = paddingView;
    //text2.leftViewMode = UITextFieldViewModeAlways;
    //text2.center = CGPointMake(120.0, 30.0);
    //[text2 setBackgroundColor:[UIColor whiteColor]];
    //[text2 setReturnKeyType:UIReturnKeyDone];
    //text2.layer.cornerRadius =4;
    //text2.clipsToBounds = YES;
    //[text2 setPlaceholder:@"Enter title & tap map"];
    //text2.userInteractionEnabled = YES;
    //text2.enabled = YES;
    //[mapView_ addSubview:text2];
    //text2.delegate = self;
    
    // Listen to the myLocation property of GMSMapView.
    [mapView_ addObserver:self
               forKeyPath:@"myLocation"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    
    
    // Ask for My Location data after the map has already been added to the UI.
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView_.myLocationEnabled = YES;
    });
    
    [self locationInfos];
    [super viewDidLoad];
}

// Remove the GMSBlockingGestureRecognizer of the GMSMapView.
+ (void)removeGMSBlockingGestureRecognizerFromMapView:(GMSMapView *)mapView
{
    for (id gestureRecognizer in mapView.gestureRecognizers)
    {
        NSLog(@"mapview recognizer %@",gestureRecognizer);
        if (![gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]])
        {
            [mapView removeGestureRecognizer:gestureRecognizer];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [self locationInfos];
}

-(void)viewDidDisappear:(BOOL)animated {
    [mapView_ clear];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    [self.parentViewController.navigationItem setTitle:@"Map"];
    [DiscViewController removeGMSBlockingGestureRecognizerFromMapView:mapView_];
}

-(void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate {
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    marker3.position = coordinate;
    NSString *title = text.text;
    marker3.title = title;
    marker3.map = mapView_;
    
    NSString *get_lat = [[NSString alloc] initWithFormat:@"%f", coordinate.latitude];
    NSString *get_lng = [[NSString alloc] initWithFormat:@"%f", coordinate.longitude];
    field_lat = get_lat;
    field_lng = get_lng;
    field_zoom = @"";
    
    if (title != nil) {
        field_disc = title;
    } else
        field_disc = @"";
        
    field_color = @"";
    field_pic = @"";
    field_date= @"";
    field_name= @"";
    field_notes= @"";
    
    sqlite3_stmt *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_locationsDB) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO LOCATIONS (FIELD_LAT, FIELD_LNG, FIELD_ZOOM, FIELD_DISC, FIELD_COLOR, FIELD_PIC, FIELD_DATE, FIELD_NAME, FIELD_NOTES) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\" )", field_lat, field_lng, field_zoom, field_disc, field_color, field_pic, field_date, field_name, field_notes];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(_locationsDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE) {
        }
        text.text = @"";
        sqlite3_finalize(statement);
        sqlite3_close(_locationsDB);
    }
}

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good job!"
                                                    message:marker.userData
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];*/
    
    if (self.details == nil){
        self.details = [self.storyboard instantiateViewControllerWithIdentifier:@"locationDetailViewController"];
    } else {
        
    }
    _details.uniqueId = [marker.userData intValue];
    [self.navigationController pushViewController:_details animated:YES];
}

- (NSMutableArray *)locationInfos {
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"locations.db"]];
    
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    if (sqlite3_open(dbpath, &_locationsDB) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT ID, FIELD_LAT, FIELD_LNG, FIELD_DISC, FIELD_DATE, FIELD_NAME, FIELD_NOTES FROM LOCATIONS"];
    
    const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_locationsDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                int uniqueId = sqlite3_column_int(statement, 0);
                char *field_latChar = (char *) sqlite3_column_text(statement, 1);
                char *field_lngChar = (char *) sqlite3_column_text(statement, 2);
                char *field_discChar = (char *) sqlite3_column_text(statement, 3);
                char *field_dateChar = (char *) sqlite3_column_text(statement, 4);
                char *field_nameChar = (char *) sqlite3_column_text(statement, 5);
                char *field_notesChar = (char *) sqlite3_column_text(statement, 6);
                field_lat = [[NSString alloc] initWithUTF8String:field_latChar];
                field_lng = [[NSString alloc] initWithUTF8String:field_lngChar];
                field_disc = [[NSString alloc] initWithUTF8String:field_discChar];
                field_date = [[NSString alloc] initWithUTF8String:field_dateChar];
                field_name = [[NSString alloc] initWithUTF8String:field_nameChar];
                field_notes = [[NSString alloc] initWithUTF8String:field_notesChar];
                LocationInfo *info = [[LocationInfo alloc] initWithUniqueId:uniqueId field_lat:field_lat field_lng:field_lng field_disc:field_disc field_pic:field_pic field_date:field_date field_name:field_name field_notes:field_notes];
                [retval addObject:info];
                double lt=[field_lat doubleValue];
                double ln=[field_lng doubleValue];
                GMSMarker *marker = [[GMSMarker alloc] init];
                marker.appearAnimation=YES;
                marker.position = CLLocationCoordinate2DMake(lt,ln);
                marker.title = field_disc;
                marker.userData = [NSString stringWithFormat:@"%d",info.uniqueId];
                marker.map = mapView_;
            }
            sqlite3_finalize(statement);
        } //else {
            //NSLog(@"Error while inserting data. '%s'", sqlite3_errmsg(_locationsDB));
            //NSLog(@"oopsey");
        //}
        sqlite3_close(_locationsDB);
    }
    return retval;
}

-(LocationInfo *)locationInfos:(int)uniqueId {
    LocationInfo *retval = nil;
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"locations.db"]];
    
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    
    if(sqlite3_open(dbpath, &_locationsDB) == SQLITE_OK) {
        NSString *query = [NSString stringWithFormat:@"SELECT ID, FIELD_LAT, FIELD_LNG, FIELD_DISC, FIELD_PIC, FIELD_DATE, FIELD_NAME, FIELD_NOTES FROM LOCATIONS WHERE ID=%d", uniqueId];
        if(sqlite3_prepare_v2(_locationsDB, [query UTF8String], -1, & statement, nil) ==  SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                int uniqueId = sqlite3_column_int(statement, 0);
                char *field_latChar = (char *) sqlite3_column_text (statement, 1);
                char *field_lngChar = (char *) sqlite3_column_text (statement, 2);
                char *field_discChar = (char *) sqlite3_column_text (statement, 3);
                char *field_picChar = (char *) sqlite3_column_text (statement, 4);
                char *field_dateChar = (char *) sqlite3_column_text (statement, 5);
                char *field_nameChar = (char *) sqlite3_column_text (statement, 6);
                char *field_notesChar = (char *) sqlite3_column_text (statement, 7);
                field_lat = [[NSString alloc] initWithUTF8String:field_latChar];
                field_lng = [[NSString alloc] initWithUTF8String:field_lngChar];
                field_disc = [[NSString alloc] initWithUTF8String:field_discChar];
                field_pic = [[NSString alloc] initWithUTF8String:field_picChar];
                field_date = [[NSString alloc] initWithUTF8String:field_dateChar];
                field_name = [[NSString alloc] initWithUTF8String:field_nameChar];
                field_notes = [[NSString alloc] initWithUTF8String:field_notesChar];
                retval = [[LocationInfo alloc] initWithUniqueId:uniqueId field_lat:field_lat field_lng:field_lng field_disc:field_disc field_pic:field_pic field_date:field_date field_name:field_name field_notes:field_notes];
                break;
                }
                sqlite3_finalize(statement);
        }
    }
    return retval;
}

-(LocationInfo *)deleteLocation:(int)uniqueId {
    LocationInfo *retval = nil;
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"locations.db"]];
    
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    
    if(sqlite3_open(dbpath, &_locationsDB) == SQLITE_OK) {
        NSString *query = [NSString stringWithFormat:@"DELETE FROM LOCATIONS WHERE ID=%d", uniqueId];
        
        const char *dlt_statement = [query UTF8String];
        
        sqlite3_prepare_v2(_locationsDB, dlt_statement, -1, &statement, NULL);
                if (sqlite3_step(statement) == SQLITE_DONE) {
                    NSLog(@"marker deleted");
                } else {
                    NSLog(@"Error while inserting data. '%s'", sqlite3_errmsg(_locationsDB));
                }
        
        sqlite3_finalize(statement);
        sqlite3_close(_locationsDB);
    } else {
        NSLog(@"Error while inserting data. '%s'", sqlite3_errmsg(_locationsDB));
    }
    return retval;
}

- (DiscViewController*) idParam:(int)uniqueId discParam:(NSString*)disc latParam:(NSString*)lat lngParam:(NSString*)lng picParam:(NSString*)pic dateParam:(NSString*)date nameParam:(NSString*)name notesParam:(NSString*)notes {
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"locations.db"]];
    
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement = NULL;
    
    if (sqlite3_open(dbpath, &_locationsDB) == SQLITE_OK) {
        NSString *updateSQL = [NSString stringWithFormat: @"UPDATE LOCATIONS set FIELD_DISC='%@', FIELD_LAT='%@', FIELD_LNG='%@', FIELD_PIC='%@', FIELD_DATE='%@', FIELD_NAME='%@', FIELD_NOTES='%@' WHERE id = '%d'", disc, lat, lng, pic, date, name, notes, uniqueId];
        
        const char *update_stmt = [updateSQL UTF8String];
        sqlite3_prepare_v2(_locationsDB, update_stmt, -1, &statement, NULL );
    } else {
        NSLog(@"SQLITE NOT OK");
    }
    if (sqlite3_step(statement) == SQLITE_DONE) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good job!"
                                                        message:@"Your marker has been updated"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    return EXIT_SUCCESS;
}

- (void)dealloc {
    [mapView_ removeObserver:self
                  forKeyPath:@"myLocation"
                     context:NULL];
    //self.details = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (!firstLocationUpdate_) {
        // If the first location update has not yet been recieved, then jump to that location.
        firstLocationUpdate_ = YES;
        CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
        mapView_.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
                                                         zoom:14];
    }
}

// Location Manager Delegate Methods
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    //NSLog(@"%@", [locations lastObject]);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
