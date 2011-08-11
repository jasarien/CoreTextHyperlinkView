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
//  JSTwitterCoreTextView.m
//  Interstate
//
//  Created by James Addyman on 06/01/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import "JSTwitterCoreTextView.h"
#import "AHMarkedHyperlink.h"

@implementation JSTwitterCoreTextView

- (void)detectLinks
{
	[super detectLinks];
	
	if (![[self text] length])
	{
		return;
	}
	
	NSMutableArray *tempLinks = [_links mutableCopy];
	
	NSArray *expressions = [[[NSArray alloc] initWithObjects:@"(@[a-zA-Z0-9_]+)", // screen names
															 @"(#[a-zA-Z0-9_-]+)", // hash tags
															 nil] autorelease];
	//get #hashtags and @usernames
	for (NSString *expression in expressions)
	{
		NSError *error = NULL;
		NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
																			   options:NSRegularExpressionCaseInsensitive
																				 error:&error];
		NSArray *matches = [regex matchesInString:[self text]
										  options:0
											range:NSMakeRange(0, [[self text] length])];
		
		NSString *matchedString = nil;
		for (NSTextCheckingResult *match in matches)
		{
			matchedString = [[[self text] substringWithRange:[match range]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
			
			if ([matchedString hasPrefix:@"@"]) // usernames
			{
				NSString *username = [matchedString	substringFromIndex:1];
				
				AHMarkedHyperlink *hyperlink = [[[AHMarkedHyperlink alloc] initWithString:[NSString stringWithFormat:@"http://twitter.com/%@", username]
																	 withValidationStatus:AH_URL_VALID
																			 parentString:[self text]
																				 andRange:[match range]] autorelease];
				[tempLinks addObject:hyperlink];
			}
			else if ([matchedString hasPrefix:@"#"]) // hash tag
			{
				NSString *searchTerm = [[matchedString substringFromIndex:1] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
				
				AHMarkedHyperlink *hyperlink = [[[AHMarkedHyperlink alloc] initWithString:[NSString stringWithFormat:@"http://twitter.com/search?q=%@", searchTerm]
																	 withValidationStatus:AH_URL_VALID
																			 parentString:[self text]
																				 andRange:[match range]] autorelease];
				[tempLinks addObject:hyperlink];
			}
		}
	}
	
	[_links release];
	_links = [tempLinks copy];
	[tempLinks release], tempLinks = nil;
}

@end
