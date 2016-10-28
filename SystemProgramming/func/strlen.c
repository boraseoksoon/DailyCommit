#include "strlen.h"

size_t string_length (char *str) {
    size_t len = 0;
    while (*str != '\0') {
        str++;
        len++;
    }
    return len;
}

/*
int main(int argc, char* argv[], char* envp[])
{	
	printf("argc : %d\n", argc);

	char** env = NULL;
	for (env = envp; *env != 0; env++)
 	 {
   		char* thisEnv = *env;
   	 	printf("%s\n", thisEnv);    
  	}

	for (int i=0; i<argc; i++) 
	{
		printf("argv[%d] : %s\n", i, argv[i]);
		
		char* string = argv[i];

		int length = string_length(string);
		printf("length of the (%s) : %d\n", string, length);
	}

	return 0;
}
*/
