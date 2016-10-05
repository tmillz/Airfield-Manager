//
//  AircraftDatabase.h
//  Airfield-Manager
//
//  Created by Terry on 9/6/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
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
