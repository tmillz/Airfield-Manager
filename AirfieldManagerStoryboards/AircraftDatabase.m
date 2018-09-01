//
//  AircraftDatabase.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "AircraftDatabase.h"
#import "AircraftInfo.h"
#import "AircraftDetails.h"

@implementation AircraftDatabase

static AircraftDatabase *_database;

+ (AircraftDatabase*)database {
    if (_database == nil) {
        _database = [[AircraftDatabase alloc] init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (void)dealloc {
    sqlite3_close(_database);
}

- (NSArray *)aircraftInfos {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT _id, aircraft, wing_span, length, height, Vert_clr, max_to_wt, basic_empty_wt, turn_radius, turn_diameter, acn_max_weight, max_rigid_a, max_rigid_b, max_rigid_c, max_rigid_d, acn_weight_min, rigid_a, rigid_b, rigid_c, rigid_d, max_flex_a, max_flex_b, max_flex_c, max_flex_d, flex_a, flex_b, flex_c, flex_d FROM aircraft";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *aircraftChars = (char *) sqlite3_column_text(statement, 1);
            char *wing_spanChars = (char *) sqlite3_column_text(statement, 2);
            char *lengthChars = (char *) sqlite3_column_text(statement, 3);
            char *heightChars = (char *) sqlite3_column_text(statement, 4);
            char *Vert_clrChars = (char *) sqlite3_column_text(statement, 5);
            char *max_to_wtChars = (char *) sqlite3_column_text(statement, 6);
            char *basic_empty_wtChars = (char *) sqlite3_column_text(statement, 7);
            char *turn_radiusChars = (char *) sqlite3_column_text(statement, 8);
            char *turn_diameterChars = (char *) sqlite3_column_text(statement, 9);
            char *acn_max_weightChars = (char *) sqlite3_column_text(statement, 10);
            char *max_rigid_aChars = (char *) sqlite3_column_text(statement, 11);
            char *max_rigid_bChars = (char *) sqlite3_column_text(statement, 12);
            char *max_rigid_cChars = (char *) sqlite3_column_text(statement, 13);
            char *max_rigid_dChars = (char *) sqlite3_column_text(statement, 14);
            char *acn_weight_minChars = (char *) sqlite3_column_text(statement, 15);
            char *rigid_aChars = (char *) sqlite3_column_text(statement, 16);
            char *rigid_bChars = (char *) sqlite3_column_text(statement, 17);
            char *rigid_cChars = (char *) sqlite3_column_text(statement, 18);
            char *rigid_dChars = (char *) sqlite3_column_text(statement, 19);
            char *max_flex_aChars = (char *) sqlite3_column_text(statement, 20);
            char *max_flex_bChars = (char *) sqlite3_column_text(statement, 21);
            char *max_flex_cChars = (char *) sqlite3_column_text(statement, 22);
            char *max_flex_dChars = (char *) sqlite3_column_text(statement, 23);
            char *flex_aChars = (char *) sqlite3_column_text(statement, 24);
            char *flex_bChars = (char *) sqlite3_column_text(statement, 25);
            char *flex_cChars = (char *) sqlite3_column_text(statement, 26);
            char *flex_dChars = (char *) sqlite3_column_text(statement, 27);
            NSString *aircraft = [[NSString alloc] initWithUTF8String:aircraftChars];
            NSString *wing_span = [[NSString alloc] initWithUTF8String:wing_spanChars];
            NSString *length = [[NSString alloc] initWithUTF8String:lengthChars];
            NSString *height = [[NSString alloc] initWithUTF8String:heightChars];
            NSString *Vert_clr = [[NSString alloc] initWithUTF8String:Vert_clrChars];
            NSString *max_to_wt = [[NSString alloc] initWithUTF8String:max_to_wtChars];
            NSString *basic_empty_wt = [[NSString alloc] initWithUTF8String:basic_empty_wtChars];
            NSString *turn_radius = [[NSString alloc] initWithUTF8String:turn_radiusChars];
            NSString *turn_diameter = [[NSString alloc] initWithUTF8String:turn_diameterChars];
            NSString *acn_max_weight = [[NSString alloc] initWithUTF8String:acn_max_weightChars];
            NSString *max_rigid_a = [[NSString alloc] initWithUTF8String:max_rigid_aChars];
            NSString *max_rigid_b = [[NSString alloc] initWithUTF8String:max_rigid_bChars];
            NSString *max_rigid_c = [[NSString alloc] initWithUTF8String:max_rigid_cChars];
            NSString *max_rigid_d = [[NSString alloc] initWithUTF8String:max_rigid_dChars];
            NSString *acn_weight_min = [[NSString alloc] initWithUTF8String:acn_weight_minChars];
            NSString *rigid_a = [[NSString alloc] initWithUTF8String:rigid_aChars];
            NSString *rigid_b = [[NSString alloc] initWithUTF8String:rigid_bChars];
            NSString *rigid_c = [[NSString alloc] initWithUTF8String:rigid_cChars];
            NSString *rigid_d = [[NSString alloc] initWithUTF8String:rigid_dChars];
            NSString *max_flex_a = [[NSString alloc] initWithUTF8String:max_flex_aChars];
            NSString *max_flex_b = [[NSString alloc] initWithUTF8String:max_flex_bChars];
            NSString *max_flex_c = [[NSString alloc] initWithUTF8String:max_flex_cChars];
            NSString *max_flex_d = [[NSString alloc] initWithUTF8String:max_flex_dChars];
            NSString *flex_a = [[NSString alloc] initWithUTF8String:flex_aChars];
            NSString *flex_b = [[NSString alloc] initWithUTF8String:flex_bChars];
            NSString *flex_c = [[NSString alloc] initWithUTF8String:flex_cChars];
            NSString *flex_d = [[NSString alloc] initWithUTF8String:flex_dChars];
            AircraftInfo *info = [[AircraftInfo alloc] initWithUniqueId:uniqueId aircraft:aircraft wing_span:wing_span length:length height:height Vert_clr:Vert_clr max_to_wt:max_to_wt basic_empty_wt:basic_empty_wt turn_radius:turn_radius turn_diameter:turn_diameter acn_max_weight:acn_max_weight max_rigid_a:max_rigid_a max_rigid_b:max_rigid_b max_rigid_c:max_rigid_c max_rigid_d:max_rigid_d acn_weight_min:acn_weight_min rigid_a:rigid_a rigid_b:rigid_b rigid_c:rigid_c rigid_d:rigid_d max_flex_a:max_flex_a max_flex_b:max_flex_b max_flex_c:max_flex_c max_flex_d:max_flex_d flex_a:flex_a flex_b:flex_b flex_c:flex_c flex_d:flex_d];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (AircraftDetails *)aircraftDetails:(int)uniqueId {
    AircraftDetails *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT _id, aircraft, wing_span, length, height, Vert_clr, max_to_wt, basic_empty_wt, turn_radius, turn_diameter, acn_max_weight, max_rigid_a, max_rigid_b, max_rigid_c, max_rigid_d, acn_weight_min, rigid_a, rigid_b, rigid_c, rigid_d, max_flex_a, max_flex_b, max_flex_c, max_flex_d, flex_a, flex_b, flex_c, flex_d FROM aircraft WHERE _id=%d", uniqueId];
                       sqlite3_stmt *statement;
                       if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
                           == SQLITE_OK) {
                           while (sqlite3_step(statement) == SQLITE_ROW) {
                               int uniqueId = sqlite3_column_int(statement, 0);
                               char *aircraftChars = (char *) sqlite3_column_text(statement, 1);
                               char *wing_spanChars = (char *) sqlite3_column_text(statement, 2);
                               char *lengthChars = (char *) sqlite3_column_text(statement, 3);
                               char *heightChars = (char *) sqlite3_column_text(statement, 4);
                               char *Vert_clrChars = (char *) sqlite3_column_text(statement, 5);
                               char *max_to_wtChars = (char *) sqlite3_column_text(statement, 6);
                               char *basic_empty_wtChars = (char *) sqlite3_column_text(statement, 7);
                               char *turn_radiusChars = (char *) sqlite3_column_text(statement, 8);
                               char *turn_diameterChars = (char *) sqlite3_column_text(statement, 9);
                               char *acn_max_weightChars = (char *) sqlite3_column_text(statement, 10);
                               char *max_rigid_aChars = (char *) sqlite3_column_text(statement, 11);
                               char *max_rigid_bChars = (char *) sqlite3_column_text(statement, 12);
                               char *max_rigid_cChars = (char *) sqlite3_column_text(statement, 13);
                               char *max_rigid_dChars = (char *) sqlite3_column_text(statement, 14);
                               char *acn_weight_minChars = (char *) sqlite3_column_text(statement, 15);
                               char *rigid_aChars = (char *) sqlite3_column_text(statement, 16);
                               char *rigid_bChars = (char *) sqlite3_column_text(statement, 17);
                               char *rigid_cChars = (char *) sqlite3_column_text(statement, 18);
                               char *rigid_dChars = (char *) sqlite3_column_text(statement, 19);
                               char *max_flex_aChars = (char *) sqlite3_column_text(statement, 20);
                               char *max_flex_bChars = (char *) sqlite3_column_text(statement, 21);
                               char *max_flex_cChars = (char *) sqlite3_column_text(statement, 22);
                               char *max_flex_dChars = (char *) sqlite3_column_text(statement, 23);
                               char *flex_aChars = (char *) sqlite3_column_text(statement, 24);
                               char *flex_bChars = (char *) sqlite3_column_text(statement, 25);
                               char *flex_cChars = (char *) sqlite3_column_text(statement, 26);
                               char *flex_dChars = (char *) sqlite3_column_text(statement, 27);
                               NSString *aircraft = [[NSString alloc] initWithUTF8String:aircraftChars];
                               NSString *wing_span = [[NSString alloc] initWithUTF8String:wing_spanChars];
                               NSString *length = [[NSString alloc] initWithUTF8String:lengthChars];
                               NSString *height = [[NSString alloc] initWithUTF8String:heightChars];
                               NSString *Vert_clr = [[NSString alloc] initWithUTF8String:Vert_clrChars];
                               NSString *max_to_wt = [[NSString alloc] initWithUTF8String:max_to_wtChars];
                               NSString *basic_empty_wt = [[NSString alloc] initWithUTF8String:basic_empty_wtChars];
                               NSString *turn_radius = [[NSString alloc] initWithUTF8String:turn_radiusChars];
                               NSString *turn_diameter = [[NSString alloc] initWithUTF8String:turn_diameterChars];
                               NSString *acn_max_weight = [[NSString alloc] initWithUTF8String:acn_max_weightChars];
                               NSString *max_rigid_a = [[NSString alloc] initWithUTF8String:max_rigid_aChars];
                               NSString *max_rigid_b = [[NSString alloc] initWithUTF8String:max_rigid_bChars];
                               NSString *max_rigid_c = [[NSString alloc] initWithUTF8String:max_rigid_cChars];
                               NSString *max_rigid_d = [[NSString alloc] initWithUTF8String:max_rigid_dChars];
                               NSString *acn_weight_min = [[NSString alloc] initWithUTF8String:acn_weight_minChars];
                               NSString *rigid_a = [[NSString alloc] initWithUTF8String:rigid_aChars];
                               NSString *rigid_b = [[NSString alloc] initWithUTF8String:rigid_bChars];
                               NSString *rigid_c = [[NSString alloc] initWithUTF8String:rigid_cChars];
                               NSString *rigid_d = [[NSString alloc] initWithUTF8String:rigid_dChars];
                               NSString *max_flex_a = [[NSString alloc] initWithUTF8String:max_flex_aChars];
                               NSString *max_flex_b = [[NSString alloc] initWithUTF8String:max_flex_bChars];
                               NSString *max_flex_c = [[NSString alloc] initWithUTF8String:max_flex_cChars];
                               NSString *max_flex_d = [[NSString alloc] initWithUTF8String:max_flex_dChars];
                               NSString *flex_a = [[NSString alloc] initWithUTF8String:flex_aChars];
                               NSString *flex_b = [[NSString alloc] initWithUTF8String:flex_bChars];
                               NSString *flex_c = [[NSString alloc] initWithUTF8String:flex_cChars];
                               NSString *flex_d = [[NSString alloc] initWithUTF8String:flex_dChars];
                               retval = [[AircraftDetails alloc] initWithUniqueId:uniqueId aircraft:aircraft wing_span:wing_span length:length height:height Vert_clr:Vert_clr max_to_wt:max_to_wt basic_empty_wt:basic_empty_wt turn_radius:turn_radius turn_diameter:turn_diameter acn_max_weight:acn_max_weight max_rigid_a:max_rigid_a max_rigid_b:max_rigid_b max_rigid_c:max_rigid_c max_rigid_d:max_rigid_d acn_weight_min:acn_weight_min rigid_a:rigid_a rigid_b:rigid_b rigid_c:rigid_c rigid_d:rigid_d max_flex_a:max_flex_a max_flex_b:max_flex_b max_flex_c:max_flex_c max_flex_d:max_flex_d flex_a:flex_a flex_b:flex_b flex_c:flex_c flex_d:flex_d];
                               
                               break;
                           }
                           sqlite3_finalize(statement);
                       }
                       return retval;
}

@end
