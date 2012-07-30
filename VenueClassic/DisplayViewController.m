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
@synthesize timerLabel1;
@synthesize dateLabel1;
@synthesize _dateFormatter;
@synthesize _dateFormatter2;
@synthesize compSwitch;
@synthesize compFormatter;
@synthesize dateFormatter3;
@synthesize addTimeDateFormatter;
@synthesize doneButton;
@synthesize startStop;
@synthesize addDoneButton;

@synthesize addTimeLabel;

int totalMassages1;
int timeToAdd;


NSTimeInterval timeInterval2;
NSDate *timerDate2;

NSDate *compDate;
NSTimeInterval compTimeInterval;
NSDate *compTimerDate;


NSDate *addTimeDate;
NSTimeInterval _pauseTimeInterval;


-(IBAction)startStop:(id)sender {
    
    if ([startStop.titleLabel.text isEqualToString:@"Start"]) 
    {
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _startDate = [NSDate date];

        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
        
        
        
    } else if ([startStop.titleLabel.text isEqualToString:@"Pause"])
    {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [secondTimer invalidate];
        [totalMinutesTimer invalidate];
        totalMinutesTimer =nil;
        secondTimer = nil;
        [self updateTotalTime];
        [self updateTimerSecond];
        
    } else if ([startStop.titleLabel.text isEqualToString:@"Resume"])
    {
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _startDate = [NSDate date];
        _startDate = [_startDate dateByAddingTimeInterval:((-1)*(_pauseTimeInterval))];
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
    }
}
    
    
-(void)updateTotalTime 
{
    NSDate *currentDate = [NSDate date];
    
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:_startDate];    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mmm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    
    _pauseTimeInterval = timeInterval;
    
    totalMinutes.text = timeString;
}


-(void)updateTimerSecond 
{

    NSDate *currentDate = [NSDate date];
    
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:_startDate];    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:-timeInterval];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mmm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    timeString2 = [dateFormatter stringFromDate:timerDate];;
    _pauseTimeInterval = timeInterval;
    
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
    if([secondLabel.text isEqualToString:@"000:02"])
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    if ([secondLabel.text isEqualToString:@"000:00"])
    {
        [secondTimer invalidate];
        [totalMinutesTimer invalidate];
        audioPlayer.numberOfLoops = 0;
        [audioPlayer play];
        [secondLabel setTextColor:[UIColor whiteColor]];
        [startStop setTitle:@"Start" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


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
    addTimeLabel.hidden = false;
}


-(IBAction)toggleEnabledForCompSwitch:(id)sender 
{
    if (compSwitch.on) 
    {
        compDate = [NSDate date];
      //  compTimeInterval = [*currentDate timeIntervalSinceDate:startDate];
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
    
    [startStop setTitle:@"Start" forState:UIControlStateNormal];
    [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [secondTimer invalidate];
    [totalMinutesTimer invalidate];
    
    [secondLabel setTextColor:[UIColor whiteColor]];
    [secondLabel setText:@"000:00"];
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
     addDoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addDoneButton.frame = CGRectMake(0, 163, 106, 53);
    addDoneButton.adjustsImageWhenHighlighted = NO;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
        [addDoneButton setImage:[UIImage imageNamed:@"doneup.png"] forState:UIControlStateNormal];
        [addDoneButton setImage:[UIImage imageNamed:@"donedown.png"] forState:UIControlStateHighlighted];
    } else {        
        [addDoneButton setImage:[UIImage imageNamed:@"doneup.png"] forState:UIControlStateNormal];
        [addDoneButton setImage:[UIImage imageNamed:@"donedown.png"] forState:UIControlStateHighlighted];
    }
    [addDoneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView* keyboard;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        
        // keyboard found, add the button
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
                [keyboard addSubview:addDoneButton];
        } else {
            if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
                [keyboard addSubview:addDoneButton];
        }
    }
    
    
}

- (void)doneButton:(id)sender {

    NSInteger theInteger = [addTimeLabel.text intValue];
    
    if ([startStop.titleLabel.text isEqualToString:@"Pause"])
    {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [secondTimer invalidate];
        [totalMinutesTimer invalidate];
        totalMinutesTimer =nil;
        secondTimer = nil;
        [self updateTotalTime];
        [self updateTimerSecond];
        
        
    } else if ([startStop.titleLabel.text isEqualToString:@"Resume"])
    {
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _startDate = [NSDate date];
        _startDate = [_startDate dateByAddingTimeInterval:((-1)*(_pauseTimeInterval) +theInteger*60)];
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
    }
    
    [self.view endEditing:TRUE];
    addTimeLabel.hidden =TRUE;
    
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
