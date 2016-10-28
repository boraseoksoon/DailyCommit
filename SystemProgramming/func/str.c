#include <stdio.h>
#include <string.h>
#include <stdlib.h> 

int main() 
{
	
	char* hello = "hello";

	char a[15] = "hello_a";
	char b[15]  = NULL; 

	for(int i=0; i<strlen(hello); i++)
	{
		printf("%c\n", hello[i]);
	}

	/*
	for(int i=0; hello[i] != '\0'; i++)
	{
		printf("%c\n", hello[i]);
		strncpy(assigned_str[i], hello[i], sizeof(char));
		// assigned_str[i] = hello[i];
		// strncpy(assigned_str[i], hello[i], sizeof(char));
		// *assigned_str = *hello[i];
	} 
	*/


	while (*a != '\0') {
    	// copy contents of a into b and increment
   		 *b++ = *a++;
	}
	// assign null to the end of arrayB
	*b = '\0';

	printf("copied b : %s\n", b);

	return 0;
}
