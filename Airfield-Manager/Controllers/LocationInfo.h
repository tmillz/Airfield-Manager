//
//  LocationInfo.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 2/12/16.
//  Copyright © 2016 Terrance Miller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationInfo : NSObject {
    int _uniqueId;
    NSString *_field_lat;
    NSString *_field_lng;
    NSString *_field_disc;
    NSString *_field_pic;
    NSString *_field_date;
    NSString *_field_name;
    NSString *_field_notes;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *field_lat;
@property (nonatomic, copy) NSString *field_lng;
@property (nonatomic, copy) NSString *field_disc;
@property (nonatomic, copy) NSString *field_pic;
@property (nonatomic, copy) NSString *field_date;
@property (nonatomic, copy) NSString *field_name;
@property (nonatomic, copy) NSString *field_notes;


- (id)initWithUniqueId:(int)uniqueId field_lat:(NSString *)field_lat field_lng:(NSString *)field_lng field_disc:(NSString *)field_disc field_pic:(NSString *)field_pic field_date:(NSString *)field_date field_name:(NSString *)field_name field_notes:(NSString *)field_notes;

@end
