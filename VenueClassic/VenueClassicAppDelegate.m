//
//  InformationViewController.h
//  VenueClassic
//
//  Created by James Forkey on 7/12/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//


#import "VenueClassicAppDelegate.h"


@implementation VenueClassicAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
/*    // EXAMPLE 1
    UILabel* descriptionLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 460, 20)];
    descriptionLabel1.backgroundColor = [UIColor clearColor];
    descriptionLabel1.textColor = [UIColor whiteColor];
    descriptionLabel1.font = [UIFont systemFontOfSize:14];
    descriptionLabel1.text = @"1) Update date and time once a second";
    
    UMDateTimeLabel* timeLabel1 = [UMDateTimeLabel dynamicLabelWithFormat:@"MM/dd/YY - HH:mm:ss"];
    [timeLabel1 setFrame:CGRectMake(10, 10, 320, 80)];
    [timeLabel1 setNumberOfLines:0];
    [timeLabel1 setBackgroundColor:[UIColor clearColor]];
    [timeLabel1 setFont:[UIFont boldSystemFontOfSize:24]];
    [timeLabel1 setTextColor:[UIColor blackColor]];
    
    
    // EXAMPLE 2    
    UILabel* descriptionLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 460, 20)];
    descriptionLabel2.backgroundColor = [UIColor clearColor];
    descriptionLabel2.textColor = [UIColor blackColor];
    descriptionLabel2.font = [UIFont systemFontOfSize:14];
    descriptionLabel2.text = @"2) Display a certain date without updating it";
    
    UMDateTimeLabel* timeLabel2 = [UMDateTimeLabel staticLabelWithFormat:@"dd.MM.YYYY - HH:mm" date:[NSDate dateWithTimeIntervalSinceNow:-10000000l]];
    [timeLabel2 setFrame:CGRectMake(10, 100, 320, 80)];
    [timeLabel2 setNumberOfLines:0];
    [timeLabel2 setBackgroundColor:[UIColor clearColor]];
    [timeLabel2 setFont:[UIFont boldSystemFontOfSize:24]];
    [timeLabel2 setTextColor:[UIColor blackColor]];
    
    
    
    
    // EXAMPLE 3    
    UILabel* descriptionLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 190, 460, 20)];
    descriptionLabel3.backgroundColor = [UIColor clearColor];
    descriptionLabel3.textColor = [UIColor blackColor];
    descriptionLabel3.font = [UIFont systemFontOfSize:14];
    descriptionLabel3.text = @"3) Display the current time including millis with frequent updates";
    
    UMDateTimeLabel* timeLabel3 = [UMDateTimeLabel dynamicLabelWithFormat:@"HH:mm:ss.SSS" updateInterval:0.001];
    [timeLabel3 setFrame:CGRectMake(10, 190, 320, 80)];
    [timeLabel3 setNumberOfLines:0];
    [timeLabel3 setBackgroundColor:[UIColor clearColor]];
    [timeLabel3 setFont:[UIFont boldSystemFontOfSize:24]];
    [timeLabel3 setTextColor:[UIColor blackColor]];
    
    
#if ! __has_feature(objc_arc)
    [controller release];
    [descriptionLabel1 release];
    [descriptionLabel2 release];
    [descriptionLabel3 release];
#endif
    */
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end