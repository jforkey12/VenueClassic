//
//  EndAppViewController.m
//  VenueClassic
//
//  Created by James Forkey on 8/1/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "EndAppViewController.h"

@implementation EndAppViewController
@synthesize reset;

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
    // Do any additional setup after loading the view.
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

-(IBAction)reset:(id)sender{
    exit(1);
     }
@end
