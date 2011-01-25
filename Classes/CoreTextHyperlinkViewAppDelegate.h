//
//  CoreTextHyperlinkViewAppDelegate.h
//  CoreTextHyperlinkView
//
//  Created by James Addyman on 24/12/2010.
//  Copyright 2010 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreTextHyperlinkViewViewController;

@interface CoreTextHyperlinkViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreTextHyperlinkViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoreTextHyperlinkViewViewController *viewController;

@end

