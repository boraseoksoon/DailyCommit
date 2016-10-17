#! /usr/bin/python
#! #-*- coding: utf-8 -*-

'''
예로, 10~15까지의 각 숫자 분해하여 곱하기의 전체 합은 다음과 같다.

10 = 1 * 0 = 0
11 = 1 * 1 = 1
12 = 1 * 2 = 2
13 = 1 * 3 = 3
14 = 1 * 4 = 4
15 = 1 * 5 = 5

그러므로, 이 경우의 답은 0+1+2+3+4+5 = 15

'''

import sys

var1 = int(sys.argv[1])
var2 = int(sys.argv[2])
var2+=1

sum = 0
for number in range(var1, var2) : 
	result = 1
	for e in str(number) :
		result *= int(e)
	sum += result
	
print	"sum : " + str(sum) 
