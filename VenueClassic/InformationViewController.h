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

NSTimer *timer;
    
}

-(void)updateTimer;

@end
