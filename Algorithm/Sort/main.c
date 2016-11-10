//
//  main.c
//  SelectionSort
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>
#include "selection_sort.h"
#include "bubble_sort.h"
#include "insertion_sort.h"
#include "quick_sort.h"

int main(int argc, const char * argv[]) {
   
    int arr[] = { 6,3,8,9,1,5 };
    int arr_length = sizeof(arr) / sizeof(arr[0]);
    
    print_all(arr, arr_length);
    selection_sort(arr, arr_length);
    print_all(arr, arr_length);
    
    printf("\n");
    
    int arr2[] = { 6,3,8,9,1,5 };
    int arr_length2 = sizeof(arr2) / sizeof(arr2[0]);
    
    print_all(arr2, arr_length2);
    bubble_sort(arr2, arr_length2);
    print_all(arr2, arr_length2);
    
    printf("\n");
    
    int arr3[] = { 6,3,8,9,1,5 };
    int arr_length3 = sizeof(arr3) / sizeof(arr3[0]);
    
    print_all(arr3, arr_length3);
    insertion_sort(arr3, arr_length3);
    print_all(arr3, arr_length3);
    
    printf("\n");
    
    int arr4[] = { 6,3,8,9,1,5 };
    int arr_length4 = sizeof(arr4) / sizeof(arr4[0]);
    
    print_all(arr4, arr_length4);
    printf("quick sort begins ---->\n");
    quick_sort(arr4, arr_length4);
    printf("quick sort ends ---->\n");
    print_all(arr4, arr_length4);
    
    return 0;
}
