//
//  IBABooleanCheckCell.m
//  IBAForms
//
//  Created by Doan The Hien on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IBABooleanCheckCell.h"
#import "IBAFormConstants.h"

@implementation IBABooleanCheckCell

@synthesize valueTitle = valueTitle_;

- (void)dealloc {
	IBA_RELEASE_SAFELY(valueTitle_);
    
	[super dealloc];
}


- (id)initWithFormFieldStyle:(IBAFormFieldStyle *)style valueTitle:(NSString *) checkCellTitle reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithFormFieldStyle:style reuseIdentifier:reuseIdentifier])) {
		valueTitle_ = [[UILabel alloc] initWithFrame:style.valueFrame];
        valueTitle_.frame = CGRectMake(style.valueFrame.origin.x + 10 , style.valueFrame.origin.y - 2, style.valueFrame.size.width - 10, style.valueFrame.size.height);
        valueTitle_.text = checkCellTitle;
        valueTitle_.textColor = [UIColor colorWithRed:30.0 / 255.0 green:30.0 / 255.0 blue:30.0 / 255.0 alpha:1.0];
        valueTitle_.font = [UIFont systemFontOfSize:13];
		[self.cellView addSubview:valueTitle_];
		//valueTitle_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
		
	}
    
    return self;
}

@end
