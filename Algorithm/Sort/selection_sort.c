//
//  selection_sort.c
//  SelectionSort
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "selection_sort.h"

void selection_sort(int arr[], int arr_length) {
    
    printf("selection sort begins ---->\n");
    
    for (int i=0; i < arr_length; i++) {
        for (int j=i; j < arr_length; j++) {
            if (arr[i] > arr[j]) {
                swap(&arr[i], &arr[j]);
            }
        }
    }
    
    printf("selection sort ends ---->\n");
}
