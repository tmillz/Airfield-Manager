//
//  AircraftDetails.h
//  Airfield-Manager
//
//  Created by Terry on 9/10/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AircraftDetails : NSObject {
    int _uniqueId;
    NSString *_aircraft;
    NSString *_wing_span;
    NSString *_length;
    NSString *_height;
    NSString *_Vert_clr;
    NSString *_max_to_wt;
    NSString *_basic_empty_wt;
    NSString *_turn_radius;
    NSString *_turn_diameter;
    NSString *_acn_max_weight;
    NSString *_max_rigid_a;
    NSString *_max_rigid_b;
    NSString *_max_rigid_c;
    NSString *_max_rigid_d;
    NSString *_acn_weight_min;
    NSString *_rigid_a;
    NSString *_rigid_b;
    NSString *_rigid_c;
    NSString *_rigid_d;
    NSString *_max_flex_a;
    NSString *_max_flex_b;
    NSString *_max_flex_c;
    NSString *_max_flex_d;
    NSString *_flex_a;
    NSString *_flex_b;
    NSString *_flex_c;
    NSString *_flex_d;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *aircraft;
@property (nonatomic, copy) NSString *wing_span;
@property (nonatomic, copy) NSString *length;
@property (nonatomic, copy) NSString *height;
@property (nonatomic, copy) NSString *Vert_clr;
@property (nonatomic, copy) NSString *max_to_wt;
@property (nonatomic, copy) NSString *basic_empty_wt;
@property (nonatomic, copy) NSString *turn_radius;
@property (nonatomic, copy) NSString *turn_diameter;
@property (nonatomic, copy) NSString *acn_max_weight;
@property (nonatomic, copy) NSString *max_rigid_a;
@property (nonatomic, copy) NSString *max_rigid_b;
@property (nonatomic, copy) NSString *max_rigid_c;
@property (nonatomic, copy) NSString *max_rigid_d;
@property (nonatomic, copy) NSString *acn_weight_min;
@property (nonatomic, copy) NSString *rigid_a;
@property (nonatomic, copy) NSString *rigid_b;
@property (nonatomic, copy) NSString *rigid_c;
@property (nonatomic, copy) NSString *rigid_d;
@property (nonatomic, copy) NSString *max_flex_a;
@property (nonatomic, copy) NSString *max_flex_b;
@property (nonatomic, copy) NSString *max_flex_c;
@property (nonatomic, copy) NSString *max_flex_d;
@property (nonatomic, copy) NSString *flex_a;
@property (nonatomic, copy) NSString *flex_b;
@property (nonatomic, copy) NSString *flex_c;
@property (nonatomic, copy) NSString *flex_d;


- (id)initWithUniqueId:(int)uniqueId aircraft:(NSString *)aircraft wing_span:(NSString *)wing_span length:(NSString *)length height:(NSString *)height Vert_clr:(NSString *)Vert_clr max_to_wt:(NSString *)max_to_wt basic_empty_wt:(NSString *)basic_empty_wt turn_radius:(NSString *)turn_radius turn_diameter:(NSString *)turn_diameter acn_max_weight:(NSString *)acn_max_weight max_rigid_a:(NSString *)max_rigid_a max_rigid_b:(NSString *)max_rigid_b max_rigid_c:(NSString *)max_rigid_c max_rigid_d:(NSString *)max_rigid_d acn_weight_min:(NSString *)acn_weight_min rigid_a:(NSString *)rigid_a rigid_b:(NSString *)rigid_b rigid_c:(NSString *)rigid_c rigid_d:(NSString *)rigid_d max_flex_a:(NSString *)max_flex_a max_flex_b:(NSString *)max_flex_b max_flex_c:(NSString *)max_flex_c max_flex_d:(NSString *)max_flex_d flex_a:(NSString *)flex_a flex_b:(NSString *)flex_b flex_c:(NSString *)flex_c flex_d:(NSString *)flex_d;

@end