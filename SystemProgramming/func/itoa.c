#include <stdio.h>

// now, only supported decimal change.
void itoa(int num, char *str){ 

    int i = 0; 
    int radix = 10;  
    int digit = 1; 
    int numCount = 0; 

    // check the input number digit count(numCount) using digit variable.
    while(1) {
   
        if ((num/digit) > 0){
            numCount++; 
	}
        else { 
            break;
	} 

        digit *= radix; 
    } 

    digit /=radix;    
    
    // iterate until numCount to change integer to ascii.
    for ( i = 0;  i < numCount; i++){  
	// change integer to ascii.
        *(str+i) = num/digit + '0';
	// change input number value for the next digit.
        num -= ((num/digit) * digit);        
	// change digit variable for the next digit.
        digit /=radix;    
    }

    // at the end, don't forget to add NULL termination string.
    *(str+i) = '\0';
}

int main(int argc, char* argv[], char* envp[]){ 

    // this is how to use.
    char str[10]; 
    int num = 1241; 

    itoa(num, str); 
    printf("str : %s\n", str); 
     
    return 1; 
}
