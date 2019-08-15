// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolController () <UITextFieldDelegate>
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UITextField *textField;
@end

@implementation CLNCoolController

- (void)addCell {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.contentView addSubview:newCell];
    newCell.text = self.textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)XXXloadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect screenRect = UIScreen.mainScreen.bounds;
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(screenRect, &accessoryRect, &contentRect, 120, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    self.contentView = [[UIView alloc] initWithFrame:contentRect];
    
    self.contentView.clipsToBounds = YES;
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.75];
    self.contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    [self.view addSubview:accessoryView];
    [self.view addSubview:self.contentView];
    
    // Controls
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(16, 80, 240, 30)];
    [accessoryView addSubview:self.textField];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter a label";
    
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    
    button.frame = CGRectOffset(button.frame, 270, 80);
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    // Cool Cells
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 120, 200, 40)];
    
    subview1.text = @"Hello World! 🌍🌎🌏";
    subview2.text = @"Cool View Cells Rock!!! 🏆🎉";
    
    [self.contentView addSubview:subview1];
    [self.contentView addSubview:subview2];
    
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
}

@end
