//
//  NSTimerViewController.m
//  NSTimer
//
//  Created by Lenzo on 29.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DisplayViewController.h"
#import "AudioToolbox/AudioToolbox.h"
#import "AVFoundation/AVAudioPlayer.h"

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
@synthesize compSwitch;
@synthesize compFormatter;
@synthesize dateFormatter3;
@synthesize doneButton;
@synthesize active;
@synthesize start;

@synthesize addTimeLabel;

int totalMassages1;
int totalMinutes2;
int timeToAdd;


NSDate *currentDate2;
NSTimeInterval timeInterval2;
NSDate *timerDate2;
NSDateFormatter *dateFormatter2;

NSDate *currentDate3;
NSTimeInterval timeInterval3;
NSDate *timerDate3;

NSDate *compDate;
NSTimeInterval compTimeInterval;
NSDate *compTimerDate;

NSDate *onPauseDate;
NSTimeInterval onPauseTimeInterval;
NSDate *newDate;

NSDate *resumeDate;
NSTimeInterval ResumeInterval;

-(IBAction)startSecond:(id)sender {
    
    startDate = [NSDate date];
    
    dateTimer = [NSTimer scheduledTimerWithTimeInterval:.1
                                                 target:self
                                               selector:@selector(pollTime)
                                               userInfo:nil
                                                repeats:YES];
    
   if (start == 0)
   {
       [self setActive:YES];
       NSLog(@"active value is %d", active);
       
    secondTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
       
    totalTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
    }
    else if (start == 1)
    {
        if(active)
        {
            [self setActive:NO];
            onPauseDate = [NSDate date]; 
            onPauseTimeInterval = [onPauseDate timeIntervalSinceDate:newDate];
            [secondTimer invalidate];
        }
        else if(!active)
        {
            NSDate *dateNow = [NSDate date];
            [self setActive:YES];
            resumeDate = [NSDate date];
            newDate = [NSDate dateWithTimeInterval:-onPauseTimeInterval sinceDate:dateNow];
            
        }
    }
}
-(void)updateTotalTime 
{
    currentDate2 = [NSDate date];
    timeInterval2 = [currentDate2 timeIntervalSinceDate:startDate];
    timerDate2 = [NSDate dateWithTimeIntervalSince1970:timeInterval2 +62];
    
    dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"mmm"];
    [dateFormatter2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    timeString2 = [dateFormatter2 stringFromDate:timerDate2];
    totalMinutes.text = timeString2;
    
}


-(void)updateTimerSecond 
{
    currentDate2 = [NSDate date];
    timeInterval2 = [currentDate2 timeIntervalSinceDate:startDate];
    timerDate2 = [NSDate dateWithTimeIntervalSince1970:-timeInterval2 +62];
    
    dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"mmm:ss"];
    [dateFormatter2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    timeString2 = [dateFormatter2 stringFromDate:timerDate2];
    secondLabel.text = timeString2;
    
    if ([secondLabel.text isEqualToString:@"000:59"]) 
    {
        [secondLabel setTextColor:[UIColor redColor]];
    }
    if ([secondLabel.text isEqualToString:@"000:09"]) 
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    if ([secondLabel.text isEqualToString:@"000:07"]) 
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    if ([secondLabel.text isEqualToString:@"000:05"]) 
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    if([secondLabel.text isEqualToString:@"000:03"])
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    if([secondLabel.text isEqualToString:@"000:01"])
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        audioPlayer.numberOfLoops = 0;
        [audioPlayer play];
    }
    if ([secondLabel.text isEqualToString:@"000:00"])
    {
        [secondTimer invalidate];
        [secondLabel setTextColor:[UIColor whiteColor]];
        timeString2 = @"000:00";
        secondLabel.text = @"000:00";
         
    }

}

-(IBAction)addTime:(id)sender
{
    
    [addTimeLabel becomeFirstResponder];
    
    [doneButton addTarget:self action:@selector(doneButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView* keyboard = nil;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        // keyboard found, add the button
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
                [keyboard addSubview:doneButton];
        } else {
            if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
                [keyboard addSubview:doneButton];
        }
    }

    
    timeToAdd = 0;
    
    addTimeLabel.hidden = false;
    
    NSString *intString = [NSString stringWithFormat:@"%d", timeToAdd];
    
    addTimeLabel.text = intString;
    
    
  // double convert = [timeString2 doubleValue] + [addTimeLabel.text doubleValue];
    
  //  NSString *convertToString = [[NSString alloc] initWithFormat:@"%d", convert];

}


-(IBAction)toggleEnabledForCompSwitch:(id)sender 
{
    if (compSwitch.on) 
    {
        compDate = [NSDate date];
        compTimeInterval = [currentDate2 timeIntervalSinceDate:startDate];
        compTimerDate = [NSDate dateWithTimeIntervalSince1970:compTimeInterval];
        
        compFormatter = [[NSDateFormatter alloc] init];
        [compFormatter setDateFormat:@"mm:ss"];
        [compFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
        timeString2 = [compFormatter stringFromDate:timerDate2];
    }
}


-(IBAction)stopNext:(id)sender
{
    totalMassages1 = totalMassages1 + 1;
    NSString *intString = [NSString stringWithFormat:@"%d Massages", totalMassages1];
    totalMassages.text = intString;
    
    [secondTimer invalidate];
    [secondLabel setTextColor:[UIColor whiteColor]];
    secondLabel.text = @"000:00";    
}

- (void)viewDidLoad
{
        
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(keyboardDidShow:) 
                                                     name:UIKeyboardDidShowNotification 
                                                   object:nil];     
    } else {
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(keyboardWillShow:) 
                                                     name:UIKeyboardWillShowNotification 
                                                   object:nil];
    }
    
    [timerLabel1 setNumberOfLines:0];
    [timerLabel1 setBackgroundColor:[UIColor clearColor]];
    [timerLabel1 setFont:[UIFont boldSystemFontOfSize:14]];
    [timerLabel1 setTextColor:[UIColor whiteColor]];
    
    addTimeLabel.hidden=TRUE;
    
    NSDate *today = [[NSDate alloc] init];
    _dateFormatter = [[NSDateFormatter alloc] init];
    [self._dateFormatter setDateFormat:@"H:mm a"];
    
    NSString *currentTime = [self._dateFormatter stringFromDate: today];
    self.timerLabel1.text = currentTime;
    
    
    [dateLabel1 setNumberOfLines:0];
    [dateLabel1 setBackgroundColor:[UIColor clearColor]];
    [dateLabel1 setFont:[UIFont boldSystemFontOfSize:14]];
    [dateLabel1 setTextColor:[UIColor whiteColor]];
    
    NSDate *today2 = [[NSDate alloc] init];
    _dateFormatter2 = [[NSDateFormatter alloc] init];
    [self._dateFormatter2 setDateFormat:@"EEEE MMMM d, yyyy"];
    
    NSString *currentTime2 = [self._dateFormatter2 stringFromDate: today2];
    self.dateLabel1.text = currentTime2;
    
  /*  dateTimer2 = [NSTimer scheduledTimerWithTimeInterval:60
                                             target:self
                                           selector:@selector(pollTime2)
                                           userInfo:nil
                                            repeats:YES];
*/
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/MSCTY.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
                                                           
}

- (void) pollTotalTime
{
    NSDate *totalTime = [[NSDate alloc] init];
    NSString *countertime = [self.dateFormatter3 stringFromDate: totalTime];
    self.totalMinutes.text = countertime;
}

- (void) pollTime
{
    NSDate *today = [[NSDate alloc] init];
    NSString *currentTime = [self._dateFormatter stringFromDate: today];
    self.timerLabel1.text = currentTime;
}

/*- (void) pollTime2
{
    NSDate *today2 = [[NSDate alloc] init];
    NSString *currentTime2 = [self._dateFormatter2 stringFromDate: today2];
    self.dateLabel1.text = currentTime2;
}
*/
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


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



- (void)keyboardWillShow:(NSNotification *)note {
    {
        [self addButtonToKeyboard];
    }
}

- (void)keyboardDidShow:(NSNotification *)note {
    // if clause is just an additional precaution, you could also dismiss it
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
        [self addButtonToKeyboard];
    }
}

- (void)addButtonToKeyboard {
    // create custom button
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 163, 106, 53);
    doneButton.adjustsImageWhenHighlighted = NO;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
        [doneButton setImage:[UIImage imageNamed:@"doneup.png"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"donedown.png"] forState:UIControlStateHighlighted];
    } else {        
        [doneButton setImage:[UIImage imageNamed:@"doneup.png"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"donedown.png"] forState:UIControlStateHighlighted];
    }
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView* keyboard;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        
        // keyboard found, add the button
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
                [keyboard addSubview:doneButton];
        } else {
            if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
                [keyboard addSubview:doneButton];
        }
    }
    
    
}

- (void)doneButton:(id)sender {
    
    currentDate2 = [NSDate date];
    timeInterval2 = [currentDate2 timeIntervalSinceDate:startDate];
    timerDate2 = [NSDate dateWithTimeIntervalSince1970:-timeInterval2 +timeToAdd*60];
    
    timeString2 = [dateFormatter2 stringFromDate:timerDate2];
    
    addTimeLabel.hidden = TRUE;
    [self.view endEditing:TRUE];
}

-(IBAction)endShift:(id)sender
{
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail])
    {
        [composer setToRecipients:[NSArray arrayWithObject:@"jmforkey@wpi.edu"]];
        [composer setSubject:@"Venue Classic iOS Receipt"];
        [composer setMessageBody:@"" isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentModalViewController:composer animated:YES];
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if(error)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error" message:[NSString stringWithFormat:@"error %@", [error description]] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        
        [self dismissModalViewControllerAnimated:YES];
    }
}

@end
