//
//  AircraftDetailViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "AircraftDetailViewController.h"
#import "AircraftDatabase.h"
#import "AircraftDetails.h"
#import <QuartzCore/QuartzCore.h>

@implementation AircraftDetailViewController

//@synthesize id = _id;
@synthesize aircraft = _aircraft;
@synthesize wing_span = _wing_span;
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
@synthesize max_flex_d = _max_flex_d;
@synthesize flex_a = _flex_a;
@synthesize flex_b = _flex_b;
@synthesize flex_c= _flex_c;
@synthesize flex_d = _flex_d;
@synthesize uniqueId = _uniqueId;

- (void)viewDidUnload {
    //[super viewDidUnload];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //self.id = nil;
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
    self.acn_max_weight_flex = nil;
    self.max_rigid_a = nil;
    self.max_rigid_b = nil;
    self.max_rigid_c = nil;
    self.max_rigid_d = nil;
    self.acn_weight_min = nil;
    self.acn_weight_min_flex = nil;
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


-(void)dealloc {
    //self.id = nil;
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
    self.acn_max_weight_flex = nil;
    self.max_rigid_a = nil;
    self.max_rigid_b = nil;
    self.max_rigid_c = nil;
    self.max_rigid_d = nil;
    self.acn_weight_min = nil;
    self.acn_weight_min_flex = nil;
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
    //[super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
    AircraftDetails *details = [[AircraftDatabase database]
                                  aircraftDetails:_uniqueId];
    
    if (details != nil) {
        //[_id setText:[NSString stringWithFormat:@"%d", details.aircraft]];
        //[_aircraft setText:details.aircraft];
        self.navigationItem.title = details.aircraft;
        [_wing_span setText:details.wing_span];
        [_length setText:details.length];
        [_height setText:details.height];
        [_Vert_clr setText:details.Vert_clr];
        [_max_to_wt setText:details.max_to_wt];
        //[_max_to_wt setText:[NSString stringWithFormat:@"%d", details.aircraft]];
        [_basic_empty_wt setText:details.basic_empty_wt];
        [_turn_radius setText:details.turn_radius];
        [_turn_diameter setText:details.turn_diameter];
        [_acn_max_weight setText:details.acn_max_weight];
        [_acn_max_weight_flex setText:details.acn_max_weight];
        [_max_rigid_a setText:details.max_rigid_a];
        [_max_rigid_b setText:details.max_rigid_b];
        [_max_rigid_c setText:details.max_rigid_c];
        [_max_rigid_d setText:details.max_rigid_d];
        [_acn_weight_min setText:details.acn_weight_min];
        [_acn_weight_min_flex setText:details.acn_weight_min];
        [_rigid_a setText:details.rigid_a];
        [_rigid_b setText:details.rigid_b];
        [_rigid_c setText:details.rigid_c];
        [_rigid_d setText:details.rigid_d];
        [_max_flex_a setText:details.max_flex_a];
        [_max_flex_b setText:details.max_flex_b];
        [_max_flex_c setText:details.max_flex_c];
        [_max_flex_d setText:details.max_flex_d];
        [_flex_a setText:details.flex_a];
        [_flex_b setText:details.flex_b];
        [_flex_c setText:details.flex_c];
        [_flex_d setText:details.flex_d];
    }
}

@end
