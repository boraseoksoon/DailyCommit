//
//  stack_postfix.h
//  Stack
//
//  Created by Seoksoon Jang on 2016. 11. 21..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef stack_postfix_h
#define stack_postfix_h

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include "stack.h"

char* postfixTranslator(char* infixSymbols);
long long posfixCalculate(char* postfixSymbols);
bool isLeftOperatorBigger(char leftOperator, char rightOperator);

#endif /* stack_postfix_h */
