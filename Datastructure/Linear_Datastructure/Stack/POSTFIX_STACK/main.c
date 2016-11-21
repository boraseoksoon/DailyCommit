//
//  main.c
//  Stack
//
//  Created by Seoksoon Jang on 2016. 11. 16..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>
#include "stack.h"
#include "stack_postfix.h"

int main(int argc, const char * argv[]) {
    
    long long postfix_result = posfixCalculate(postfixTranslator("3/1*2-1+3"));
    printf("postfix_result : %lld\n", postfix_result);
    
#ifdef __LIST__STACK
    printf("****** STACK LIST VERSION BEGINS ---> \n");
#elif __ARRAY__STACK
    printf("****** STACK ARRAY VERSION BEGINS ---> \n");
#endif
        
    stackNode* a = createStackNode("A");
    stackNode* b = createStackNode("B");
    stackNode* c = createStackNode("C");
    stackNode* d = createStackNode("D");
    stackNode* e = createStackNode("E");
    stackNode* f = createStackNode("F");
    stackNode* g = createStackNode("G");
    stackNode* h = createStackNode("H");
    stackNode* i = createStackNode("I");
    stackNode* j = createStackNode("J");
    
    stack* stack = createStack(a);
    push(stack, b);
    push(stack, c);
    push(stack, d);
    push(stack, e);
    push(stack, f);
    push(stack, g);
    push(stack, h);
    push(stack, i);
    push(stack, j);
    
    printf("stack top data : %s\n", pop(stack));
    printf("stack top data : %s\n", pop(stack));
    printf("stack top data : %s\n", pop(stack));
    printf("stack top data : %s\n", pop(stack));
    printf("stack top data : %s\n", pop(stack));
    printf("stack top data : %s\n", pop(stack));
    printf("stack top data : %s\n", pop(stack));
    
    printAllStackNode(stack);
    deleteStack(&stack);
    
    printf("stack is now pointing at %p\n", stack);
    printf("stack itself variable address is %p\n", &stack);
    
    return 0;
}
