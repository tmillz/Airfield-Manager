//
//  AircraftDetailViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AircraftDetailViewController : UIViewController {
    UILabel *_id;
    UILabel *_aircraft;
    UILabel *_wing_span;
    UILabel *_length;
    UILabel *_height;
    UILabel *_Vert_clr;
    UILabel *_max_to_wt;
    UILabel *_basic_empty_wt;
    UILabel *_turn_radius;
    UILabel *_turn_diameter;
    UILabel *_acn_max_weight;
    UILabel *_acn_max_weight_flex;
    UILabel *_max_rigid_a;
    UILabel *_max_rigid_b;
    UILabel *_max_rigid_c;
    UILabel *_max_rigid_d;
    UILabel *_acn_weight_min;
    UILabel *_acn_weight_min_flex;
    UILabel *_rigid_a;
    UILabel *_rigid_b;
    UILabel *_rigid_c;
    UILabel *_rigid_d;
    UILabel *_max_flex_a;
    UILabel *_max_flex_b;
    UILabel *_max_flex_c;
    UILabel *_max_flex_d;
    UILabel *_flex_a;
    UILabel *_flex_b;
    UILabel *_flex_c;
    UILabel *_flex_d;
    int _uniqueId;
}

//@property (nonatomic, retain) IBOutlet UILabel *id;
@property (nonatomic, retain) IBOutlet UILabel *aircraft;
@property (nonatomic, retain) IBOutlet UILabel *wing_span;
@property (nonatomic, retain) IBOutlet UILabel *length;
@property (nonatomic, retain) IBOutlet UILabel *height;
@property (nonatomic, retain) IBOutlet UILabel *Vert_clr;
@property (nonatomic, retain) IBOutlet UILabel *max_to_wt;
@property (nonatomic, retain) IBOutlet UILabel *basic_empty_wt;
@property (nonatomic, retain) IBOutlet UILabel *turn_radius;
@property (nonatomic, retain) IBOutlet UILabel *turn_diameter;
@property (nonatomic, retain) IBOutlet UILabel *acn_max_weight;
@property (nonatomic, retain) IBOutlet UILabel *acn_max_weight_flex;
@property (nonatomic, retain) IBOutlet UILabel *max_rigid_a;
@property (nonatomic, retain) IBOutlet UILabel *max_rigid_b;
@property (nonatomic, retain) IBOutlet UILabel *max_rigid_c;
@property (nonatomic, retain) IBOutlet UILabel *max_rigid_d;
@property (nonatomic, retain) IBOutlet UILabel *acn_weight_min;
@property (nonatomic, retain) IBOutlet UILabel *acn_weight_min_flex;
@property (nonatomic, retain) IBOutlet UILabel *rigid_a;
@property (nonatomic, retain) IBOutlet UILabel *rigid_b;
@property (nonatomic, retain) IBOutlet UILabel *rigid_c;
@property (nonatomic, retain) IBOutlet UILabel *rigid_d;
@property (nonatomic, retain) IBOutlet UILabel *max_flex_a;
@property (nonatomic, retain) IBOutlet UILabel *max_flex_b;
@property (nonatomic, retain) IBOutlet UILabel *max_flex_c;
@property (nonatomic, retain) IBOutlet UILabel *max_flex_d;
@property (nonatomic, retain) IBOutlet UILabel *flex_a;
@property (nonatomic, retain) IBOutlet UILabel *flex_b;
@property (nonatomic, retain) IBOutlet UILabel *flex_c;
@property (nonatomic, retain) IBOutlet UILabel *flex_d;
@property (nonatomic, assign) int uniqueId;

@end
