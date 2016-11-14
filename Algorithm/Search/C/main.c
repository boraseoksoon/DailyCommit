#include <stdio.h>

// iteration binary search
int iteration_binary_search(int arr[], int arr_length, int key) {

	// data initialized 
	int left_index = 0;
	int right_index = arr_length - 1;
	int middle_index = (left_index + right_index) / 2;

	while (left_index <= right_index) {

		middle_index = (left_index + right_index) / 2;

		// if found
		if (arr[middle_index] == key) {
			return middle_index;
		}

		// if key is less than arr data of middle index.
		else if (arr[middle_index] > key) {
			right_index = middle_index - 1;
		} 

		// if key is greater than arr data of middle index.
		else if (arr[middle_index] < key) {
			left_index = middle_index + 1;
		}
	}

	return -1;
}

// recursive binary search
int recursive_binary_search(int arr[], int left_index, int right_index, int key) {

	// # failure case 1.
	// care if greater than and equal to operation is used, 
	// key on the last index of array cannot be found.	
	if (left_index > right_index) {
		return -1;
	}

	int middle_index = (left_index + right_index) / 2;
	
	// if key found
	if (arr[middle_index] == key) {
		return middle_index;
	}
	
	// if key is less than arr data of middle index.
	else if (arr[middle_index] > key) {
		return recursive_binary_search(arr, left_index, middle_index - 1, key);
	}
	// if key is greater than arr data of middle index. 
	else if (arr[middle_index] < key) {
		return recursive_binary_search(arr, middle_index + 1, right_index, key);
	}

	// # failure case 2.
	return -1;
}

// sequential search
int sequential_search(int arr[], int arr_length, int key) {

	// nothing to explain here.	
	for (int i = 0; i<arr_length; i++) {
		if (arr[i] == key) {
			return i;
		}
	}

	return -1;
}

int main(int argc, char* argv[], char* envp[]){

	int arr[] = {1,3, 5, 7, 8, 10, 13, 15, 17, 22, 30, 99};	
	int arr_length = sizeof(arr) / sizeof(arr[0]);

	printf("it should be 0 : %d\n", sequential_search(arr, arr_length, 1));
	printf("it should be 2 : %d\n", iteration_binary_search(arr, arr_length, 5));
	printf("it should be 11 : %d\n", recursive_binary_search(arr, 0, arr_length - 1, 99)); 

	return 1;
}

