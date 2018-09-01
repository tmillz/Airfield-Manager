//
//  AircraftDetails.m
//  Airfield-Manager
//
//  Created by Terry on 9/10/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "AircraftDetails.h"


@implementation AircraftDetails

@synthesize uniqueId = _uniqueId;
@synthesize aircraft = _aircraft;
@synthesize wing_span =_wing_span;
@synthesize length = _length;
@synthesize height = _height;
@synthesize Vert_clr = _Vert_clr;
@synthesize max_to_wt = _max_to_wt;
@synthesize basic_empty_wt = _basic_empty_wt;
@synthesize turn_radius = _turn_radius;
@synthesize turn_diameter = _turn_diameter;
@synthesize acn_max_weight = _acn_max_weight;
@synthesize max_rigid_a = _max_rigid_a;
@synthesize max_rigid_b = _max_rigid_b;
@synthesize max_rigid_c = _max_rigid_c;
@synthesize max_rigid_d = _max_rigid_d;
@synthesize acn_weight_min = _acn_weight_min;
@synthesize rigid_a = _rigid_a;
@synthesize rigid_b = _rigid_b;
@synthesize rigid_c = _rigid_c;
@synthesize rigid_d = _rigid_d;
@synthesize max_flex_a = _max_flex_a;
@synthesize max_flex_b = _max_flex_b;
@synthesize max_flex_c = _max_flex_c;
@synthesize max_flex_d = _max_fled_d;
@synthesize flex_a = _flex_a;
@synthesize flex_b = _flex_b;
@synthesize flex_c = _flex_c;
@synthesize flex_d = _flex_d;

- (id)initWithUniqueId:(int)uniqueId aircraft:(NSString *)aircraft wing_span:(NSString *)wing_span length:(NSString *)length height:(NSString *)height Vert_clr:(NSString *)Vert_clr max_to_wt:(NSString *)max_to_wt basic_empty_wt:(NSString *)basic_empty_wt turn_radius:(NSString *)turn_radius turn_diameter:(NSString *)turn_diameter acn_max_weight:(NSString *)acn_max_weight max_rigid_a:(NSString *)max_rigid_a max_rigid_b:(NSString *)max_rigid_b max_rigid_c:(NSString *)max_rigid_c max_rigid_d:(NSString *)max_rigid_d acn_weight_min:(NSString *)acn_weight_min rigid_a:(NSString *)rigid_a rigid_b:(NSString *)rigid_b rigid_c:(NSString *)rigid_c rigid_d:(NSString *)rigid_d max_flex_a:(NSString *)max_flex_a max_flex_b:(NSString *)max_flex_b max_flex_c:(NSString *)max_flex_c max_flex_d:(NSString *)max_flex_d flex_a:(NSString *)flex_a flex_b:(NSString *)flex_b flex_c:(NSString *)flex_c flex_d:(NSString *)flex_d {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.aircraft = aircraft;
        self.wing_span = wing_span;
        self.length = length;
        self.height = height;
        self.Vert_clr = Vert_clr;
        self.max_to_wt = max_to_wt;
        self.basic_empty_wt = basic_empty_wt;
        self.turn_radius = turn_radius;
        self.turn_diameter = turn_diameter;
        self.acn_max_weight = acn_max_weight;
        self.max_rigid_a = max_rigid_a;
        self.max_rigid_b = max_rigid_b;
        self.max_rigid_c = max_rigid_c;
        self.max_rigid_d = max_rigid_d;
        self.acn_weight_min = acn_weight_min;
        self.rigid_a = rigid_a;
        self.rigid_b = rigid_b;
        self.rigid_c = rigid_c;
        self.rigid_d = rigid_d;
        self.max_flex_a = max_flex_a;
        self.max_flex_b = max_flex_b;
        self.max_flex_c = max_flex_c;
        self.max_flex_d = max_flex_d;
        self.flex_a = flex_a;
        self.flex_b = flex_b;
        self.flex_c = flex_c;
        self.flex_d = flex_d;
    }
    return self;
}

- (void) dealloc {
    self.aircraft = nil;
    self.wing_span = nil;
    self.length = nil;
    self.height = nil;
    self.Vert_clr = nil;
    self.max_to_wt = nil;
    self.basic_empty_wt = nil;
    self.turn_radius = nil;
    self.turn_diameter = nil;
    self.acn_max_weight = nil;
    self.max_rigid_a = nil;
    self.max_rigid_b = nil;
    self.max_rigid_c = nil;
    self.max_rigid_d = nil;
    self.acn_weight_min = nil;
    self.rigid_a = nil;
    self.rigid_b = nil;
    self.rigid_c = nil;
    self.rigid_d = nil;
    self.max_flex_a = nil;
    self.max_flex_b = nil;
    self.max_flex_c = nil;
    self.max_flex_d = nil;
    self.flex_a = nil;
    self.flex_b = nil;
    self.flex_c = nil;
    self.flex_d = nil;
}

@end
