#include <stdio.h>

int arr[] = {11,33,55,77,88};
int max_arr_count_index = (sizeof(arr) / sizeof(arr[0]));

// print all
void print_all_arr(int* arr)
{
    // just print all arr datas regarding index.
    for(int i = 0; i < max_arr_count_index; i++) {
        printf("arr[%d] = %d \n", i, arr[i]);
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("[before]max_arr_count_index : %d\n", max_arr_count_index);
    printf("[before]The original array elements are :\n");
    print_all_arr(arr);
    arr[0] = 1;
    arr[1] = 2;
    arr[2] = 3;
    arr[3] = 4;
    arr[4] = 5;
    arr[5] = 1000;
    printf("[after]max_arr_count_index : %d\n", max_arr_count_index);
    printf("[after]The array elements after insertion :\n");
    
    print_all_arr(arr);
    
    return 0;
}

