//
//  InformationViewController.h
//  VenueClassic
//
//  Created by H&F Solutions.
//  Copyright 2012 H&F Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController <UITextFieldDelegate> {
    
    NSTimer *timer;
    NSDateFormatter *_dateFormatter;
    NSDateFormatter *_dateFormatter2;
}

@property(nonatomic, retain) IBOutlet UILabel *timerLabel1;
@property(nonatomic, retain) IBOutlet UITextField *_name;
@property(nonatomic, retain) IBOutlet UITextField *_email;
@property(nonatomic, retain) IBOutlet UITextField *_shift_number;
@property(nonatomic, retain) IBOutlet UISegmentedControl *_user_type;
@property(nonatomic, retain) IBOutlet UISegmentedControl *_casino;
@property(nonatomic, retain) NSDateFormatter *_dateFormatter;
@property(nonatomic, retain) IBOutlet UILabel *dateLabel1;
@property(nonatomic, retain) NSDateFormatter *_dateFormatter2;
@property(nonatomic, retain) UIAlertView *alertsuccess;
@property(nonatomic, retain) IBOutlet UISegmentedControl *tableType;
@property(nonatomic, retain) NSString *tablesString;
@property(nonatomic, retain) NSString *casinoString;
@property(nonatomic, retain) NSString *userTypeString;
@property(nonatomic, retain) NSString *shiftNumberString;
@property(nonatomic, retain) NSString *emailString;
@property(nonatomic, retain) NSString *nameString;

-(IBAction)textFieldFinished:(id) textField;
-(IBAction)backgroundTouched:(id)textField;
-(IBAction)tables:(id)sender;
-(IBAction)casino:(id)sender;
-(IBAction)user:(id)sender;

-(IBAction)CheckFieldsAlert:(id)sender;

@end
