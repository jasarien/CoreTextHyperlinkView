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
	
	_textView = [[[JSTwitterCoreTextView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)] autorelease];
	[_textView setDelegate:self];
	[_textView setText:text];
	[_textView setFontName:font];
	[_textView setFontSize:size];
	[_textView setHighlightColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
	[_textView setPaddingTop:paddingTop];
	[_textView setPaddingLeft:paddingLeft];
	
	CGFloat height = [JSCoreTextView measureFrameHeightForText:text 
														fontName:font 
														fontSize:size 
											  constrainedToWidth:_textView.frame.size.width - paddingLeft * 2
													  paddingTop:paddingTop 
													 paddingLeft:paddingLeft];
	CGRect textFrame = [_textView frame];
	textFrame.size.height = height;
	[_textView setFrame:textFrame];
	
	
	_scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)] autorelease];
	[_scrollView setContentSize:_textView.frame.size];
	[_scrollView addSubview:_textView];
	
	[self.view addSubview:_scrollView];
	
	UISegmentedControl *segControl = (UISegmentedControl *)[self.navigationItem titleView];
	[segControl setSelectedSegmentIndex:3];
	[segControl addTarget:self
				   action:@selector(segmentedControlValueChanged:)
		 forControlEvents:UIControlEventValueChanged];
}

- (void)textView:(JSCoreTextView *)textView linkTapped:(AHMarkedHyperlink *)link
{
	NSLog(@"Link: %@", [link URL]);
}

- (void)segmentedControlValueChanged:(id)sender
{
	UISegmentedControl *segControl = (UISegmentedControl *)sender;
	
	switch ([segControl selectedSegmentIndex]) {
		case 0:
			[_textView setFontSize:12.0];
			break;
		case 1:
			[_textView setFontSize:14.0];
			break;
		case 2:
			[_textView setFontSize:16.0];
			break;
		case 3:
			[_textView setFontSize:18.0];
			break;
		case 4:
			[_textView setFontSize:20.0];
			break;
		case 5:
			[_textView setFontSize:22.0];
			break;
		default:
			break;
	}
	
	CGFloat height = [JSCoreTextView measureFrameHeightForText:_textView.text 
													  fontName:_textView.fontName
													  fontSize:_textView.fontSize 
											constrainedToWidth:_textView.frame.size.width - _textView.paddingLeft * 2
													paddingTop:_textView.paddingTop 
												   paddingLeft:_textView.paddingLeft];
	CGRect textFrame = [_textView frame];
	textFrame.size.height = height;
	[_textView setFrame:textFrame];
	
	[_scrollView setContentSize:_textView.frame.size];
}

- (void)viewDidUnload
{
}


- (void)dealloc
{
    [super dealloc];
}

@end
