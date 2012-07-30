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
    
    UILabel *secondLabel;
    
    NSTimer *secondTimer;
    NSTimer *compTimer;
    NSTimer *secondTimer2;
    NSTimer *totalMinutesTimer;
    
    
    NSDate *startDateMain;
    NSDate *startDate;
    NSDate *_startDate;
    NSDate *compDate;
    NSString *timeString2;
    NSString *minutesString;
    AVAudioPlayer *audioPlayer;
    
    IBOutlet UITextField *addTimeLabel;
    
    
    NSDate *pauseStart, *previousFireDate, *dateNow; 
    
    UITextField *textField;
    UITextField *textField2;
    
    UIButton * numberPadDoneButton;
    UIKeyboardType _lastKeyboardType;
    UIReturnKeyType _lastReturnKeyType;
    BOOL _keyboardIsShowing;
    
    
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
@property(nonatomic, retain)IBOutlet UIButton *doneButton;
@property(nonatomic, retain) IBOutlet UIButton *startStop;
@property(nonatomic, retain) IBOutlet UIButton *addDoneButton;
@property(nonatomic, retain) UITextField *addTimeLabel;

@property(nonatomic, retain) NSDateFormatter *compFormatter;
@property(nonatomic, retain)IBOutlet UISwitch *compSwitch;

-(IBAction)startStop:(id)sender;
-(IBAction)stopNext:(id)sender;
-(IBAction)toggleEnabledForCompSwitch:(id)sender;
-(IBAction)addTime:(id)sender;
-(IBAction)endShift:(id)sender;

-(IBAction)LockIt;  

@end
