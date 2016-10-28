#include <stdio.h>
#include <string.h>
#include <stdlib.h> 

int main() 
{	
	char* hello = "hello";

	// segmentation fault : 11
	/*
	char* a  = "hello_a";
	char* b;
	*/

	// it just works.
	char a[15] = "hello_a";
	char b[15];

	for(int i=0; i<strlen(hello); i++)
	{
		printf("%c\n", hello[i]);
	}

	int index = 0;

	while (b[index++] = a[index])
	{
		b[index+1] = '\0';
		printf("b[%d] : %c\n", index-1, b[index-1]);
		printf("a[%d] : %c\n", index-1, a[index-1]);
	
	}

	// assign null to the end of arrayB
	b[index] = '\0';

	printf("copied b : %s\n", b);

	return 0;
}
