//
//  Shift.h
//  VenueClassic
//
//  Created by James Forkey on 10/20/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shift : NSObject

{
    NSDate *date;
    NSString *serviceStartTime;
    NSString *serviceEndTime;
    NSString *shiftNumber;
    NSNumber *serviceNumber;
    NSNumber *minutes;
    NSString *contractRevenue;
    NSString *casino;
    NSString *tables;
    NSString *comp;
    NSString *user;
}

@property(nonatomic, retain) NSDate *date;
@property(nonatomic, retain) NSString *serviceStartTime;
@property(nonatomic, retain) NSString *serviceEndTime;
@property(nonatomic, retain) NSString *shiftNumber;
@property(nonatomic, retain) NSNumber *serviceNumber;
@property(nonatomic, retain) NSNumber *minutes;
@property(nonatomic, retain) NSString *casino;
@property(nonatomic, retain) NSString *tables;
@property(nonatomic, retain) NSString *comp;
@property(nonatomic, retain) NSString *contractRevenue;
@property(nonatomic, retain) NSString *user;

@end
