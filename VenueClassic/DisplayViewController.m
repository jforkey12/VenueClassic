//
//  DisplayViewController.m
//  VenueClassic
//
//  Created by James Forkey on 7/16/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController

@synthesize timerLabel2;
@synthesize clock;
@synthesize _dateFormatter;
@synthesize _dateFormatter2;
@synthesize dateLabel2;

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
    timerLabel2.text = [formatter stringFromDate:[NSDate date]];
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
    [timerLabel2 setNumberOfLines:0];
    [timerLabel2 setBackgroundColor:[UIColor clearColor]];
    [timerLabel2 setFont:[UIFont boldSystemFontOfSize:14]];
    [timerLabel2 setTextColor:[UIColor whiteColor]];
    
    NSDate *today = [[NSDate alloc] init];
    _dateFormatter = [[NSDateFormatter alloc] init];
    [self._dateFormatter setDateFormat:@"HH:mm a"];
    
    NSString *currentTime = [self._dateFormatter stringFromDate: today];
    self.timerLabel2.text = currentTime;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                             target:self
                                           selector:@selector(pollTime)
                                           userInfo:nil
                                            repeats:YES];
    [dateLabel2 setNumberOfLines:0];
    [dateLabel2 setBackgroundColor:[UIColor clearColor]];
    [dateLabel2 setFont:[UIFont boldSystemFontOfSize:14]];
    [dateLabel2 setTextColor:[UIColor whiteColor]];
    
    NSDate *today2 = [[NSDate alloc] init];
    _dateFormatter2 = [[NSDateFormatter alloc] init];
    [self._dateFormatter2 setDateFormat:@"EEEE MMMM d, yyyy"];
    
    NSString *currentTime2 = [self._dateFormatter2 stringFromDate: today2];
    self.dateLabel2.text = currentTime2;
    
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
    self.timerLabel2.text = currentTime;
}
- (void) pollTime2
{
    NSDate *today2 = [[NSDate alloc] init];
    NSString *currentTime2 = [self._dateFormatter2 stringFromDate: today2];
    self.dateLabel2.text = currentTime2;
}

- (void)viewDidUnload
{
    timerLabel2 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
