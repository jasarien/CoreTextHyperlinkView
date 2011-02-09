//
//  CoreTextHyperlinkViewViewController.h
//  CoreTextHyperlinkView
//
//  Created by James Addyman on 24/12/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSCoreTextView.h"

@class JSTwitterCoreTextView;

@interface CoreTextHyperlinkViewViewController : UIViewController <JSCoreTextViewDelegate> {

	JSTwitterCoreTextView *_textView;
	UIScrollView *_scrollView;
	
}

@end

