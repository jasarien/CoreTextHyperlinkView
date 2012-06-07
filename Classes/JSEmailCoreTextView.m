//
//	Copyright 2012 Ben Baron (Einstein Times Two Software). All rights reserved.
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
//  JSEmailCoreTextView.m
//
//  Created by Ben Baron on 06/06/2012.
//  Copyright 2012 Ben Baron. All rights reserved.
//

#import "JSEmailCoreTextView.h"
#import "AHMarkedHyperlink.h"

@implementation JSEmailCoreTextView

- (void)detectLinks
{
	[super detectLinks];
	
	if (![[self text] length])
	{
		return;
	}
	
	NSMutableArray *tempLinks = [_links mutableCopy];
	
	NSArray *expressions = [[[NSArray alloc] initWithObjects:@"([a-zA-Z0-9_]@[a-zA-Z0-9_]+)", nil] autorelease];
	//get emails
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
			
			NSString *email = [matchedString	substringFromIndex:1];
				
			AHMarkedHyperlink *hyperlink = [[[AHMarkedHyperlink alloc] initWithString:[NSString stringWithFormat:@"mailto:%@", email]
																	 withValidationStatus:AH_URL_VALID
																			 parentString:[self text]
																				 andRange:[match range]] autorelease];
			[tempLinks addObject:hyperlink];
		}
	}
	
	[_links release];
	_links = [tempLinks copy];
	[tempLinks release], tempLinks = nil;
}


@end
