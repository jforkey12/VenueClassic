//
//  InformationViewController.m
//  VenueClassic
//
//  Created by James Forkey on 7/12/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController


@synthesize timerLabel1;
@synthesize dateLabel1;
@synthesize _name;
@synthesize _email;
@synthesize _shift_number;
@synthesize _user_type;
@synthesize _dateFormatter;
@synthesize _dateFormatter2;
@synthesize alertsuccess;

-(BOOL) hideKeyboard:(UITextField *) textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL) backgroundTouched:(UITextField *) textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) updateTimer 
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc ] init];
    timerLabel1.text = [formatter stringFromDate:[NSDate date]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [timerLabel1 setNumberOfLines:0];
    [timerLabel1 setBackgroundColor:[UIColor clearColor]];
    [timerLabel1 setFont:[UIFont boldSystemFontOfSize:14]];
    [timerLabel1 setTextColor:[UIColor whiteColor]];
    
    NSDate *today = [[NSDate alloc] init];
    _dateFormatter = [[NSDateFormatter alloc] init];
    [self._dateFormatter setDateFormat:@"H:mm a"];
    
    NSString *currentTime = [self._dateFormatter stringFromDate: today];
    self.timerLabel1.text = currentTime;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                                    target:self
                                                  selector:@selector(pollTime)
                                                  userInfo:nil
                                                   repeats:YES];
    
    [dateLabel1 setNumberOfLines:0];
    [dateLabel1 setBackgroundColor:[UIColor clearColor]];
    [dateLabel1 setFont:[UIFont boldSystemFontOfSize:14]];
    [dateLabel1 setTextColor:[UIColor whiteColor]];
    
    NSDate *today2 = [[NSDate alloc] init];
    _dateFormatter2 = [[NSDateFormatter alloc] init];
    [self._dateFormatter2 setDateFormat:@"EEEE MMMM d, yyyy"];
    
    NSString *currentTime2 = [self._dateFormatter2 stringFromDate: today2];
    self.dateLabel1.text = currentTime2;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                             target:self
                                           selector:@selector(pollTime2)
                                           userInfo:nil
                                            repeats:YES];
       
}

- (void) pollTime
{
    NSDate *today = [[NSDate alloc] init];
    NSString *currentTime = [self._dateFormatter stringFromDate: today];
    self.timerLabel1.text = currentTime;
}

- (void) pollTime2
{
    NSDate *today2 = [[NSDate alloc] init];
    NSString *currentTime2 = [self._dateFormatter2 stringFromDate: today2];
    self.dateLabel1.text = currentTime2;
}

- (void)viewDidUnload
{
    timerLabel1 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)CheckFieldsAlert {
    UIAlertView *checkFieldsFail = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Empty Field" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];   
    [checkFieldsFail show];

}


@end
