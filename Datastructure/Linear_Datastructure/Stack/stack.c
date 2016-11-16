//
//  stack_list.c
//  Stack
//
//  Created by Seoksoon Jang on 2016. 11. 16..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "stack.h"

/* declaration */
stackNode* createStackNode(stack_data* setData);
stack* createStack(stackNode* newStackNode);
stack_data* pop(stack* stack);
stack_int getAllCountOfStackNode(stack* stack);
stack* push(stack* stack, stackNode* newStackNode);
void printAllStackNode(stack* stack);
void deleteStack(stack** stack);
void deleteStackNode(stackNode* deleteStackNode);

/* implementation */

stackNode* createStackNode(stack_data* setData) {
    
#ifdef __LIST__STACK

    // list implementation
    stackNode* stackNode = malloc(sizeof(stackNode));
    stackNode->stack_data = (stack_data*)malloc(strlen(setData) + 1);
    strcpy(stackNode->stack_data, setData);
    stackNode->next = NULL;
    
#elif __ARRAY__STACK
    
    stackNode* stackNode = malloc(sizeof(stackNode));
    stackNode->stack_data = (stack_data*)malloc(strlen(setData) + 1);
    strcpy(stackNode->stack_data, setData);
    
#endif
    return stackNode;
}

stack* createStack(stackNode* newStackNode) {

#ifdef __LIST__STACK
    
    // list implementation
    stack* stack = malloc(sizeof(stack));
    stack->top = newStackNode;
    stack->count++;
    
#elif __ARRAY__STACK
    stack* stack = malloc(sizeof(stack));
    stack->stack_top = -1;
    stack->arr_stack[++(stack->stack_top)] = newStackNode;
    
#endif
    
    return stack;
}

stack* push(stack* stack, stackNode* newStackNode) {
    
#ifdef __LIST__STACK
    // list implementation
    
    // if stack is empty
    if (stack->count == 0) {
        
        stack->top = newStackNode;
        stack->top->next = NULL;
        stack->count++;
        
    }
    
    // Otherwise, stack is not empty
    else if (stack->count != 0) {
        
        newStackNode->next = stack->top;
        stack->top = newStackNode;
        stack->count++;
        
    }
    
    return stack;
    
#elif __ARRAY__STACK
    // array implementation
    
    // if stack is not empty
    if(stack->stack_top <= STACK_MAX_SIZE - 1) {
        stack->arr_stack[++(stack->stack_top)] = newStackNode;
    }
    // if stack is full!
    else {
        perror("stack is full!\n");
    }
    
#endif
    
    return stack;
}

stack_data* pop(stack* stack) {
    
#ifdef __LIST__STACK
    
    // list implementation
    stack_data* stackData = NULL;
    
    // if stack is empty,
    if (stack->count == 0) {
        perror("there is no stack node!");
        exit(1);
    }
    
    // Otherwise, stack is not empty,
    else if (stack->count != 0) {
        
        // copy data to get ready to return before remove.
        stackData = (stack_data*)malloc(sizeof(stack_data) + 1);
        strcpy(stackData, stack->top->stack_data);
        
        // pointer change, remove top node and setting-up again.
        stackNode* topNodeToRemove = stack->top;
        stack->top = stack->top->next;
        deleteStackNode(topNodeToRemove);
        stack->count--;
    }
    
    return stackData;

#elif __ARRAY__STACK
    
    // array implementation
    
    // stack_data* stackData = NULL;
    
    if (stack->stack_top > 0) {
        // copy data to get ready to return before remove.
        /*
        stackData = (stack_data*)malloc(strlen(stack->arr_stack[stack->stack_top]->stack_data) + 1);
        strcpy(stackData, stack->arr_stack[stack->stack_top]->stack_data);
        deleteStackNode(stack->arr_stack[stack->stack_top--]);
        */
    }
    // Otherwise,
    else {
        perror("there is no node to pop in the stack!\n");
    }
    
    // return stackData;
    return stack->arr_stack[stack->stack_top--]->stack_data;
#endif
}

void deleteStack(stack** stack) {
    
#ifdef __LIST__STACK
    // list implementation
    stackNode* stackTop = (*stack)->top;
    
    while (stackTop != NULL) {
        
        stackNode* topNodeToRemove = stackTop;
        stackTop = stackTop->next;
        deleteStackNode(topNodeToRemove);
        
        if (--(*stack)->count == 0) {
            (*stack) = NULL;
        }
    }

#elif __ARRAY__STACK
    // array implementation
    
#endif
    
    printf("completely deleted the stack.\n");

}

void deleteStackNode(stackNode* deleteStackNode) {
    
    // list implementation
    if (deleteStackNode != NULL) {
        free(deleteStackNode->stack_data);
        free(deleteStackNode);
        deleteStackNode = NULL;
    }
}

stack_int getAllCountOfStackNode(stack* stack) {
    
#ifdef __LIST__STACK
    // list implementation
    return stack->count;
    
#elif __ARRAY__STACK
    // array implementation
    return stack->stack_top;
    
#endif
}

void printAllStackNode(stack* stack) {
    
#ifdef __LIST__STACK
    // list implementation
    if (stack) {
        
        stackNode* stackTop = stack->top;
        
        printf("remaining stack data is : ");
        while (stackTop != NULL) {
            printf("%s ", stackTop->stack_data);
            stackTop = stackTop->next;
        }
        
        printf("\n");
    }
    
    else {
        printf("stack is NULL. there is no stack node to print in the stack!\n");
    }
    
#elif __ARRAY__STACK
    // array implementation
    
    printf("remaining stack data is : ");
    
    for (stack_int i = stack->stack_top; i >= 0; i--) {
        printf("%s ", stack->arr_stack[i]->stack_data);
    }
    
    printf("\n");
    
#endif
}
