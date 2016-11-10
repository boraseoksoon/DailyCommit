//
//  insertion_sort.c
//  SelectionSort
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "insertion_sort.h"

void insertion_sort(int arr[], int arr_length) {
    
    printf("insertion-sort begins ---->\n");
    
    int i, j = 0;
    int temp = 0;
    
    // insertion sort using for
    /*
    for (i=1; i < arr_length; ++i) {
        temp = arr[i];
        for (j=i-1; j >= 0 && temp < arr[j]; --j) {
            arr[j+1] = arr[j];
        }

        arr[j+1] = temp;
    }
    */

    // insertion sort using while
    for (i = 1; i<arr_length; i++) {
        temp = arr[i];
        j = i-1;
        
        while (j >= 0 && temp < arr[j]) {
            arr[j+1] = arr[j];
            j--;
        }
        arr[j+1] = temp;
    }
    
    printf("insertion-sort ends ---->\n");
}

