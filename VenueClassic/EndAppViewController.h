//
//  EndAppViewController.h
//  VenueClassic
//
//  Created by James Forkey on 8/1/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationViewController.h"

@interface EndAppViewController : UIViewController

@property(nonatomic, retain) IBOutlet UIButton *reset;

-(IBAction)reset:(id)sender;

@end
