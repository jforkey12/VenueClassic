//
//  InformationViewController.h
//  VenueClassic
//
//  Created by James Forkey on 7/12/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController {

    IBOutlet UILabel *timerLabel1;
    IBOutlet UILabel *dateLabel1;
    IBOutlet UITextField *_name;
    IBOutlet UITextField *_email;
    IBOutlet UITextField *_shift_number;
    IBOutlet UISegmentedControl *_user_type;
    
    NSTimer *timer;
    NSDateFormatter *_dateFormatter;
    NSDateFormatter *_dateFormatter2;
}

@property (nonatomic, retain) UILabel *timerLabel1;
@property (strong, nonatomic) UITextField *_name;
@property (strong, nonatomic) UITextField *_email;
@property (strong, nonatomic) UITextField *_shift_number;
@property (strong, nonatomic) UISegmentedControl *_user_type;
@property (nonatomic, retain) NSDateFormatter *_dateFormatter;
@property (nonatomic, retain) UILabel *dateLabel1;
@property (nonatomic, retain) NSDateFormatter *_dateFormatter2;
@property (nonatomic, retain) UIAlertView *alertsuccess;

-(BOOL)hideKeyboard:(id)sender;
-(BOOL)backgroundTouched:(id)sender;
-(void)updateTimer;

-(IBAction)CheckFieldsAlert;

@end
