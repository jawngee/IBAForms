//
//  IBATextViewFormFieldCell.h
//  TravelBuddy
//
//  Created by Jon Gilkison on 2/23/12.
//  Copyright (c) 2012 Interfacelab LLC. All rights reserved.
//

#import "IBAFormFieldCell.h"

@interface IBAMemoFormFieldCell :  IBAFormFieldCell {
	UITextView *textField_;
    CGRect textFieldSize;
}

@property (nonatomic, retain) UITextView *textField;

@end
