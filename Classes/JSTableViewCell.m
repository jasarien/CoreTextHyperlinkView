//
//  JSTableViewCell.m
//  CoreTextHyperlinkView
//
//  Created by James Addyman on 11/03/2013.
//
//

#import "JSTableViewCell.h"
#import "JSCoreTextView.h"

@implementation JSTableViewCell

@synthesize coreTextView = _coreTextView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		_coreTextView = [[JSCoreTextView alloc] initWithFrame:[[self contentView] bounds]];
		[_coreTextView setBackgroundColor:[UIColor whiteColor]];
		[_coreTextView setPaddingTop:12];
		[_coreTextView setText:@"Hello, this is a link http://google.com"];
		[self.contentView addSubview:_coreTextView];
    }
    return self;
}

- (void)dealloc
{
    [_coreTextView release], _coreTextView = nil;
    [super dealloc];
}

@end
