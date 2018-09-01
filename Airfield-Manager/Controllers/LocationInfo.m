//
//  LocationInfo.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 2/12/16.
//  Copyright © 2016 Terrance Miller. All rights reserved.
//

#import "LocationInfo.h"

@implementation LocationInfo

@synthesize uniqueId = _uniqueId;
@synthesize field_lat = _field_lat;
@synthesize field_lng = _field_lng;
@synthesize field_disc = _field_disc;
@synthesize field_pic = _field_pic;
@synthesize field_date = _field_date;
@synthesize field_name = _field_name;
@synthesize field_notes = _field_notes;


- (id)initWithUniqueId:(int)uniqueId field_lat:(NSString *)field_lat field_lng:(NSString *)field_lng field_disc:(NSString *)field_disc field_pic:(NSString *)field_pic field_date:(NSString *)field_date field_name:(NSString *)field_name field_notes:(NSString *)field_notes {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.field_lat = field_lat;
        self.field_lng = field_lng;
        self.field_disc = field_disc;
        self.field_pic = field_pic;
        self.field_date = field_date;
        self.field_name = field_name;
        self.field_notes = field_notes;
    }
    return self;
}

- (void) dealloc {
    self.field_lat = nil;
    self.field_lng = nil;
    self.field_disc = nil;
    self.field_pic = nil;
    self.field_date = nil;
    self.field_name = nil;
    self.field_notes = nil;
}

@end
