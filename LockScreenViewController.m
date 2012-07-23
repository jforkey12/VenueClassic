//
//  LockScreenViewController.m
//  VenueClassic
//
//  Created by Trevor Hodde on 7/22/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "LockScreenViewController.h"

@implementation LockScreenViewController

@synthesize slideToUnlock;  
@synthesize lockButton;  
@synthesize myLabel;  
@synthesize Container; 

bool UNLOCKED = NO;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *stetchLeftTrack= [[UIImage imageNamed:@"Nothing.png"]
                               stretchableImageWithLeftCapWidth:30.0 topCapHeight:0.0];
	UIImage *stetchRightTrack= [[UIImage imageNamed:@"Nothing.png"]
                                stretchableImageWithLeftCapWidth:30.0 topCapHeight:0.0];
	[slideToUnlock setThumbImage: [UIImage imageNamed:@"SlideToStop.png"] forState:UIControlStateNormal];
	[slideToUnlock setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
	[slideToUnlock setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal]; 
}

- (void)viewDidUnload
{
    [super viewDidUnload ];
}

-(IBAction)UnLockIt {  
    if (!UNLOCKED) {  
        if (slideToUnlock.value == 1.0) {  
            slideToUnlock.hidden = YES;  
            lockButton.hidden = NO;  
            Container.hidden = YES;  
            myLabel.hidden = YES;  
            UNLOCKED = YES;
            
            [self performSegueWithIdentifier:@"UnlockSucceeded" sender:self];
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

@end
