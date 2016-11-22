#include <stdio.h>

int atoi(char *str) {
  
    int total = 0;
 
    while(*str) {  
        total = total * 10 + (*str) - '0';  
        str++;   
    } 
    return total; 
} 


int main(){ 

    char *str = "1241"; 
    int num = atoi(str); 

    printf("num : %d\n", num); 

    return 1; 
}



