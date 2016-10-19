#include <stdio.h>
 
unsigned int TOPPING_NONE = (1u << 0);
unsigned int TOPPING_TWO = (1u << 1);
unsigned int TOPPING_THREE = (1u << 2);
unsigned int TOPPING_FOUR = (1u << 3);

unsigned int TOPPING_FIVE = (1u << 4);
unsigned int TOPPING_SIX = (1u << 5);
unsigned int TOPPING_SEVEN = (1u << 6);
unsigned int TOPPING_EIGHT = (1u << 7);
unsigned int TOPPING_NINE = (1u << 8);
unsigned int TOPPING_TEN = (1u << 9);

int main(int argc, char* argv[], char* envp[]){

	unsigned int empty_pizza = 0;
	unsigned int full_topping_pizza = (1 << 10) - 1;

	
	empty_pizza = TOPPING_NONE;
	

	if (empty_pizza == TOPPING_NONE) {
		printf("TOPPING_NONE!\n");
	}


	empty_pizza |= TOPPING_NINE;

	if (empty_pizza & TOPPING_EIGHT) {
		printf("TOPPING_EIGHT!\n");		
	} else if (empty_pizza & TOPPING_NINE) {
		printf("TOPING_NINE!\n");
	}

	empty_pizza |= TOPPING_SEVEN;

	
	empty_pizza &= ~(TOPPING_NINE);

	if (empty_pizza & TOPPING_NINE) {
		printf("TOPPING_NINE is still alive!\n");
	} else {
		printf("TOPPING_NINE was removed!\n");
	}


	empty_pizza ^= TOPPING_SEVEN;
	
	if (empty_pizza & TOPPING_SEVEN) {
		printf("TOPPING_SEVEN is still alive!\n");	
	} else {
		printf("TOPPING_SEVEN was removed!\n");
	}

	empty_pizza ^= TOPPING_SEVEN;
	
	if (empty_pizza & TOPPING_SEVEN) {
		printf("TOPPING_SEVEN is still alive!\n");	
	} else {
		printf("TOPPING_SEVEN was removed!\n");
	}

	return 0; 
}
