// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface ClassClusterTests : XCTestCase
@end

@implementation ClassClusterTests

- (void)testIdDataType {
    id bob = [[NSString alloc] init];
    
    [bob setFirstName:@"Bob"];
}

- (void)testStringClassCluster {
    NSString *s1 = [NSString alloc];
    NSString *s2 = [NSString alloc];
    
    s1 = [s1 initWithFormat:@"Hello %@", @"World!"];
    s2 = [s2 initWithFormat:@"Hello %@", @"World!"];

    NSString *s3 = [[NSString alloc] initWithFormat:@"Foo"];
    
    NSLog(@"%@ %@ %@", s1, s2, s3);
}

- (void)testArrayClassCluster {
    NSArray *a1 = [NSArray alloc];
    NSMutableArray *a2 = [NSMutableArray alloc];
    NSMutableArray *a3 = [NSMutableArray alloc];
    
    NSLog(@"%@ %@ %@", a1, a2, a3);
}

@end
