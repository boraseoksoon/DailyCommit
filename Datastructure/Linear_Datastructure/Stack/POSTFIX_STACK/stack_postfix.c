//
//  stack_postfix.c
//  Stack
//
//  Created by Seoksoon Jang on 2016. 11. 21..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "stack_postfix.h"

enum {
    plusOperatorPriority, minusOperatorPriority = 0,
    multipleOperatorPriority, divideOperatorPriority = 1,
};

bool isLeftOperatorBigger(char leftOpertor, char rightOpertor) {
    
    assert(leftOpertor != '+' || leftOpertor != '-' || leftOpertor != '*' || leftOpertor != '/');
    assert(rightOpertor != '+' || rightOpertor != '-' || rightOpertor != '*' || rightOpertor != '/');
    
    unsigned char leftOperatorPriority = 0;
    
    switch (leftOpertor) {
        case '+':
            leftOperatorPriority = plusOperatorPriority;
            break;
        case '-':
            leftOperatorPriority = minusOperatorPriority;
            break;
        case '*':
            leftOperatorPriority = multipleOperatorPriority;
            break;
        case '/':
            leftOperatorPriority = divideOperatorPriority;
            break;
        default:
            perror("not proper left operand input.");
            break;
    }
    
    unsigned char rightOperatorPriority = 0;
    
    switch (rightOpertor) {
        case '+':
            rightOperatorPriority = plusOperatorPriority;
            break;
        case '-':
            rightOperatorPriority = minusOperatorPriority;
            break;
        case '*':
            rightOperatorPriority = multipleOperatorPriority;
            break;
        case '/':
            rightOperatorPriority = divideOperatorPriority;
            break;
        default:
            perror("not proper left operand input.");
            break;
    }
    
    if (leftOperatorPriority > rightOperatorPriority) {
        return true;
    }
    
    return false;
}

char* postfixStrcpy(char *postfixSymbols, const char *infixSymbols, stack* stack)
{
    while (*infixSymbols) {
        
        // if the infixSymbol character is 'Operator',
        
        if (*(infixSymbols) == '*' || *(infixSymbols) == '+' || *(infixSymbols) == '-' || *(infixSymbols) == '/') {
            
            stack_data infixSymbolDataToPush = (*(infixSymbols));
            
            if (stack->top == NULL) {
                push(stack, createStackNode(&infixSymbolDataToPush));
            }
            
            else if (isLeftOperatorBigger(infixSymbolDataToPush, *(stack->top->stack_data))) {
                push(stack, createStackNode(&infixSymbolDataToPush));
            }
            else {
                
                while (stack->count > 0) {
                    stack_data* popData = pop(stack);
                    *(postfixSymbols++) = *(popData);
                }
                
                push(stack, createStackNode(&infixSymbolDataToPush));
            }
            infixSymbols++;
        }
        else {
            *(postfixSymbols++) = *(infixSymbols++);
        }
    }
    
    while (stack->count > 0) {
        stack_data* popData = pop(stack);
        *(postfixSymbols++) = *(popData);
    }
    
    *postfixSymbols = 0;
    
    return postfixSymbols;
}

char* strcpy_c(char *d, const char *s)
{
    while (*s)
    {
        *d++ = *s++;
    }
    *d = 0;
    return d;
}

char* postfixTranslator(char* infixSymbols) {
    
    long long lengthOfInfixSymbols = strlen(infixSymbols) + 1;
    char* postfixSymbols = (char*)malloc(lengthOfInfixSymbols);
    // memset(postfixSymbols, 0, lengthOfInfixSymbols);
    
    stack* stack = createStack(createStackNode("!"));
    pop(stack);
    
    postfixStrcpy(postfixSymbols, infixSymbols, stack);
    
    return postfixSymbols;
    
}

void itoa_c(long long num, char *str){
    
    long long i = 0;
    long long radix = 10;  // 진수
    long long deg = 1;
    long long cnt = 0;
    
    while(1){
        
        if( (num/deg) > 0) {
            cnt++;
        }
        else {
            break;
        }
        
        deg *= radix;
    }
    deg /=radix;
    
    for(i=0; i<cnt; i++) {
        *(str+i) = num / deg + '0';
        num -= ((num / deg) * deg);
        deg /= radix;
    }
    *(str+i) = '\0';
}

long long posfixCalculate(char* postfixSymbols) {

    long long result = 0;
    
    stack* stack = createStack(createStackNode("!"));
    pop(stack);
    
    while (*(postfixSymbols) != '\0') {
        
        if (*(postfixSymbols) == '*' || *(postfixSymbols) == '+' || *(postfixSymbols) == '-' || *(postfixSymbols) == '/') {
            
            stack_data* leftOperand = pop(stack);
            stack_data* rightOperand = pop(stack);
            
            long long leftOperandInt = atoi(leftOperand);
            long long rightOperandInt = atoi(rightOperand);
            
            switch (*postfixSymbols) {
                    
                case '+':
                    result = rightOperandInt + leftOperandInt;
                    break;
                case '-':
                    result = rightOperandInt - leftOperandInt;
                    break;
                case '*':
                    result = rightOperandInt * leftOperandInt;
                    break;
                case '/':
                    result = rightOperandInt / leftOperandInt;
                    break;
                default:
                    perror("not proper operand inputed here in calculation.");
                    break;
                    
            }
            
            // stack_data middleResult = '0' + result;
            stack_data* middleResult;
            itoa_c(result, middleResult);
            push(stack, createStackNode(middleResult));
            
            postfixSymbols++;
            
        } else {
            
            stack_data stackData = *postfixSymbols++;
            push(stack, createStackNode(&stackData));
            
        }
    }

    return result;
}
