//
//  InformationViewController.m
//  VenueClassic
//
//  Created by H&F Solutions.
//  Copyright 2012 H&F Solutions. All rights reserved.
//

#import "InformationViewController.h"
#import "DisplayViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

@synthesize timerLabel1;
@synthesize dateLabel1;
@synthesize _name;
@synthesize _email;
@synthesize _shift_number;
@synthesize _casino;
@synthesize _dateFormatter;
@synthesize _dateFormatter2;
@synthesize alertsuccess;
@synthesize tablesString;
@synthesize userTypeString;
@synthesize casinoString;
@synthesize nameString;
@synthesize emailString;
@synthesize shiftNumberString;

- (IBAction)textFieldFinished:(id) textField
{
    if ( textField == _name ) {
        [ _name resignFirstResponder ];
    }
    else if (textField == _email ) {
        [ _email resignFirstResponder ];
    }
    else if (textField == _shift_number ) {
        [ _shift_number resignFirstResponder ];
    }

}

-(IBAction)backgroundTouched:(id)textField
{
    if ( textField == _name ) {
        [ _name resignFirstResponder ];
    }
    else if (textField == _email ) {
        [ _email resignFirstResponder ];
    }
    else if (textField == _shift_number ) {
        [ _shift_number resignFirstResponder ];
    }    
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
    userTypeString = @"Patron";
    casinoString = @"Foxwoods";
    tablesString = @"Poker";
    
    [timerLabel1 setNumberOfLines:0];
    [timerLabel1 setBackgroundColor:[UIColor clearColor]];
    [timerLabel1 setFont:[UIFont boldSystemFontOfSize:14]];
    [timerLabel1 setTextColor:[UIColor whiteColor]];
    
    [self._name setReturnKeyType:UIReturnKeyDone];
    [self._name addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self._email setReturnKeyType:UIReturnKeyDone];
    [self._email addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self._shift_number setReturnKeyType:UIReturnKeyDone];
    [self._shift_number addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    //[self.view addGestureRecognizer:gestureRecognizer];
    
    NSDate *today = [[NSDate alloc] init];
    _dateFormatter = [[NSDateFormatter alloc] init];
    [self._dateFormatter setDateFormat:@"h:mm a"];
    
    NSString *currentTime = [self._dateFormatter stringFromDate: today];
    self.timerLabel1.text = currentTime;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                             target:self
                                           selector:@selector(pollTime)
                                           userInfo:nil
                                            repeats:YES];
    
    [dateLabel1 setNumberOfLines:0];
    [dateLabel1 setBackgroundColor:[UIColor clearColor]];
    [dateLabel1 setFont:[UIFont boldSystemFontOfSize:14]];
    [dateLabel1 setTextColor:[UIColor whiteColor]];
    
    NSDate *today2 = [[NSDate alloc] init];
    _dateFormatter2 = [[NSDateFormatter alloc] init];
    [self._dateFormatter2 setDateFormat:@"EEEE MMMM d, yyyy"];
    
    NSString *currentTime2 = [self._dateFormatter2 stringFromDate: today2];
    self.dateLabel1.text = currentTime2;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                             target:self
                                           selector:@selector(pollTime2)
                                           userInfo:nil
                                            repeats:YES];
    
}

- (void) pollTime
{
    NSDate *today = [[NSDate alloc] init];
    NSString *currentTime = [self._dateFormatter stringFromDate: today];
    self.timerLabel1.text = currentTime;
}

- (void) pollTime2
{
    NSDate *today2 = [[NSDate alloc] init];
    NSString *currentTime2 = [self._dateFormatter2 stringFromDate: today2];
    self.dateLabel1.text = currentTime2;
}

- (void)viewDidUnload
{
    timerLabel1 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(IBAction)casino:(id)sender{
	if(_casino.selectedSegmentIndex == 0){
        casinoString = @"Foxwoods";
	}
	if(_casino.selectedSegmentIndex == 1){
        casinoString = @"Mohegan";
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)CheckFieldsAlert:(id) sender {
    NSString *error_string = @"";
    int error_count = 0;
    
    if ( [_name.text isEqualToString:@""] ) {
        error_string = @"Please provide your name.";
        error_count++;
    }
    
    if( [_email.text isEqualToString:@"" ] ) {
        error_string = @"Please provide your email address.";
        error_count++;
    }
    
    if( [_shift_number.text isEqualToString:@"" ] ) {
        error_string = @"Please provide a shift number.";
        error_count++;
    }
    
    if ( error_count > 1 ) {
        error_string = @"Please fill in the required fields before continuing.";
    }
    
    UIAlertView *checkFieldsFail = [[UIAlertView alloc] initWithTitle:@"Error" message:error_string delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];   
    
    if (error_count > 0) {
        [checkFieldsFail show];
    }
    
    else {
        [self performSegueWithIdentifier:@"ValidationSucceeded" sender:self];
    }
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     InformationViewController *controller = (InformationViewController *)segue.destinationViewController;
    emailString = [_email text];
    nameString = [_name text];
    shiftNumberString = [_shift_number text];
    controller.casinoString = casinoString;
    controller.userTypeString = userTypeString;
    controller.tablesString = tablesString;
    controller.shiftNumberString = shiftNumberString;
    controller.nameString = nameString;
    controller.emailString = emailString;

}



@end