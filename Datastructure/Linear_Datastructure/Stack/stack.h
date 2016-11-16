//
//  stack_list.h
//  Stack
//
//  Created by Seoksoon Jang on 2016. 11. 16..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef stack_h
#define stack_h

/* ADT) Stack.
 *
 *      (1) Object : Datastructure for LIFO(Last In First Out) operation operation.
 *
 *      (2) Functions :
 *          2-1. Node createStackNode(object) := create one stack node with data and return.
 *          2-2. Stack createStack(stack, stackNode) := create Stack Data structure with one stack node and return.
 *          2-2. Node pop() : get a top stack node and remove.(stack, pop)
 *          2-3. all-node-count getAllStackNodeCount(stack) : return all stack node count in the stack.
 *          2-4. Stack push(stack, StackNode) : add stack-node on top of the stack.
 *          2-5. Void printAllStackNode(stack) : print stack node in the order of LIFO(stack operation).
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* define */
// #define __ARRAY__STACK  1
#define __LIST__STACK   1

#ifdef __LIST__STACK

typedef int64_t stack_int;
typedef char stack_data;

typedef struct StackNode {
    stack_data* stack_data;
    struct StackNode* next;
}stackNode;

typedef struct Stack {
    stackNode* top;
    stack_int count;
}stack;

#elif __ARRAY__STACK

#define STACK_MAX_SIZE  10

typedef int64_t stack_int;
typedef char stack_data;

typedef struct StackNode {
    stack_data* stack_data;
}stackNode;

typedef struct Stack {
    stackNode* arr_stack[STACK_MAX_SIZE];
    stack_int stack_top;
}stack;

#endif

stackNode* createStackNode(stack_data* setData);
stack* createStack(stackNode* newStackNode);
stack_data* pop(stack* stack);
stack_int getAllCountOfStackNode(stack* stack);
stack* push(stack* stack, stackNode* newStackNode);
void printAllStackNode(stack* stack);
void deleteStack(stack** stack);

#endif /* stack_list_h */
