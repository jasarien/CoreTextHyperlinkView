//
//  JSWebViewController.h
//  CoreTextHyperlinkView
//
//  Created by James on 13/02/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JSWebViewController : UIViewController {
    
	UIWebView *_webView;
	
	NSURL *_url;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSURL *url;

- (void)done:(id)sender;

@end
