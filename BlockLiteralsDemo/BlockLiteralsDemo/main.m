// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

void sayHello(void) {
    printf("Hello!\n");
}

void indirectlySayHello(void (*ptr)(void)) {
    ptr();
}

void playWithFunctionPointer() {
    indirectlySayHello(sayHello);
    
    void (*myFunctionPointer)(void) = sayHello;
    
    myFunctionPointer();
}


void indirectlySayHelloWithBlock(void (^helloBlock)(void)) {
    helloBlock();
}

void playWithBlocks() {
    char *weather = "hot and sunny";
    
    void (^myBlock)(void) = ^{
        printf("Hello from my block! The weather is %s!\n", weather);
    };
    
    indirectlySayHelloWithBlock(myBlock);
    
    void (^cloneOfMyBlock)(void) = [myBlock copy];
    cloneOfMyBlock();
}

int main(int argc, const char * argv[]) {
    playWithBlocks();
//    playWithFunctionPointer();
    return 0;
}
