// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@class Person;

@interface Dog : NSObject

@property (copy, nonatomic) NSString *name;
@property (weak, nonatomic) Person *owner;

@end

