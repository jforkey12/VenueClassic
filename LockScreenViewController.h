//
//  LockScreenViewController.h
//  VenueClassic
//
//  Created by Trevor Hodde on 7/22/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LockScreenViewController : UIViewController {
    UISlider *slideToUnlock;  
    UIButton *lockButton;  
    UILabel *myLabel;  
    UIImageView *Container; 
}

@property(nonatomic, retain)IBOutlet UISlider *slideToUnlock;
@property(nonatomic, retain)IBOutlet UIButton *lockButton;
@property(nonatomic, retain)IBOutlet UILabel *myLabel;
@property(nonatomic, retain)IBOutlet UIImageView *Container;

-(IBAction)UnLockIt;  
-(IBAction)fadeLabel; 

@end
