//
//  Created by H&F Solutions.
//  Copyright 2012 H&F Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoViewController;

@interface KeyboardExtensionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

