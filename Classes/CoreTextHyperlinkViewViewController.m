//
//	Copyright 2011 James Addyman (JamSoft). All rights reserved.
//	
//	Redistribution and use in source and binary forms, with or without modification, are
//	permitted provided that the following conditions are met:
//	
//		1. Redistributions of source code must retain the above copyright notice, this list of
//			conditions and the following disclaimer.
//
//		2. Redistributions in binary form must reproduce the above copyright notice, this list
//			of conditions and the following disclaimer in the documentation and/or other materials
//			provided with the distribution.
//
//	THIS SOFTWARE IS PROVIDED BY JAMES ADDYMAN (JAMSOFT) ``AS IS'' AND ANY EXPRESS OR IMPLIED
//	WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//	FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL JAMES ADDYMAN (JAMSOFT) OR
//	CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//	ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//	NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//	The views and conclusions contained in the software and documentation are those of the
//	authors and should not be interpreted as representing official policies, either expressed
//	or implied, of James Addyman (JamSoft).
//
//
//  CoreTextHyperlinkViewViewController.m
//  CoreTextHyperlinkView
//
//  Created by James Addyman on 24/12/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import "CoreTextHyperlinkViewViewController.h"
#import "JSTwitterCoreTextView.h"
#import "AHMarkedHyperlink.h"
#import "JSWebViewController.h"

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
	
	[self.view setBackgroundColor:[UIColor lightGrayColor]];
	
	NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. http://google.com Nunc non elit nisl. Morbi consequat ipsum id nisi sodales suscipit. Nunc bibendum purus eget sem pulvinar sed ultrices libero mattis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam non quam lorem. Nulla molestie hendrerit libero et commodo. Sed dignissim aliquam aliquam. Maecenas egestas sem vehicula massa molestie mollis. Morbi vitae accumsan mi. Suspendisse eget orci arcu. Aenean eu fermentum arcu. Cras pulvinar fermentum massa tempus vestibulum. Etiam ullamcorper ligula quis leo scelerisque nec eleifend orci rutrum. Vestibulum enim magna, mattis sit amet mattis ullamcorper, facilisis sed nunc. In eu ligula nisl. Curabitur longlink.com/thatwillwrap/thwholepage/andsuchthings/ quis nibh tortor, sit amet egestas ante. Duis cursus egestas felis, vestibulum tincidunt massa luctus sed. Sed quis eleifend justo.\n\nPraesent mauris ipsum, blandit id volutpat ac, egestas vel ligula. Aenean vel imperdiet nisi. Nullam quis volutpat nunc. Mauris elit dui, tempus et vulputate ut, ultrices vel libero. Vivamus vulputate tellus ut felis hendrerit euismod. Fusce sed magna metus. Fusce volutpat sodales adipiscing. Pellentesque feugiat feugiat aliquet. Donec scelerisque dapibus ultricies. Praesent tempor, velit vel porttitor auctor, urna felis fermentum mauris, vel tincidunt massa arcu vitae lacus.\n\nSed leo purus, malesuada ac rutrum et, accumsan nec neque. Nunc quis lectus dui, ac luctus nulla. Nam faucibus libero eu augue luctus convallis. Fusce eget lectus commodo nisi malesuada rhoncus. Nunc id iaculis magna. Nullam laoreet pharetra vestibulum. Sed et libero lacus. Vestibulum mattis nunc in libero bibendum pretium. Cras vulputate nisi sit amet sapien vehicula sit amet vulputate lectus eleifend. Mauris id mi magna, ut lacinia odio. Vivamus lobortis dictum sapien sit amet laoreet. Sed vestibulum bibendum pharetra. Suspendisse interdum, mauris ut malesuada pellentesque, massa ante consequat sem, convallis tempor justo leo a dolor. Donec odio libero, lacinia vel varius eleifend, ornare id nisi. Quisque vitae lacus urna. Maecenas facilisis risus tempor leo lacinia quis placerat risus ullamcorper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin nulla urna, elementum at laoreet eget, lobortis ac purus. Sed porta porttitor sagittis. Maecenas vehicula aliquet elit ac rhoncus.\n\nCras blandit commodo semper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam urna libero, fermentum sed mollis quis, pulvinar sed sem. Proin bibendum tempor elit id viverra. Maecenas ut mauris erat. Duis consequat luctus est, nec dictum massa vestibulum ut. Nunc rhoncus, nisl quis ornare hendrerit, nisi risus lobortis justo, vitae malesuada ante augue quis sapien. Fusce iaculis lorem eu lorem porta adipiscing. Duis non est libero, semper mollis tellus. Nunc mattis, purus sed aliquam suscipit, nisl urna molestie turpis, a dapibus augue diam et turpis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nCras accumsan consectetur viverra. Nam a orci diam, id condimentum libero. Curabitur purus velit, semper id dignissim in, vehicula a elit. Ut aliquet nibh sed erat scelerisque nec luctus augue iaculis. Mauris vitae diam laoreet massa hendrerit ullamcorper id in libero. Aliquam ante urna, dignissim nec tempor sit amet, consectetur in libero. Nam suscipit semper molestie. Mauris sollicitudin sapien dictum tortor tempus dignissim. Nunc metus sapien, dapibus sed accumsan eget, volutpat in justo. Quisque nec ante ac mauris congue facilisis. Suspendisse a risus in odio faucibus dictum a vitae magna. Nullam ultrices, google.com/?q=hello%20world erat et tempus tempor, orci velit volutpat urna, vehicula viverra magna libero fringilla arcu. Aliquam erat volutpat. Ut non est et metus tempus aliquet. Sed massa ante, aliquet eget vestibulum nec, laoreet in lacus. In eget dui quis arcu blandit aliquam vitae id ligula. Nam nec sapien vel nulla feugiat cursus. Donec nec enim ante, non congue nulla. Nam mattis placerat mattis. 1234";
	NSString *font = @"Helvetica";
	CGFloat size = 18.0;
	CGFloat paddingTop = 10.0;
	CGFloat paddingLeft = 10.0;
	
	_textView = [[[JSTwitterCoreTextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)] autorelease];
	[_textView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	[_textView setDelegate:self];
	[_textView setText:text];
	[_textView setFontName:font];
	[_textView setFontSize:size];
	[_textView setHighlightColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
	[_textView setBackgroundColor:[UIColor clearColor]];
	[_textView setPaddingTop:paddingTop];
	[_textView setPaddingLeft:paddingLeft];
	
	CGFloat height = [JSCoreTextView measureFrameHeightForText:text 
														fontName:font 
														fontSize:size 
											  constrainedToWidth:_textView.frame.size.width - (paddingLeft * 2)
													  paddingTop:paddingTop 
													 paddingLeft:paddingLeft];
	CGRect textFrame = [_textView frame];
	textFrame.size.height = height;
	[_textView setFrame:textFrame];
	
	
	_scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] autorelease];
	[_scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
	[_scrollView setContentSize:_textView.frame.size];
	[_scrollView addSubview:_textView];
	
	[self.view addSubview:_scrollView];
	
	UISegmentedControl *segControl = (UISegmentedControl *)[self.navigationItem titleView];
	[segControl setSelectedSegmentIndex:3];
	[segControl addTarget:self
				   action:@selector(segmentedControlValueChanged:)
		 forControlEvents:UIControlEventValueChanged];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
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
	
	[_textView setNeedsDisplay];
}

- (void)textView:(JSCoreTextView *)textView linkTapped:(AHMarkedHyperlink *)link
{
	JSWebViewController *webViewController = [[[JSWebViewController alloc] initWithNibName:@"JSWebViewController" bundle:nil] autorelease];
	[webViewController setUrl:[link URL]];
	UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:webViewController] autorelease];
	[navController setModalPresentationStyle:UIModalPresentationFullScreen];
	[navController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
	
	[self presentViewController:navController animated:YES completion:NULL];
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
