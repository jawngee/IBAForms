//
//  IBABooleanCheckCell.h
//  IBAForms
//
//  Created by Doan The Hien on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IBAFormFieldCell.h"

@interface IBABooleanCheckCell : IBAFormFieldCell
{
    UILabel *valueTitle;
}

@property (nonatomic, retain) UILabel *valueTitle;

- (id)initWithFormFieldStyle:(IBAFormFieldStyle *)style valueTitle:(NSString *) checkCellTitle reuseIdentifier:(NSString *)reuseIdentifier;
@end
