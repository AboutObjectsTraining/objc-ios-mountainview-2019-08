// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

+ (instancetype)personWithFirstName:(NSString *)firstName
                           lastName:(NSString *)lastName {
    return [[self alloc] initWithFirstName:firstName lastName:lastName];
}

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName {
    self = [super init];
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    
    return self;
}

- (NSString *)fullName {    
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self fullName]];
}

- (id)copyWithZone:(NSZone *)zone {
    Person *newPerson = [[Person allocWithZone:zone] init];
    newPerson->_firstName = self->_firstName;
    newPerson->_lastName = self->_lastName;
    newPerson->_age = self->_age;
    return newPerson;
}

@end
