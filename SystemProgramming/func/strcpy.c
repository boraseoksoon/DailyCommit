#include <stdio.h>
#include <stdlib.h>
#include "strlen.h"

void string_copy(char* dest, const char* src);

int main()
{
	char* src = "this is src.";
	char* dest = (char*)malloc(string_length(src)); 

	string_copy(dest, src);
	printf("dest : %s\n", dest);	
}

void string_copy(char* dest, const char* src)
{
	int i =0;
	for(i=0; src[i] != '\0'; i++)
	{
		dest[i] = src[i];
	}	

	dest[i] = '\0';
}
