//
//  AircraftDatabase.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class AircraftDetails;

@interface AircraftDatabase : NSObject {
    sqlite3 *_database;
}

+ (AircraftDatabase*)database;
- (NSArray *)aircraftInfos;
- (AircraftDetails *)aircraftDetails:(int)uniqueId;

@end
