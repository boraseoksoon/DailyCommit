//
//  main.c
//  Array
//
//  Created by Seoksoon Jang on 2016. 11. 4..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>

int arr[] = {1,3,5,7,8};
// int arr[] = {1,1,1,5,1};

// max array count.
int max_arr_count_index = (sizeof(arr) / sizeof(arr[0])) - 1;

// insert
void insertAt(int* arr, int index, int value_to_update);
// delete
void deleteAt(int* arr, int index);
// udpate
void updateAt(int* arr, int index, int value_to_update);
// read
int getAt(int* arr, int index);

// search
int search(int* arr, int data);

// print all
void print_all_arr(int* arr);

// array index empty check
int is_empty();

// array index full check
int is_full();

int main(int argc, const char* argv[])
{
    // print all.
    printf("The original array elements are :\n");
    print_all_arr(arr);
    
    // to insert.
    printf("max_arr_count_index : %d\n", max_arr_count_index);
    arr[5] = 100;
    printf("max_arr_count_index : %d\n", max_arr_count_index);
    //insertAt(arr, 1, 10);
    
    printf("The array elements after insertion :\n");
    print_all_arr(arr);
    
    return 0;
}

// print all
void print_all_arr(int* arr)
{
    // just print all arr datas regarding index.
    for(int i = 0; i <= max_arr_count_index; i++) {
        printf("arr[%d] = %d \n", i, arr[i]);
    }
}

// insert
void insertAt(int* target_arr, int target_index, int value_to_update)
{
    printf("max_arr_count_index : %d\n", max_arr_count_index);
    int max_arr_count_temp = max_arr_count_index;
    
    // step 1. total arr index count up+1 because it is gonna be inserted.
    max_arr_count_index = max_arr_count_index + 1;
    
    // step 2. push the arr data to the right side in order to insert target data to the index.
    // ?? -_-;;; target_arr[5] = 1;
    
    /*
    while(max_arr_count_temp >= target_index) {
        target_arr[max_arr_count_temp+1] = target_arr[max_arr_count_temp];
        max_arr_count_temp = max_arr_count_temp - 1;
    }
    */
    printf("max_arr_count_index : %d\n", max_arr_count_index);

    // step 3. recover temp arr index count variable in case.
    max_arr_count_temp = max_arr_count_index;
    
    // step 4.finally, insert data to the index.
    target_arr[target_index] = value_to_update;
}

/*
// delete
void deleteAt(int* arr, int index)
{
    
}
// udpate
void updateAt(int* arr, int index, int value_to_update)
{
    
}
// read
int getAt(int* arr, int index)
{
    
}

// search
int search(int* arr, int data)
{
    
}
 
// array index empty check
int is_empty()
{
    
}

// array index full check
int is_full()
{
    
}
*/
