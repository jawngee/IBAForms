//
//  IBATextViewFormField.h
//  TravelBuddy
//
//  Created by Jon Gilkison on 2/23/12.
//  Copyright (c) 2012 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBAInputRequestorFormField.h"
#import "IBAMemoFormFieldCell.h"

@interface IBAMemoFormField : IBAInputRequestorFormField <UITextViewDelegate>
{
    IBAMemoFormFieldCell *textFormFieldCell_;
}

@property (nonatomic, retain) IBAMemoFormFieldCell *textFormFieldCell;

@end
