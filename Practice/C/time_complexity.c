#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define DIMENSIONAL_ARRAY_1		100 
#define DIMENSIONAL_ARRAY_2		1000
#define LOGARITHM_SAMPLE_CONSTANT	10000
#define ARR_MAX_SIZE	11

/* time complexity check. 
 * usually, standard time complexity is bigO  notation is used.
 */

int constantSample(int arr[], int arrLength){ 
	return arr[arrLength/2];
}

int linearSample(int arr[], int arrLength){
	int sum = 0;
	for (int i = 0; i < arrLength; i++) {
		sum += arr[i];
	}

	return sum;
}

int logarithmSample(int boundary){
	
	int sum = 0;
	for (int i = 1; i < boundary; i*=2) {
		sum += i;
	}

	return sum;
}

int logLinearSample(){
	
}

bool squareSample2(int arr[], int arrLength){
	
	for (int i = 0; i < arrLength - 1; i++) {
		for (int j = i+1; j < arrLength; j++) {
			if ( arr[i] == arr[j]) {
				printf("duplicated value in the array : arr[%d] with arr[%d]: %d\n", i, j, arr[i]);
				return true;
			}			
		}
	}

	return false;
}

typedef int (*arrayPointer)[DIMENSIONAL_ARRAY_2];
arrayPointer squareSample() {

	int arr[DIMENSIONAL_ARRAY_1][DIMENSIONAL_ARRAY_2];

	for (int i = 0; i < DIMENSIONAL_ARRAY_1; i++) {
		for (int j = 0; j < DIMENSIONAL_ARRAY_2; j++) {
			arr[i][j] = rand();
		}
	}

	return arr;
}

void swap(int* target1, int* target2) {
    
    int temp = *target1;
    *target1 = *target2;
    *target2 = temp;
}

int partition(int arr[], int start, int end) {
    
    int left = start;
    int right = end;
    
    int pivot = (left + right) / 2;
    
    while (left < right) {
        
        while ((arr[left] < arr[pivot]) && (left < right)) {
            // move left flag to right til it crosses.
            left++;
        }
        
        while ((arr[right] >= arr[pivot]) && (left < right)) {
            // move right flag to left til it crosses.
            right--;
        }
        
        // if left and right flag does not move anymore because it finds the proper value for it.
        if (left < right) {
            swap(&arr[left], &arr[right]);
        }
    }
    
    // swap pivot witht the value crossing left and right flag.
    swap(&arr[pivot], &arr[right]);

    return left;
}

void quickSort(int arr[], int start, int end) {
    
    if (start < end) {
        int p = partition(arr, start, end);
        quickSort(arr, start, p - 1);
        quickSort(arr, p + 1, end);
    }
}
int main() {

	int arr[ARR_MAX_SIZE] = {111,22,3,453,35,5321,70,28,99,99,10};
	int arrLength = sizeof(arr) / sizeof(arr[0]);
	// O(1) : constant time complexity.
	// O(logn) : logarithm time complexity.
	// O(n) : linear time complexity.
	// O(nLogn) : log linear time complexity.
	// O(n^2) : quadratic time complexity.

	printf("constant : %d\n", constantSample(arr, arrLength));
	printf("logarithm : %d\n", logarithmSample(LOGARITHM_SAMPLE_CONSTANT));
	printf("linear : %d\n", linearSample(arr, arrLength));
	// big O of quick sort is O(n^2) but average takes O(nLogn) and has been proved as the quickest sorting so far even though it has quadratic, big O, time complexity.
	printf("log linear : (using quick sort below)\n");
	
	quickSort(arr, 0, ARR_MAX_SIZE-1);
    
    	for (int i = 0; i < ARR_MAX_SIZE; i++) {
       		printf("arr[%d] : %d\n", i, arr[i]);
    	}

	printf("quadratic time is below : \n");

	int(*squareArr)[DIMENSIONAL_ARRAY_2] = squareSample();	 
	for (int i = 0; i < DIMENSIONAL_ARRAY_1; i++) {
		for (int j = 0; j < DIMENSIONAL_ARRAY_2; j++) {
			// printf("arr[%d][%d] : %d\n", squareArr[i][j]);
		}
	}

	if (squareSample2(arr, arrLength)) {
		printf("duplicated value in the array is found!\n");
	}

	else {
		printf("no duplicated value in the array is found!\n");
	}

	return 1;
}
