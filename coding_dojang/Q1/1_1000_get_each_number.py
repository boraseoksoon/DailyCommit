#! /bin/usr/python
#! #-*- coding: utf-8 -*-

'''
level : lv1.
link : http://codingdojang.com/scode/504?answer_mode=hide

1~1000에서 각 숫자의 개수 구하라.
예로 10 ~ 15 까지의 각 숫자의 개수를 구해보자.

10 = 1, 0
11 = 1, 1
12 = 1, 2
13 = 1, 3
14 = 1, 4
15 = 1, 5

그러므로 이 경우의 답은 0:1개, 1:7개, 2:1개, 3:1개, 4:1개, 5:1개
'''


import sys

var1 = int(sys.argv[1])
var1

var2 = int(sys.argv[2])
var2+=1

numberZeroCounter = 0 
numberOneCounter = 0 
numberTwoCounter = 0 
numberThreeCounter = 0
numberFourCounter = 0
numberFiveCounter = 0 
numberSixCounter = 0
numberSevenCounter = 0
numberEightCounter = 0
numberNineCounter = 0

for n in range(var1,var2) :
	
	eachNumberList = str(n)
	for e in eachNumberList :
		if e == '0':
			numberZeroCounter+=1	
		elif e == '1':
			numberOneCounter+=1	
		elif e == '2':
			numberTwoCounter+=1
		elif e == '3':
			numberThreeCounter+=1
		elif e == '4':
			numberFourCounter+=1
		elif e == '5':
			numberFiveCounter+=1
		elif e == '6':
			numberSixCounter+=1
		elif e == '7':
			numberSevenCounter+=1
		elif e == '8':
			numberEightCounter+=1
		elif e == '9':
			numberNineCounter+=1

print	"number of 0 : " + str(numberZeroCounter)
print	"number of 1 : " + str(numberOneCounter)
print	"number of 2 : " + str(numberTwoCounter)
print	"number of 3 : " + str(numberThreeCounter)
print	"number of 4 : " + str(numberFourCounter)
print	"number of 5 : " + str(numberFiveCounter)
print	"number of 6 : " + str(numberSixCounter)
print	"number of 7 : " + str(numberSevenCounter)
print	"number of 8 : " + str(numberEightCounter)
print	"number of 9 : " + str(numberNineCounter)




	
	
	
