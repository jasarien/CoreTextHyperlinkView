//
//  CoreTextHyperlinkViewAppDelegate.h
//  CoreTextHyperlinkView
//
//  Created by James Addyman on 24/12/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreTextHyperlinkViewViewController;

@interface CoreTextHyperlinkViewAppDelegate : NSObject <UIApplicationDelegate> {

	UINavigationController *navController;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

