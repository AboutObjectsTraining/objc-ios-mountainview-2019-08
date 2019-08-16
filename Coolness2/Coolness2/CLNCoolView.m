// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolView.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolView () <UITextFieldDelegate>
@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) IBOutlet UITextField *textField;
@end

@implementation CLNCoolView

- (IBAction)addCell {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.contentView addSubview:newCell];
    newCell.text = self.textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
