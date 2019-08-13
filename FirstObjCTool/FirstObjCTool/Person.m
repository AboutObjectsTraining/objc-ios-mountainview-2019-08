// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"


char *firstName(MyPerson *self) {
    return self->firstName;
}


@implementation Person

- (NSString *)firstName {
    return _firstName;
}

- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

@end
