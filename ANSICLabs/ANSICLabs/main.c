// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#include <stdio.h>
#include "Basics.h"

void messWithStrings() {
    char letters1[] = { 'a', 'b', 'c', '\0' };
    printf("Value of letters1 is %p, content is %s\n", letters1, letters1);

    char letters2[] = "abc";
    printf("Value of letters2 is %p, content is %s\n", letters2, letters2);
    
    for (int i = 0; i < 10; i++) {
        printf("address is %p, value is %c\n", letters2 + i, *(letters2 + i));
    }
    
    char *p1 = "abc";
    printf("Value of p is %p, content is %s\n", p1, p1);
//    p1[0] = 'z';
    
    printf("Value of literal is %p, content is %s\n", "abc", "abc");
    printf("Value of literal is %p, content is %s\n", "abc", "abc");
}

void foolAroundWithArrays(void) {
    int a[10] = { };
    
    for (int i = 0; i < 10; i++) {
        printf("%d\n", a[i]);
    }
}

int main(int argc, const char * argv[]) {
    
    messWithStrings();
//    foolAroundWithArrays();
    
//    RunBasics1();
//    RunBasics2();
    return 0;
}
