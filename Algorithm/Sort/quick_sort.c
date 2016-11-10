//
//  quick_sort.c
//  SelectionSort
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "quick_sort.h"

void q_sort(int arr[], int left, int right) {
    
    int pivot = arr[left];
    int left_hold = left;
    int right_hold = right;
    
    while (left < right) {
        while ((arr[right] >= pivot) && (left < right)) {
            right--;
        }
        
        if (left != right) {
            arr[left] = arr[right];
        }
        
        while ((arr[left] <= pivot) && (left < right)) {
            left++;
        }
        
        if (left != right) {
            arr[right] = arr[left];
            right --;
        }
    }
    
    arr[left] = pivot;
    pivot = left;
    left = left_hold;
    right = right_hold;
    
    if (left < pivot) {
        q_sort(arr, left, pivot - 1);
    }
    
    if (right > pivot) {
        q_sort(arr, pivot+1, right);
    }
}

void quick_sort(int arr[], int arr_length) {
    q_sort(arr, 0, arr_length -1);
}
