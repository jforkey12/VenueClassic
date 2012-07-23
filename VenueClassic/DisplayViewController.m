//
//  NSTimerViewController.m
//  NSTimer
//
//  Created by Lenzo on 29.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DisplayViewController.h"

@implementation DisplayViewController
@synthesize secondLabel;
@synthesize totalMassages;
@synthesize totalMinutes;
@synthesize timeString2;
@synthesize minutesString;
@synthesize timerLabel1;
@synthesize dateLabel1;
@synthesize _dateFormatter;
@synthesize _dateFormatter2;

int totalMassages1;
int totalMinutes2;
int active = 0;

NSDate *currentDate2;
NSTimeInterval timeInterval2;
NSDate *timerDate2;
NSDateFormatter *dateFormatter2;

NSDate *currentDate3;
NSTimeInterval timeInterval3;
NSDate *timerDate3;

-(IBAction)startSecond:(id)sender {
    
    startDate = [NSDate date];
    
 //   if (active == 0)
//    {
//        active = 1;
    secondTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
 //   }
 //   else if (active == 1)
//{
 //       active = 0;
 //       secondTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:NO];
//    }
}


-(void)updateTimerSecond 
{
    currentDate2 = [NSDate date];
    timeInterval2 = [currentDate2 timeIntervalSinceDate:startDate];
    timerDate2 = [NSDate dateWithTimeIntervalSince1970:-timeInterval2 +60];
    
    currentDate3 = [NSDate date];
    timeInterval3 = [currentDate3 timeIntervalSinceDate:startDate];
    timerDate3 = [NSDate dateWithTimeIntervalSince1970:-timeInterval3 +60];
    
    dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"mm:ss"];
    [dateFormatter2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    timeString2 = [dateFormatter2 stringFromDate:timerDate2];
    secondLabel.text = timeString2;
    
    NSDateFormatter *dateFormatter3 = [[NSDateFormatter alloc] init];
    [dateFormatter3 setDateFormat:@"mm"];
    [dateFormatter3 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    timeString2 = [dateFormatter2 stringFromDate:timerDate2];
    
    minutesString = [NSString stringWithFormat:@"Total: %s Minutes", timeString2];
    totalMinutes.text = minutesString;
    
}

-(IBAction)stopNext:(id)sender
{
    totalMassages1 = totalMassages1 + 1;
    NSString *intString = [NSString stringWithFormat:@"%d Massages", totalMassages1];
    totalMassages.text = intString;
    
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
    
    dateTimer = [NSTimer scheduledTimerWithTimeInterval:.1
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
    
    dateTimer = [NSTimer scheduledTimerWithTimeInterval:.1
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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void)viewDidLoad
{ 
    [super viewDidLoad];
}
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)LockIt {    
    [self performSegueWithIdentifier:@"LockSuccessful" sender:self];
}

-(IBAction)finishMassage:(id)sender {
    [self performSegueWithIdentifier:@"massageFinished" sender:self];
}

@end
