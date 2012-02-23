//
//  IBATextViewFormFieldCell.m
//  TravelBuddy
//
//  Created by Jon Gilkison on 2/23/12.
//  Copyright (c) 2012 Interfacelab LLC. All rights reserved.
//

#import "IBAForms/IBAFormConstants.h"
#import "IBAMemoFormFieldCell.h"

@implementation IBAMemoFormFieldCell

@synthesize textField = textField_;

- (void)dealloc {
	IBA_RELEASE_SAFELY(textField_);
	
	[super dealloc];
}


- (id)initWithFormFieldStyle:(IBAFormFieldStyle *)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithFormFieldStyle:style reuseIdentifier:reuseIdentifier])) {
		// Create the text field for data entry
        
        // TODO: put into the style crap
        // We keep the rect around so it doesn't get resized when deactivated.
        textFieldSize=style.valueFrame;
        textFieldSize.size.height=100;
        textFieldSize.size.width=self.cellView.frame.size.width-10;
        textFieldSize.origin.x=self.label.frame.origin.x;
        textFieldSize.origin.y=1;
        
		self.textField = [[[UITextView alloc] initWithFrame:textFieldSize] autorelease];
		self.textField.autoresizingMask = style.valueAutoresizingMask;
		self.textField.returnKeyType = UIReturnKeyNext;
        self.textField.opaque=NO;
        self.textField.backgroundColor=[UIColor clearColor];
		[self.cellView addSubview:self.textField];
        
        CGRect f=self.cellView.frame;
        f.size.height=108;
        self.cellView.frame=f;
        
        self.label.hidden=YES;
	}
	
    return self;
}

- (void)activate {
	[super activate];
	
	self.textField.backgroundColor = [UIColor clearColor];
}

-(void)deactivate {
    [super deactivate];
    
	self.textField.backgroundColor = [UIColor clearColor];
    [self.textField scrollRangeToVisible:NSMakeRange(0, 1)];
    self.textField.frame=textFieldSize;
}


- (void)applyFormFieldStyle {
	[super applyFormFieldStyle];
	
	self.textField.font = self.formFieldStyle.valueFont;
	self.textField.textColor = self.formFieldStyle.valueTextColor;
	self.textField.backgroundColor = self.formFieldStyle.valueBackgroundColor;
	self.textField.textAlignment = self.formFieldStyle.valueTextAlignment;
}

@end