//
//  InformationViewController.m
//  VenueClassic
//
//  Created by James Forkey on 7/12/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

@synthesize _label;
@synthesize _name;
@synthesize _email;
@synthesize _shift_number;
@synthesize _user_type;

-(BOOL) hideKeyboard:(UITextField *) textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL) backgroundTouched:(UITextField *) textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) updateTimer 
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc ] init];
    _label.text = [formatter stringFromDate:[NSDate date]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
