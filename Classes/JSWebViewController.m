//
//  JSWebViewController.m
//  CoreTextHyperlinkView
//
//  Created by James on 13/02/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import "JSWebViewController.h"


@implementation JSWebViewController

@synthesize webView = _webView;
@synthesize url = _url;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
	{
		
    }
	
    return self;
}

- (void)dealloc
{
	self.url = nil;
	self.webView = nil;
	
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																							  target:self
																							  action:@selector(done:)] autorelease]];
	
	
	if (self.url)
	{
		[self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
	}
}

- (void)viewDidUnload
{
	self.webView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)setUrl:(NSURL *)url
{
	[_url release];
	_url = [url retain];
	
	[self.webView loadRequest:[NSURLRequest requestWithURL:_url]];
}

- (void)done:(id)sender
{
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

@end
