//
//  NSTimerViewController.m
//  NSTimer
//
//  Created by HF Solutions.
//  Copyright 2012 H&F Solutions. All rights reserved.
//

#import "DisplayViewController.h"
#import "AudioToolbox/AudioToolbox.h"
#import "AVFoundation/AVAudioPlayer.h"
#import "InformationViewController.h"

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
@synthesize addTimeTextField;
@synthesize slideToUnlock;  
@synthesize lockButton;  
@synthesize myLabel;  
@synthesize container;
@synthesize stopNextButton;
@synthesize endShiftButton;
@synthesize tableType;
@synthesize plusButton;
@synthesize minusButton;
@synthesize compLabel;
@synthesize totalLabel;
@synthesize minutesLabel;
@synthesize moneyLabel;
@synthesize alarmImage;
@synthesize casinoString;
@synthesize userTypeString;
@synthesize nameString;
@synthesize emailString;
@synthesize tablesString;
@synthesize shiftNumberString;
@synthesize gregorian;
@synthesize components;
@synthesize currentTimeDateFormatter;
@synthesize timeComponents;
@synthesize totalTimeGregorian;

bool UNLOCKED = YES;

int totalMassages1;
int timeToAdd;
int unitFlags;
int timeUnitFlags;
int addOrSubtract;
int rate;
double smallRate;
double totalMoneyDouble;

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
        if (secondLabel.text =@"00:00:00") {
            
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _startDate = [NSDate date];
        _dateFormatter = [[NSDateFormatter alloc] init];
        [self._dateFormatter setDateFormat:@"hh:mm:ss"];
        [self._dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
        _startDate = [_startDate dateByAddingTimeInterval:(60*60)];
            
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
            
        totalMoneyTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(updateTotalMoney) userInfo:nil repeats:YES];
   
        }
        else {
            
        }
        
    } else if ([startStop.titleLabel.text isEqualToString:@"Pause"])
    {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [secondTimer invalidate];
        [totalMinutesTimer invalidate];
        [totalMoneyTimer invalidate];
        totalMinutesTimer = nil;
        secondTimer = nil;
        totalMoneyTimer = nil;
        [self updateTotalTime];
        [self updateTimerSecond];
        [self updateTotalMoney];
        
    } else if ([startStop.titleLabel.text isEqualToString:@"Resume"])
    {
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _startDate = [NSDate date];
        _startDate = [_startDate dateByAddingTimeInterval:((-1)*(_pauseTimeInterval))];
        
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
        totalMoneyTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(updateTotalMoney) userInfo:nil repeats:YES];
        
    }
}
    
    
-(void)updateTotalTime 
{
    
    NSDate *now = [NSDate date];
    
    NSTimeInterval timeInterval = [now timeIntervalSinceDate:_startDate];    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    totalTimeGregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    timeUnitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    timeComponents = [totalTimeGregorian components:timeUnitFlags fromDate:_startDate toDate:now options:0];
    
    totalMinutes.text = [NSString stringWithFormat:@"%02d:%02d:%02d", timeComponents.hour, timeComponents.minute, timeComponents.second];
    
    _pauseTimeInterval = timeInterval;

}

-(void)updateTotalMoney 
{
    totalMoneyDouble = totalMoneyDouble + smallRate;
    NSString* temp = [NSString stringWithFormat:@"$%.2f", totalMoneyDouble];
    moneyLabel.text = temp;
}


-(void)updateTimerSecond 
{
    NSDate *now = [NSDate date];

    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
     components = [gregorian components:unitFlags fromDate:now toDate:_startDate options:0];
    
    secondLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", components.hour, components.minute, components.second ];
    
    if ([secondLabel.text isEqualToString:@"00:00:59"]) 
    {
        [secondLabel setTextColor:[UIColor redColor]];
    }
    if ([secondLabel.text isEqualToString:@"00:00:09"]) 
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [secondLabel setTextColor:[UIColor redColor]];
    }
    if ([secondLabel.text isEqualToString:@"00:00:07"]) 
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [secondLabel setTextColor:[UIColor redColor]];
    }
    if ([secondLabel.text isEqualToString:@"00:00:05"]) 
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [secondLabel setTextColor:[UIColor redColor]];
    }
    if([secondLabel.text isEqualToString:@"00:00:03"])
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [secondLabel setTextColor:[UIColor redColor]];
    }
    if([secondLabel.text isEqualToString:@"00:00:02"])
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [secondLabel setTextColor:[UIColor redColor]];
    }
    if ([secondLabel.text isEqualToString:@"00:00:00"])
    {
        [secondTimer invalidate];
        [totalMinutesTimer invalidate];
        [totalMoneyTimer invalidate];
        secondTimer = nil;
        totalMoneyTimer = nil;
        totalMinutesTimer =nil;
        audioPlayer.numberOfLoops = 0;
        [audioPlayer play];
        [secondLabel setTextColor:[UIColor whiteColor]];
        [startStop setTitle:@"Start" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}
- (IBAction)subtractTime:(id)sender {
    
    [secondTimer invalidate];
    [totalMinutesTimer invalidate];
    [totalMoneyTimer invalidate];
    totalMoneyTimer = nil;
    totalMinutesTimer =nil;
    secondTimer = nil;
    [self updateTotalMoney];
    [self updateTotalTime];
    [self updateTimerSecond];
    addOrSubtract = -1;
    
    if ([startStop.titleLabel.text isEqualToString:@"Pause"])
    {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    
    [addTimeTextField becomeFirstResponder];
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
            if([[keyboard description] hasPrefix:@"<UIKeyboardNumberPad"] == YES)
                [keyboard addSubview:doneButton];
        }
    }
    addTimeTextField.hidden = false;
}


-(IBAction)addTime:(id)sender
{
    [secondTimer invalidate];
    [totalMinutesTimer invalidate];
    [totalMoneyTimer invalidate];
    totalMoneyTimer = nil;
    totalMinutesTimer =nil;
    secondTimer = nil;
    [self updateTotalMoney];
    [self updateTotalTime];
    [self updateTimerSecond];
    addOrSubtract = 1;
    
     if ([startStop.titleLabel.text isEqualToString:@"Pause"])
    {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    }
   
    [addTimeTextField becomeFirstResponder];
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
            if([[keyboard description] hasPrefix:@"<UIKeyboardNumberPad"] == YES)
                [keyboard addSubview:doneButton];
        }
    }
    addTimeTextField.hidden = false;
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
    if ([startStop.titleLabel.text isEqualToString:@"Start"]) 
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Error"
                              message: @"It turns out you can't stop a service you haven't started."
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        
    } else if ([startStop.titleLabel.text isEqualToString:@"Pause"])
    {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [secondTimer invalidate];
        [totalMinutesTimer invalidate];
        [totalMoneyTimer invalidate];
        totalMoneyTimer = nil;
        totalMinutesTimer = nil;
        secondTimer = nil;
        [self updateTotalMoney];
        [self updateTotalTime];
        [self updateTimerSecond];
        
        NSString *totalMoney = [NSString stringWithFormat:@"$%.2f", totalMoneyDouble];
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle: totalMoney
                                      message: @"Do you really want to end the service?"
                                      delegate: self
                                      cancelButtonTitle:@"Cancel"
                                      otherButtonTitles:@"Yes",nil];
        
        [alertView setTag:1];
        [alertView show];

        
    } else if ([startStop.titleLabel.text isEqualToString:@"Resume"])
    {
        NSString *totalMoney = [NSString stringWithFormat:@"$%.2f", totalMoneyDouble];
        UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle: totalMoney
                                      message: @"Do you really want to end the service?"
                                      delegate: self
                                      cancelButtonTitle:@"Cancel"
                                      otherButtonTitles:@"Yes",nil];
        [alertView setTag:1];
        [alertView show];
        
    }

}

- (void)viewDidLoad
{
    if (userTypeString == @"Patron"){
        rate = 2;
        smallRate = .05;
    }
    else {
        rate =1;
        smallRate = .025;
    }
    
    UIImage *stetchLeftTrack= [[UIImage imageNamed:@"Nothing.png"]
                               stretchableImageWithLeftCapWidth:30.0 topCapHeight:0.0];
	UIImage *stetchRightTrack= [[UIImage imageNamed:@"Nothing.png"]
                                stretchableImageWithLeftCapWidth:30.0 topCapHeight:0.0];
	[slideToUnlock setThumbImage: [UIImage imageNamed:@"SlideToStop.png"] forState:UIControlStateNormal];
	[slideToUnlock setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
	[slideToUnlock setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal]; 

    slideToUnlock.hidden = true;
    myLabel.hidden = true;
    container.hidden = true;
    lockButton.hidden = false;
    
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
    
    addTimeTextField.hidden=TRUE;
    
    
    NSDate *today = [[NSDate alloc] init];
    currentTimeDateFormatter = [[NSDateFormatter alloc] init];
    [self.currentTimeDateFormatter setDateFormat:@"h:mm a"];
    
    NSString *currentTime = [self.currentTimeDateFormatter stringFromDate: today];
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
    

    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/MSCTY.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
    
}

- (void) pollTime
{
    NSDate *today = [[NSDate alloc] init];
    NSString *currentTime = [self.currentTimeDateFormatter stringFromDate: today];
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
    if(UNLOCKED) {
        slideToUnlock.hidden = false;
        container.hidden = false;
        myLabel.hidden = false;
        lockButton.hidden = true;
        totalMassages.hidden = true;
        totalMinutes.hidden = true;
        timerLabel1.hidden = true;
        dateLabel1.hidden = true;
        doneButton.hidden = true;
        startStop.hidden = true;
        addDoneButton.hidden = true;
        compSwitch.hidden = true;
        addTimeTextField.hidden = true;
        dateLabel1.hidden = true;
        stopNextButton.hidden = true;
        endShiftButton.hidden = true;
        tableType.hidden = true;
        plusButton.hidden = true;
        minusButton.hidden = true;
        compLabel.hidden = true;
        totalLabel.hidden = true;
        minutesLabel.hidden = true;
        moneyLabel.hidden = true;
        alarmImage.hidden = true;
    
        UNLOCKED = NO;
    }
}

-(IBAction)UnLockIt {  
    if (!UNLOCKED) {  
        if (slideToUnlock.value == 1.0) {  
            slideToUnlock.hidden = true;
            slideToUnlock.value = 0.0;
            container.hidden = true;
            myLabel.hidden = true;
            lockButton.hidden = false;
            totalMassages.hidden = false;
            totalMinutes.hidden = false;
            timerLabel1.hidden = false;
            dateLabel1.hidden = false;
            doneButton.hidden = false;
            startStop.hidden = false;
            addDoneButton.hidden = false;
            compSwitch.hidden = false;
            dateLabel1.hidden = false;
            stopNextButton.hidden = false;
            endShiftButton.hidden = false;
            tableType.hidden = false;
            plusButton.hidden = false;
            minusButton.hidden = false;
            compLabel.hidden = false;
            totalLabel.hidden = false;
            minutesLabel.hidden = false;
            moneyLabel.hidden = false;
            alarmImage.hidden = false;
            
            UNLOCKED = YES;
        } 
        else {
            // user did not slide far enough, so return back to 0 position  
            [UIView beginAnimations: @"SlideCanceled" context: nil];  
            [UIView setAnimationDelegate: self];  
            [UIView setAnimationDuration: 0.35];  
            
            // use CurveEaseOut to create "spring" effect  
            [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];   
            slideToUnlock.value = 0.0;
            [UIView commitAnimations]; 
        }  
    }   
}

-(IBAction)fadeLabel {  
    myLabel.alpha = slideToUnlock.maximumValue - slideToUnlock.value;
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
    //if (addTimeTextField.text =@"") {
   //     [addTimeTextField setText:@"0"];
   // }
    
    int theInteger; 
    theInteger = [[addTimeTextField text] intValue];
    
    if ([startStop.titleLabel.text isEqualToString:@"Pause"])
    {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [secondTimer invalidate];
        [totalMinutesTimer invalidate];
        [totalMoneyTimer invalidate];
        totalMoneyTimer = nil;
        totalMinutesTimer =nil;
        secondTimer = nil;
        [self updateTotalMoney];
        [self updateTotalTime];
        [self updateTimerSecond];
        
        
    } else if ([startStop.titleLabel.text isEqualToString:@"Resume"])
    {
        
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _startDate = [NSDate date];
        _startDate = [_startDate dateByAddingTimeInterval:(-1)*(_pauseTimeInterval)+((theInteger*60)*addOrSubtract)];
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
        totalMoneyTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(updateTotalMoney) userInfo:nil repeats:YES];
         }

    
    
    [self.view endEditing:TRUE];
    [addTimeTextField setText:@""];
    addTimeTextField.hidden =TRUE;
    [sender resignFirstResponder];
}

-(IBAction)endShift:(id)sender
{
    [secondTimer invalidate];
    [totalMinutesTimer invalidate];
    [totalMoneyTimer invalidate];
    totalMoneyTimer = nil;
    totalMinutesTimer =nil;
    secondTimer = nil;
    [self updateTotalMoney];
    [self updateTotalTime];
    [self updateTimerSecond];
    
    if ([startStop.titleLabel.text isEqualToString:@"Start"]) 
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle: @"Confirm"
                                      message: @"Do you really want to end your shift and email results?"
                                      delegate: self
                                      cancelButtonTitle:@"Cancel"
                                      otherButtonTitles:@"Yes",nil];
        [alertView setTag:2];
        [alertView show];
        
        
            

        
    } else if ([startStop.titleLabel.text isEqualToString:@"Pause"])
    {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"Confirm"
                                      message: @"Do you really want to end your shift and email results?"
                                      delegate: self
                                      cancelButtonTitle:@"Cancel"
                                      otherButtonTitles:@"Yes",nil];
        
        [alertView setTag:2];
        [alertView show];
        
        
    } else if ([startStop.titleLabel.text isEqualToString:@"Resume"])
    {
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"Confirm"
                                      message: @"Do you really want to end your shift and email results?"
                                      delegate: self
                                      cancelButtonTitle:@"Cancel"
                                      otherButtonTitles:@"Yes",nil];
        [alertView setTag:2];
        [alertView show];
        
        
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

    [self dismissModalViewControllerAnimated:YES];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.tag == 1) {
        
        if (buttonIndex == 1) {
            NSLog(@"user pressed OK");

            totalMassages1 = totalMassages1 + 1;
            NSString *intString = [NSString stringWithFormat:@"%d Massages", totalMassages1];
            totalMassages.text = intString;
        
            [startStop setTitle:@"Start" forState:UIControlStateNormal];
            [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
            [secondLabel setTextColor:[UIColor whiteColor]];
            [secondLabel setText:@"00:00:00"];
            [moneyLabel setText:@"$0.00"];
            totalMoneyDouble = 0.0;
        }
        else {
            NSLog(@"user pressed Cancel");
        }
    }
    else if (alertView.tag == 2) {
        if (buttonIndex == 1) {
            
            NSString *temp =[NSString stringWithFormat:@"Name: %@ \n Shift Number: %@ \n Casino: %@ \n User Type: %@ \n Tables: %@ \n Total Massages: %d \n Total Time:  \n Comp Time: DISABLED", nameString, shiftNumberString, casinoString, userTypeString, tablesString, totalMassages1 ];
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
            
            MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
            [composer setMailComposeDelegate:self];
            if ([MFMailComposeViewController canSendMail])
            {
                [composer setToRecipients:[NSArray arrayWithObject:emailString]];
                [composer setBccRecipients:[NSArray arrayWithObject:@"jforkey@worcester.edu"]];
                
                [composer setSubject:@"Venue Classic iOS Receipt"];
                [composer setMessageBody:temp isHTML:NO];
                [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
                [self presentModalViewController:composer animated:YES];

            }
        }
        else {
            NSLog(@"user pressed Cancel");
        }
        
    }

}

@end
