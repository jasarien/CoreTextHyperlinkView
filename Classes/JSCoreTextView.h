//
//  JSCoreTextView.h
//  CoreTextCells
//
//  Created by James Addyman on 16/12/2010.
//  Copyright 2010 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@class AHMarkedHyperlink, JSCoreTextView;

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

+ (CGFloat)measureFrameHeightForText:(NSString *)text 
							fontName:(NSString *)fontName 
							fontSize:(CGFloat)fontSize 
				  constrainedToWidth:(CGFloat)width 
						  paddingTop:(CGFloat)paddingTop 
						 paddingLeft:(CGFloat)paddingLeft;

- (void)detectLinks;

@end
