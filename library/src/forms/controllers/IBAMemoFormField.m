//
//  IBATextViewFormField.m
//  TravelBuddy
//
//  Created by Jon Gilkison on 2/23/12.
//  Copyright (c) 2012 Interfacelab LLC. All rights reserved.
//

#import "IBAMemoFormField.h"
#import "IBAFormConstants.h"
#import "IBAInputCommon.h"
#import "IBAInputManager.h"

@implementation IBAMemoFormField

@synthesize textFormFieldCell = textFormFieldCell_;

- (void)dealloc {
	IBA_RELEASE_SAFELY(textFormFieldCell_);
	
	[super dealloc];
}


#pragma mark -
#pragma mark Cell management

- (IBAFormFieldCell *)cell {
	return [self textFormFieldCell];
}


- (IBAMemoFormFieldCell *)textFormFieldCell {
	if (textFormFieldCell_ == nil) {
		textFormFieldCell_ = [[IBAMemoFormFieldCell alloc] initWithFormFieldStyle:self.formFieldStyle reuseIdentifier:@"Cell"];
		textFormFieldCell_.textField.delegate = self;
		textFormFieldCell_.textField.userInteractionEnabled = NO;
	}
	
	return textFormFieldCell_;
}

- (void)updateCellContents {
	self.textFormFieldCell.label.text = self.title;
	self.textFormFieldCell.textField.text = [self formFieldStringValue];
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	return [[IBAInputManager sharedIBAInputManager] activateNextInputRequestor];;
}


#pragma mark -
#pragma mark IBAInputRequestor

- (NSString *)dataType {
	return IBAInputDataTypeText;
}

- (void)activate {
	self.textFormFieldCell.textField.userInteractionEnabled = YES;
	[super activate];
}

- (BOOL)deactivate {
	BOOL deactivated = [self setFormFieldValue:self.textFormFieldCell.textField.text];
	if (deactivated) {
		self.textFormFieldCell.textField.userInteractionEnabled = NO;
		deactivated = [super deactivate];
	}
	
	return deactivated;
}

- (UIResponder *)responder {
	return self.textFormFieldCell.textField;
}

@end
