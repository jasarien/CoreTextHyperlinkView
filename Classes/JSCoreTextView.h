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
//  JSCoreTextView.h
//  CoreTextHyperlinkView
//
//  Created by James Addyman on 16/12/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "AHMarkedHyperlink.h"

@class JSCoreTextView;

@protocol JSCoreTextViewDelegate <NSObject>

@optional
- (void)textView:(JSCoreTextView *)textView linkTapped:(AHMarkedHyperlink *)link;

@end


@interface JSCoreTextView : UIView {
	
	id <JSCoreTextViewDelegate> _delegate;
	
	CTFramesetterRef _framesetter;
	CTFrameRef _frame;
	NSString *_text;
	
	CTTextAlignment _textAlignment;
	
	
	NSArray *_links;
	AHMarkedHyperlink *_touchedLink;
	AHMarkedHyperlink *_linkToCopy;
	CGPoint _linkLocation;
	
	UIColor *_textColor;
	UIColor *_linkColor;
	UIColor *_highlightedLinkColor;
	UIColor *_highlightColor;
	
	NSString *_fontName;
	CGFloat _fontSize;
	
	CGFloat _paddingTop;
	CGFloat _paddingLeft;
	
	UIImage *_backgroundImage;
	CGFloat _bgImageTopStretchCap;
	CGFloat _bgImageLeftStretchCap;
	
	BOOL _underlined;
}

@property (nonatomic, assign) id <JSCoreTextViewDelegate> delegate;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) CTTextAlignment textAlignment;

@property (nonatomic, copy) NSString *fontName;
@property (nonatomic, assign) CGFloat fontSize;

@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIColor *linkColor;
@property (nonatomic, retain) UIColor *highlightedLinkColor;
@property (nonatomic, retain) UIColor *highlightColor;

@property (nonatomic, assign) CGFloat paddingTop;
@property (nonatomic, assign) CGFloat paddingLeft;

@property (nonatomic, retain) UIImage *backgroundImage;
@property (nonatomic, assign) CGFloat bgImageTopStretchCap;
@property (nonatomic, assign) CGFloat bgImageLeftStretchCap;

@property (nonatomic) BOOL underlined;

+ (CGFloat)measureFrameHeightForText:(NSString *)text 
							fontName:(NSString *)fontName 
							fontSize:(CGFloat)fontSize 
				  constrainedToWidth:(CGFloat)width 
						  paddingTop:(CGFloat)paddingTop 
						 paddingLeft:(CGFloat)paddingLeft;

- (void)detectLinks;

@end
