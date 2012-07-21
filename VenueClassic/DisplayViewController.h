//
//  NSTimerViewController.h
//  NSTimer
//
//  Created by Lenzo on 29.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController {
    
    UILabel *mainLabel;
    UILabel *secondLabel;
    UILabel *totalMassages;
    UILabel *totalMinutes;
    UILabel *timerLabel1;
    UILabel *dateLabel1;
    
    NSTimer *dateTimer;
    NSTimer *mainTimer;
    NSTimer *secondTimer;
    
    NSDate *startDateMain;
    NSDate *startDate;
    NSString *timeString2;
    NSString *minutesString;
    
}

@property(nonatomic, retain)IBOutlet UILabel *secondLabel;
@property(nonatomic, retain)IBOutlet UILabel *totalMassages;
@property(nonatomic, retain)IBOutlet UILabel *totalMinutes;
@property(nonatomic, retain)IBOutlet NSString *timeString2;
@property(nonatomic, retain)IBOutlet NSString *minutesString;
@property(nonatomic, retain)IBOutlet UILabel *timerLabel1;
@property(nonatomic, retain)IBOutlet UILabel *dateLabel1;
@property (nonatomic, retain) NSDateFormatter *_dateFormatter;
@property (nonatomic, retain) NSDateFormatter *_dateFormatter2;

-(IBAction)startSecond:(id)sender;
-(IBAction)stopNext:(id)sender;

@end
