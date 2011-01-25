//
//  CoreTextHyperlinkViewViewController.m
//  CoreTextHyperlinkView
//
//  Created by James Addyman on 24/12/2010.
//  Copyright 2010 JamSoft. All rights reserved.
//

#import "CoreTextHyperlinkViewViewController.h"
#import "JSTwitterCoreTextView.h"
#import "AHMarkedHyperlink.h"

@implementation CoreTextHyperlinkViewViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	NSString *text = @"This is a test with Helvetica font at size 18.0 more text to test google.com subdomain.awesome.com the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff @jasarien #hastagsomething This is a test with http://apple.com/uk/thestore/mac/macpro/configure/default Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to test linktosomething.com/?hello=world the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica http://mysite.edu font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to http://192.68.0.1 test the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 this.this.and.that more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff test.com This is a test with Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff This linky.com is a test with Helvetica font at size 18.0 more text to test the text and stuff This is a test with Helvetica font at size 18.0 more text to test the text and stuff  1234";
	NSString *font = @"Helvetica";
	CGFloat size = 18.0;
	CGFloat paddingTop = 6.0;
	CGFloat paddingLeft = 20.0;
	
	JSTwitterCoreTextView *textView = [[[JSTwitterCoreTextView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)] autorelease];
	[textView setDelegate:self];
	[textView setText:text];
	[textView setFontName:font];
	[textView setFontSize:size];
	[textView setHighlightColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
	[textView setPaddingTop:paddingTop];
	[textView setPaddingLeft:paddingLeft];
	
	CGFloat height = [JSCoreTextView measureFrameHeightForText:text 
														fontName:font 
														fontSize:size 
											  constrainedToWidth:textView.frame.size.width - paddingLeft * 2
													  paddingTop:paddingTop 
													 paddingLeft:paddingLeft];
	CGRect textFrame = [textView frame];
	textFrame.size.height = height;
	[textView setFrame:textFrame];
	
	
	UIScrollView *scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)] autorelease];
	[scrollView setContentSize:textView.frame.size];
	[scrollView addSubview:textView];
	
	[self.view addSubview:scrollView];
}

- (void)textView:(JSCoreTextView *)textView linkTapped:(AHMarkedHyperlink *)link
{
	NSLog(@"Link: %@", [link URL]);
}

- (void)viewDidUnload
{
}


- (void)dealloc
{
    [super dealloc];
}

@end
