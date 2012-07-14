//
//  InformationViewController.h
//  VenueClassic
//
//  Created by James Forkey on 7/12/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController {

    IBOutlet UILabel *_label;
    IBOutlet UITextField *_name;
    IBOutlet UITextField *_email;
    IBOutlet UITextField *_shift_number;
    IBOutlet UISegmentedControl *_user_type;
    
    NSTimer *timer;
}

@property (strong, nonatomic) UILabel *_label;
@property (strong, nonatomic) UITextField *_name;
@property (strong, nonatomic) UITextField *_email;
@property (strong, nonatomic) UITextField *_shift_number;
@property (strong, nonatomic) UISegmentedControl *_user_type;

-(BOOL)hideKeyboard:(id)sender;
-(BOOL)backgroundTouched:(id)sender;
-(void)updateTimer;

@end
