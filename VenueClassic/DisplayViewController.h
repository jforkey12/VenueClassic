//
//  NSTimerViewController.h
//  NSTimer
//
//  Created by Lenzo on 29.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"
#import "AudioToolbox/AudioToolbox.h"
#import "MessageUI/MFMailComposeViewController.h"

@interface DisplayViewController : UIViewController <AVAudioPlayerDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate> {
    
    UILabel *mainLabel;
    UILabel *secondLabel;
    UILabel *totalMassages;
    UILabel *totalMinutes;
    UILabel *timerLabel1;
    UILabel *dateLabel1;
    
    NSTimer *dateTimer;
    NSTimer *mainTimer;
    NSTimer *secondTimer;
    NSTimer *compTimer;
    NSTimer *dateTimer2;
    
    NSTimer *totalTimer;
    
    NSDate *startDateMain;
    NSDate *startDate;
    NSDate *compDate;
    NSString *timeString2;
    NSString *minutesString;
    AVAudioPlayer *audioPlayer;
    
    IBOutlet UITextField *addTimeLabel;
    
    
    UITextField *textField;
    UITextField *textField2;
    
    UIButton * numberPadDoneButton;
    UIKeyboardType _lastKeyboardType;
    UIReturnKeyType _lastReturnKeyType;
    BOOL _keyboardIsShowing;
    
    UITextField * weakRefTextField;
    
}
@property(nonatomic, retain)IBOutlet UILabel *secondLabel;
@property(nonatomic, retain)IBOutlet UILabel *totalMassages;
@property(nonatomic, retain)IBOutlet UILabel *totalMinutes;
@property(nonatomic, retain)IBOutlet NSString *timeString2;
@property(nonatomic, retain)IBOutlet NSString *minutesString;
@property(nonatomic, retain)IBOutlet UILabel *timerLabel1;
@property(nonatomic, retain)IBOutlet UILabel *dateLabel1;
@property(nonatomic, retain) NSDateFormatter *_dateFormatter;
@property(nonatomic, retain) NSDateFormatter *_dateFormatter2;
@property(nonatomic, retain) NSDateFormatter *dateFormatter3;
@property(nonatomic, retain)IBOutlet UIButton *doneButton;
@property (nonatomic, assign) BOOL active;
@property(nonatomic, assign) BOOL start;

@property(nonatomic, retain) UITextField *addTimeLabel;

@property(nonatomic, retain) NSDateFormatter *compFormatter;
@property(nonatomic, retain)IBOutlet UISwitch *compSwitch;

-(IBAction)startSecond:(id)sender;
-(IBAction)stopNext:(id)sender;
-(IBAction)toggleEnabledForCompSwitch:(id)sender;
-(IBAction)addTime:(id)sender;
-(IBAction)endShift:(id)sender;

-(IBAction)LockIt;  

@end
