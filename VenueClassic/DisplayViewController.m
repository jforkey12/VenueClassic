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
#import "shift.h"

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
@synthesize shift;
@synthesize _user_type;

NSMutableArray *shiftArray;

bool UNLOCKED = YES;

int totalMassages1;
int timeToAdd;
int unitFlags;
int timeUnitFlags;
int addOrSubtract;
int rate;
double smallRate;
double totalMoneyDouble;

NSDate *shiftStart;
NSDate *shiftEnd;

NSNumber *serviceNumber;

NSString *compYesOrNo;
NSString *totalTimeString;

NSTimeInterval timeInterval2;
NSDate *timerDate2;

NSDate *compDate;
NSTimeInterval compTimeInterval;
NSDate *compTimerDate;


NSDate *addTimeDate;
NSTimeInterval _pauseTimeInterval;
NSTimeInterval _pauseTotalTimeInterval;
Shift *tempShift;


-(IBAction)startStop:(id)sender {
    
    if ([startStop.titleLabel.text isEqualToString:@"Start"]) 
    {
        tempShift = [[Shift alloc] init];

        
        startDate = [NSDate date];
        
        NSString *currentTime = [self.currentTimeDateFormatter stringFromDate: startDate];
        [tempShift setServiceStartTime:currentTime];
        
        startDate = [startDate dateByAddingTimeInterval:((-1)*(_pauseTotalTimeInterval))];
        
        if (secondLabel.text =@"00:00:00") {
            
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        _startDate = [NSDate date];
            
        _dateFormatter = [[NSDateFormatter alloc] init];
        [self._dateFormatter setDateFormat:@"hh:mm:ss"];
        [self._dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
            
        _startDate = [_startDate dateByAddingTimeInterval:(60*60)];
            
           
        totalMoneyTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTotalMoney) userInfo:nil repeats:YES];
            
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
            
   
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
        
        startDate = [NSDate date];
        _startDate = [NSDate date];
        startDate = [startDate dateByAddingTimeInterval:((-1)*(_pauseTotalTimeInterval))];
        _startDate = [_startDate dateByAddingTimeInterval:((-1)*(_pauseTimeInterval))];
        
        totalMoneyTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTotalMoney) userInfo:nil repeats:YES];
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
        
    }
}
    
    
-(void)updateTotalTime 
{
    NSDate *currentDate = [NSDate date];
    
    NSTimeInterval timeInterval2 = [currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval2];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    
    totalTimeString=[dateFormatter stringFromDate:timerDate];
    totalMinutes.text = totalTimeString;
    
    NSDate *now = [NSDate date];
    
    NSTimeInterval timeInterval = [now timeIntervalSinceDate:_startDate];
    _pauseTimeInterval = timeInterval;
    
    NSTimeInterval timeInterval3 = [now timeIntervalSinceDate:startDate];
    _pauseTotalTimeInterval = timeInterval3;
        
}

-(void)updateTotalMoney 
{
    totalMoneyDouble = totalMoneyDouble + smallRate;
    NSString* temp = [NSString stringWithFormat:@"$%.2f", totalMoneyDouble];
    moneyLabel.text = temp;
}

-(void)cancelNumberPad{
    [addTimeTextField resignFirstResponder];
    [addTimeTextField setText:@""];
    [addTimeTextField setHidden:YES];
}

-(void)doneWithNumberPad{
    
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
        startDate = [NSDate date];
        startDate = [startDate dateByAddingTimeInterval:((-1)*(_pauseTotalTimeInterval))];
        _startDate = [_startDate dateByAddingTimeInterval:(-1)*(_pauseTimeInterval)+((theInteger*60)*addOrSubtract)];
        
        totalMoneyTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTotalMoney) userInfo:nil repeats:YES];
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
    }
    
    else if ([startStop.titleLabel.text isEqualToString:@"Start"])
    {
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _startDate = [NSDate date];
        startDate = [NSDate date];
        NSString *currentTime = [self.currentTimeDateFormatter stringFromDate: startDate];
        [tempShift setServiceStartTime:currentTime];
        startDate = [startDate dateByAddingTimeInterval:((-1)*(_pauseTotalTimeInterval))];
        _startDate = [_startDate dateByAddingTimeInterval:((theInteger*60)*addOrSubtract)];
        totalMoneyTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTotalMoney) userInfo:nil repeats:YES];
        secondTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(updateTimerSecond) userInfo:nil repeats:YES];
        totalMinutesTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateTotalTime) userInfo:nil repeats:YES];
        
    }
    
    [self.view endEditing:TRUE];
    [addTimeTextField setText:@""];
    addTimeTextField.hidden =TRUE;
    
    [addTimeTextField resignFirstResponder];
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
        
        totalMoneyDouble = totalMoneyDouble;
        
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
- (IBAction)subtractTime:(id)sender {
    
    addOrSubtract = -1;
    
    if ([startStop.titleLabel.text isEqualToString:@"Pause"])
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
        
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    
    else if ([startStop.titleLabel.text isEqualToString:@"Start"])
    {
        [secondLabel setText:@"00:00:00"];
    }
    
    [addTimeTextField becomeFirstResponder];
    addTimeTextField.hidden = false;
}


-(IBAction)addTime:(id)sender
{
    addOrSubtract = 1;
    
     if ([startStop.titleLabel.text isEqualToString:@"Pause"])
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
        
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    }
     else if ([startStop.titleLabel.text isEqualToString:@"Start"])
     {
         [secondLabel setText:@"00:00:00"];
     }
   
    [addTimeTextField becomeFirstResponder];
    addTimeTextField.hidden = false;
}

-(IBAction)toggleEnabledForCompSwitch:(id)sender 
{
    if (compSwitch.on) 
    {
        compYesOrNo = @"YES";
    }
    else {
        compYesOrNo = @"NO";
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
    startDate = [NSDate date];
    _startDate = [NSDate date];
    _startDate = nil;
    compYesOrNo = @"NO";
    totalMassages1 = 0;
    totalTimeString = nil;
    totalMinutes.text = @"00:00:00";
    serviceNumber = [NSNumber numberWithInt:1];
    rate = 2;
    smallRate = 0.00666666;
    
    shiftArray = [[NSMutableArray alloc] initWithCapacity:1];

    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    addTimeTextField.inputAccessoryView = numberToolbar;
    
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
    NSDate *today = [NSDate date];
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

-(IBAction)tables:(id)sender{
	if(tableType.selectedSegmentIndex == 0){
        tablesString = @"Poker";
	}
	if(tableType.selectedSegmentIndex == 1){
        tablesString = @"Tables";
	}
}

-(IBAction)user:(id)sender{
	if(_user_type.selectedSegmentIndex == 0){
        userTypeString = @"Patron";
        rate = 2;
        smallRate = .00666666;
	}
	if(_user_type.selectedSegmentIndex == 1){
        userTypeString = @"Employee";
        rate =1;
        smallRate = .00333333;
	}
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
        _user_type.hidden = true;
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
            _user_type.hidden = false;
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

-(IBAction)endShift:(id)sender
{
    
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
        [secondTimer invalidate];
        [totalMinutesTimer invalidate];
        [totalMoneyTimer invalidate];
        totalMoneyTimer = nil;
        totalMinutesTimer =nil;
        secondTimer = nil;
        [self updateTotalMoney];
        [self updateTotalTime];
        [self updateTimerSecond];
        
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
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            [self dismissModalViewControllerAnimated:YES];
            break;
        case MFMailComposeResultSaved:
            [self dismissModalViewControllerAnimated:YES];
            break;
        case MFMailComposeResultSent:
            [self dismissModalViewControllerAnimated:NO];
            [self performSegueWithIdentifier:@"EndApplicationScreen" sender:self];
            break;
        case MFMailComposeResultFailed:
            [self dismissModalViewControllerAnimated:YES];
            break;
        default:
            [self dismissModalViewControllerAnimated:NO];
            [self performSegueWithIdentifier:@"EndApplicationScreen" sender:self];
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.tag == 1) {
        
        if (buttonIndex == 1) {
            NSLog(@"user pressed OK");
            
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
            [formatter setMaximumFractionDigits:2];      
            
            NSString *serviceCost = [formatter stringFromNumber:[NSNumber numberWithDouble:totalMoneyDouble]];
          
            NSDate *today = [NSDate date];
            NSString *currentTime = [self.currentTimeDateFormatter stringFromDate: today];
            totalMassages1 = totalMassages1 + 1;
            [tempShift setContractRevenue:serviceCost];
            [tempShift setComp:compYesOrNo];
            [tempShift setCasino:casinoString];
            [tempShift setServiceNumber:[NSNumber numberWithInt:totalMassages1]];
            [tempShift setShiftNumber:shiftNumberString];
            [tempShift setTables:tablesString];
            [tempShift setServiceEndTime:currentTime];
            [tempShift setUser:userTypeString];
            [shiftArray addObject:tempShift]; 
            NSString *intString = [NSString stringWithFormat:@"%d Massages", totalMassages1];
            totalMassages.text = intString;
        
            [startStop setTitle:@"Start" forState:UIControlStateNormal];
            [startStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
            [secondLabel setTextColor:[UIColor whiteColor]];
            [secondLabel setText:@"00:00:00"];
            [moneyLabel setText:@"$0.00"];
            totalMoneyDouble = 0.03;
//            NSLog(@"tempShift: %@", shiftArray);
        }
        else {
            NSLog(@"user pressed Cancel");
        }
    }
    else if (alertView.tag == 2) {
        if (buttonIndex == 1) {
            
            
            NSString *temp =[NSString stringWithFormat:@"Name: %@ \n Shift Number: %@ \n Casino: %@ \n User Type: %@ \n Tables: %@ \n Total Massages: %d \n Total Time:  %@ \n Comp Time: %@ \n \n %@", nameString, shiftNumberString, casinoString, userTypeString, tablesString, totalMassages1, totalTimeString, compYesOrNo, shiftArray];
            
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
            
            MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
            [composer setMailComposeDelegate:self];
            if ([MFMailComposeViewController canSendMail])
            {
                [composer setToRecipients:[NSArray arrayWithObject:@"therapist@venueclassic.com"]];
                [composer setCcRecipients:[NSArray arrayWithObject:emailString]];
                
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
