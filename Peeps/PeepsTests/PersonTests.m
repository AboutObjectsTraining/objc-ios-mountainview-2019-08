// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testFullName {
    Person *fred = [[Person alloc] init];
    NSLog(@"Name is %@", [fred fullName]);
    
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    NSLog(@"Name is %@", [fred fullName]);
}

- (void)testInitializePerson {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred"
                                            lastName:@"Smith"];
    NSLog(@"Name is %@", [fred fullName]);
}

- (void)testInitializePersonWithFactoryMethod {
    Person *fred = [Person personWithFirstName:@"Fred"
                                      lastName:@"Smith"];
    NSLog(@"Name is %@", fred);
}

@end
