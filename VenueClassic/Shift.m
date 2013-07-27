//
//  Shift.m
//  VenueClassic
//
//  Created by James Forkey on 10/20/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "Shift.h"

@implementation Shift

@synthesize serviceNumber;
@synthesize serviceEndTime;
@synthesize date;
@synthesize serviceStartTime;
@synthesize minutes;
@synthesize casino;
@synthesize tables;
@synthesize comp;
@synthesize shiftNumber;
@synthesize contractRevenue;
@synthesize user;
@synthesize name;


-(void) setShiftNumber:(NSString *)n
{
    shiftNumber = n;
    
}

-(void) setUserType:(NSString *)setUser
{
    user = setUser;
}
-(void) setServiceStartTime:(NSString *)setSTime
{
    serviceStartTime = setSTime;
}

-(void) setServiceEndTime:(NSString *)setETime
{
    serviceEndTime = setETime;
}

-(void) setServiceNumber:(NSNumber *)setSNumber
{
    serviceNumber = setSNumber;
}

-(void) setMinutes:(NSNumber *)mins
{
    minutes = mins;
}

-(void) setComp:(NSString *)c
{
    comp = c;
}

-(void) setCasino:(NSString *)cas
{
    casino = cas;
}
-(void) setContractRevenue:(NSString *)cr
{
    contractRevenue = cr;
}
-(void) setTables:(NSString *)t
{
    tables = t;
}

-(void) setDate:(NSString *)d
{
    date = d;
}
-(void) setLMT:(NSString *)lmt
{
    name = lmt;
}
-(NSString *) description
{
    NSString *temp = [NSString stringWithFormat:@"%@ , %@ , %@ , %@ , %@ , %@ , %@ , %@ , %@ , %@ , %@", serviceNumber, date, name, shiftNumber, serviceStartTime, serviceEndTime, contractRevenue, user, casino, tables, comp];
    
    return temp;
    
}

@end
