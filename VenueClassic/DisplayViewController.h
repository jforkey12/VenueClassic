//
//  NSTimerViewController.h
//  NSTimer
//
//  Created by H&F Solutions.
//  Copyright 2012 H&F Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"
#import "AudioToolbox/AudioToolbox.h"
#import "MessageUI/MFMailComposeViewController.h"
#import "InformationViewController.h"
#import "MessageUI/MessageUI.h"

@interface DisplayViewController : UIViewController <AVAudioPlayerDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate, UIAlertViewDelegate> {
    
    
    UILabel *secondLabel;
    
    NSTimer *secondTimer;
    NSTimer *compTimer;
    NSTimer *secondTimer2;
    NSTimer *totalMinutesTimer;
    NSTimer *totalMoneyTimer;
    NSTimer *timer;
    
    NSDate *startDateMain;
    NSDate *startDate;
    NSDate *_startDate;
    NSDate *compDate;
    NSString *timeString2;
    NSString *minutesString;
    AVAudioPlayer *audioPlayer;
    
    NSDate *pauseStart, *previousFireDate, *dateNow; 
    
    UITextField *textField;
    UITextField *textField2;
    
    UIButton * numberPadDoneButton;
    UIButton *stopNextButton;
    UIButton *endShiftButton;
    UISegmentedControl *tableType;
    UIButton *plusButton;
    UIButton *minusButton;
    UILabel *compLabel;
    
    UILabel *totalLabel;
    UILabel *minutesLabel;
    UILabel *moneyLabel;
    UIImageView *alarmImage;
    
    UIKeyboardType _lastKeyboardType;
    UIReturnKeyType _lastReturnKeyType;
    BOOL _keyboardIsShowing;
    
    UISlider *slideToUnlock;  
    UIButton *lockButton;  
    UILabel *myLabel;  
    UIImageView *container; 
}

@property(nonatomic, retain)IBOutlet UILabel *secondLabel;
@property(nonatomic, retain)IBOutlet UILabel *totalMassages;
@property(nonatomic, retain)IBOutlet UILabel *totalMinutes;
@property(nonatomic, retain)IBOutlet NSString *timeString2;
@property(nonatomic, retain)IBOutlet UILabel *timerLabel1;
@property(nonatomic, retain)IBOutlet UILabel *dateLabel1;
@property(nonatomic, retain) NSDateFormatter *_dateFormatter;
@property(nonatomic, retain) NSDateFormatter *_dateFormatter2;
@property(nonatomic, retain) NSDateFormatter *dateFormatter3;
@property(nonatomic, retain) NSDateFormatter *addTimeDateFormatter;
@property(nonatomic, retain) NSDateFormatter *currentTimeDateFormatter;
@property(weak, nonatomic)IBOutlet UIButton *doneButton;
@property(nonatomic, retain) IBOutlet UIButton *startStop;
@property(nonatomic, retain) NSDateFormatter *compFormatter;
@property(nonatomic, retain)IBOutlet UISwitch *compSwitch;
@property(nonatomic, retain)IBOutlet UISlider *slideToUnlock;
@property(nonatomic, retain)IBOutlet UIButton *lockButton;
@property(nonatomic, retain)IBOutlet UILabel *myLabel;
@property(nonatomic, retain)IBOutlet UITextField *addTimeTextField;
@property(nonatomic, retain)IBOutlet UIImageView *container;
@property(nonatomic, retain)IBOutlet UIButton *stopNextButton;
@property(nonatomic, retain)IBOutlet UIButton *endShiftButton;
@property(nonatomic, retain)IBOutlet UISegmentedControl *tableType;
@property(nonatomic, retain)IBOutlet UIButton *plusButton;
@property(nonatomic, retain)IBOutlet UIButton *minusButton;
@property(nonatomic, retain)IBOutlet UILabel *compLabel;
@property(nonatomic, retain)IBOutlet UILabel *totalLabel;
@property(nonatomic, retain)IBOutlet UILabel *minutesLabel;
@property(nonatomic, retain)IBOutlet UILabel *moneyLabel;
@property(nonatomic, retain)IBOutlet UIImageView *alarmImage;
@property(nonatomic, retain) NSString *casinoString;
@property(nonatomic, retain) NSString *shiftNumberString;
@property(nonatomic, retain) NSString *emailString;
@property(nonatomic, retain) NSString *tablesString;
@property(nonatomic, retain) NSString *userTypeString;
@property(nonatomic, retain) NSString *nameString;
@property(nonatomic, retain) NSCalendar *gregorian;
@property(nonatomic, retain) NSDateComponents *components;
@property(nonatomic, retain) NSCalendar *totalTimeGregorian;
@property(nonatomic, retain) NSDateComponents *timeComponents;

-(IBAction)UnLockIt;  
-(IBAction)fadeLabel; 
-(IBAction)startStop:(id)sender;
-(IBAction)stopNext:(id)sender;
-(IBAction)toggleEnabledForCompSwitch:(id)sender;
-(IBAction)addTime:(id)sender;
-(IBAction)endShift:(id)sender;
-(IBAction)subtractTime:(id)sender;
-(IBAction)LockIt;  

@end
