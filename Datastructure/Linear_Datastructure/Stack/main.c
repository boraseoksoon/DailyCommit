//
//  main.c
//  Stack
//
//  Created by Seoksoon Jang on 2016. 11. 16..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>
#include "stack.h"

int main(int argc, const char * argv[]) {
    
    char* str = "test";
    
    char* test = (char*)malloc(strlen(str)+1);
    strcpy(test, str);
    printf("test : %s\n", test);
    
    stackNode* a = createStackNode("A");
    stackNode* b = createStackNode("B");
    stackNode* c = createStackNode("C");
    stackNode* d = createStackNode("D");
    
    stack* stack = createStack(a);
    push(stack, b);
    push(stack, c);
    push(stack, d);
    
    printf("stack top data : %s\n", pop(stack));
    printf("stack top data : %s\n", pop(stack));
    printf("stack top data : %s\n", pop(stack));
    
    printAllStackNode(stack);
    
    return 0;
}
