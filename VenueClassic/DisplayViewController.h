//
//  DisplayViewController.h
//  VenueClassic
//
//  Created by James Forkey on 7/16/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController {

    IBOutlet UILabel *timerLabel2;
    IBOutlet UILabel *clock;
    IBOutlet UILabel *dateLabel2;

    NSTimer *timer;
    NSDateFormatter *_dateFormatter;
    NSDateFormatter *_dateFormatter2;
    
    
}

@property (nonatomic, retain) UILabel *timerLabel2;
@property (nonatomic, retain) UILabel *clock;
@property (nonatomic, retain) NSDateFormatter *_dateFormatter;
@property (nonatomic, retain) UILabel *dateLabel2;
@property (nonatomic, retain) NSDateFormatter *_dateFormatter2;

-(BOOL)hideKeyboard:(id)sender;
-(BOOL)backgroundTouched:(id)sender;
-(void)updateTimer;

@end