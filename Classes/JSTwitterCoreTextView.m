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
