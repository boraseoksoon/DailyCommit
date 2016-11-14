//
//  c_array_list.c
//  DynamicArrayList
//
//  Created by Seoksoon Jang on 2016. 11. 7..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "c_array_list.h"

void printAll(dynamicArrList* ptr) {
    int* temp_ptr = (int*)ptr->listPointer;
    
    printf("printAll given list : ");
    printf("{ ");
    for (int i=0; i <= ptr->currentIndex; i++) {
        
        if(i == ptr->currentIndex) {
            printf("%d ", temp_ptr[i]);
        } else {
            printf("%d, ", temp_ptr[i]);
        }
    }
    printf("}\n");
}

void* createArrayList(__int64_t sizeOfBuffer) {
    void* ptr = (void*) malloc(sizeOfBuffer);
    memset(ptr, 0, sizeOfBuffer);
    
    return ptr;
}

// create
dynamicArrList* initArrayList(dynamicArrList* ptr, __int64_t listToCreate[], __int64_t fullSizeOfBuffer) {
    
    ptr = (dynamicArrList*) malloc(sizeof(dynamicArrList));
    ptr->currentIndex = 0;
    ptr->listPointer = NULL;
    
    ptr->listPointer = createArrayList(fullSizeOfBuffer);
    ptr->currentIndex = fullSizeOfBuffer / sizeof(__int64_t) - 1;
    
    int* temp_ptr = (int*)ptr->listPointer;
    
    for (int i=0; i <= ptr->currentIndex; i++) {
        temp_ptr[i] = listToCreate[i];
    }
    
    return ptr;
}

bool isFull(dynamicArrList* ptr, __int64_t indexToInsert) {
    
    if (ptr->currentIndex < indexToInsert) {
        return true;
    }
    
    return false;
}

// isEmpty
bool isEmpty(dynamicArrList* ptr) {
    
    if (ptr->currentIndex == -1) {
        return true;
    }
    return false;
}

// assign
void assignAllValues(dynamicArrList* ptr, __int64_t length) {
    printf("assigned!\n");
    int* temp_ptr = (int*)ptr->listPointer;
    ptr->currentIndex = 0;
    
    for(int i=0; i<length; i++){
        temp_ptr[i] = i;
        ptr->currentIndex+=1;
    }
}

dynamicArrList* createOneMoreBuffer(dynamicArrList* ptr) {
    
    int* temp_ptr = (int*)ptr->listPointer;
    
    // backup all original datas to assign to new buffer again.
    int* backupArr = (int*)malloc(ptr->currentIndex * sizeof(__int64_t));
    memset(backupArr, 0, ptr->currentIndex * sizeof(__int64_t));
    
    int i = 0;
    
    while (ptr->currentIndex >= i) {
        backupArr[i] = temp_ptr[i];
        i++;
    }
    
    // create +1 buffer more.
    initArrayList(ptr, backupArr, sizeof(__int64_t) * (ptr->currentIndex + 1));
    ptr->currentIndex+=1;
    
    return ptr;
}

dynamicArrList* insertValueAt(dynamicArrList* ptr, __int64_t indexToInsert, __int64_t valueToInsert) {
    
    int* temp_ptr = (int*)ptr->listPointer;
    
    if (isEmpty(ptr)) {
        ptr->currentIndex+=1;
        indexToInsert = ptr->currentIndex;
        temp_ptr[indexToInsert] = valueToInsert;
    }
    
    // insertValueAt should be always succeed like Python list does.
    else if(isFull(ptr, indexToInsert)){
        // printf("isFull!\n");
        // backup all original datas to assign to new buffer again.
        ptr = createOneMoreBuffer(ptr);
        indexToInsert = ptr->currentIndex;
        
    } else {
        // printf("NOT isFull!\n");
        
        // if there is only one index left
        // create +1 buffer more.
        ptr = createOneMoreBuffer(ptr);
        __int64_t actualMaxIndex = ptr->currentIndex-1;
        
        // Otherwise,
        // push all elements from indexToInsert to the right + 1. take care of order in order for data not to be removed.
        if (indexToInsert != 0) {
            
            for (actualMaxIndex; indexToInsert <= actualMaxIndex; actualMaxIndex--) {
                temp_ptr[actualMaxIndex + 1] = temp_ptr[actualMaxIndex];
            }
            
        } else {
            
            for (actualMaxIndex; indexToInsert != actualMaxIndex; actualMaxIndex--) {
                temp_ptr[actualMaxIndex + 1] = temp_ptr[actualMaxIndex];
            }
            
            // for index 0 case at the last.
            temp_ptr[1] = temp_ptr[0];
        }
        
        // printAll(ptr);
        // in the end, insert target to index destionation
    }
    
    // insert target to index destionation
    temp_ptr[indexToInsert] = valueToInsert;
    
    return ptr;
}

// get
int getValueAt(dynamicArrList* ptr, int indexToGet) {
    
    int* temp_ptr = (int*)ptr->listPointer;
    
    if (indexToGet > ptr->currentIndex) {
        perror("list array index to get is out of bounds..index overflows..\n");
        exit(1);
    } else if (indexToGet < 0) {
        perror("list array index should be greater than or equal to 0.\n");
        exit(1);
    }
    
    return temp_ptr[indexToGet];
}

// update
bool updateValueAt(dynamicArrList* ptr, int indexToUpdate, int valueToUpdate) {
    
    int* temp_ptr = (int*)ptr->listPointer;
    
    if (indexToUpdate > ptr->currentIndex) {
        perror("list array index to get is out of bounds..index overflows..\n");
        exit(1);
        
        return false;
        
    } else if (indexToUpdate < 0) {
        perror("list array index should be greater than or equal to 0.\n");
        exit(1);
        
        return false;
    }
    
    temp_ptr[indexToUpdate] = valueToUpdate;
    
    return true;
}

// search
__int64_t searchWithDataForIndex(dynamicArrList* ptr, __int64_t valueToSearch) {
    
    int* temp_ptr = ptr->listPointer;
    int returnIndex = -1;
    
    // to return the last index like Python list does.
    for (int i = 0; i <= ptr->currentIndex; i++) {
        if (valueToSearch == temp_ptr[i]) {
            returnIndex = i;
            continue;
        }
    }
    
    return returnIndex;
}

// delete
dynamicArrList* removeWithValue(dynamicArrList* ptr, __int64_t valueToDelete) {
    
    if(!isEmpty(ptr)) {
        int* temp_ptr = ptr->listPointer;
        
        __int64_t returnIndexToDelete = searchWithDataForIndex(ptr, valueToDelete);
        
        if (returnIndexToDelete != -1) {
            
            temp_ptr[returnIndexToDelete] = (int)NULL;
            
            for (; returnIndexToDelete < ptr->currentIndex; returnIndexToDelete++) {
                temp_ptr[returnIndexToDelete] = temp_ptr[returnIndexToDelete+1];
            }
            
            /*
             if (ptr->currentIndex != 0) {
             ptr->currentIndex-=1;
             }
             */
            ptr->currentIndex-=1;
            
        } else {
            printf("cannot find out %zu to delete\n", valueToDelete);
        }
        
        return ptr;
        
    } else {
        perror("deleteValue failed, already empty array list.\n");
        
    }
    
    return ptr;
}
