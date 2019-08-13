// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

struct MyPerson {
    char *firstName;
};
typedef struct MyPerson MyPerson;

extern char *firstName(MyPerson *self);


@interface Person : NSObject {
    NSString *_firstName;
    NSString *_lastName;
    int _age;
}

- (NSString *)firstName;
- (void)setFirstName:(NSString *)newValue;

@end
