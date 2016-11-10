//
//  sort_utility.c
//  SelectionSort
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "sort_utility.h"

void swap(int* target1, int* target2) {
    int temp = (*target1);
    (*target1) = (*target2);
    (*target2) = temp;
}

void print_all(int arr[], int arr_length) {
    
    for (int i=0; i<arr_length; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}
