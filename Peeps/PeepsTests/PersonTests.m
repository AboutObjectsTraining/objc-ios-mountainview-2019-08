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

- (void)testCopyPerson {
    Person *fred = [Person personWithFirstName:@"Fred"
                                      lastName:@"Smith"];
    NSLog(@"Name is %@", fred);
    
    Person *fredsClone = [fred copy];
    NSLog(@"Name is %@", fredsClone);
}

- (void)testManWithDog {
    Person *fred = [Person personWithFirstName:@"Fred"
                                      lastName:@"Smith"];
    
    Dog *rover = [[Dog alloc] init];
    
    fred.dog = rover;
    
    NSLog(@"Name is %@", fred);
}

@end
