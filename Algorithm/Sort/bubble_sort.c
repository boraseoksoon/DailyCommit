//
//  bubble_sort.c
//  SelectionSort
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "bubble_sort.h"

void bubble_sort(int arr[], int arr_length) {

    printf("bubble-sort begins ---->\n");
    
    for (int i=1; i < arr_length-1; i++) {
        for (int j=0; j < arr_length-i; j++) {
            if (arr[j] > arr[j+1]) {
                swap(&arr[j], &arr[j+1]);
            }
        }
    }
    
    printf("bubble-sort ends ---->\n");
}
