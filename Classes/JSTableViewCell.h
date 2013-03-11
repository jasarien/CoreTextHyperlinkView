//
//  JSTableViewCell.h
//  CoreTextHyperlinkView
//
//  Created by James Addyman on 11/03/2013.
//
//

#import <UIKit/UIKit.h>

@class JSCoreTextView;

@interface JSTableViewCell : UITableViewCell

@property (nonatomic, readonly) JSCoreTextView *coreTextView;

@end
