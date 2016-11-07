//
//  c_array_list.h
//  DynamicArrayList
//
//  Created by Seoksoon Jang on 2016. 11. 7..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef c_array_list_h
#define c_array_list_h

#include <stdio.h>
#include <stdbool.h>

/*
 * (ADT) ArrayList
 * 
 * Objects : List implemented by dynamic allocated array in heap area. It just works like usual List.
             Motivated by Python list, it would be effective at access to data to get while insertion, remove are not
             because this is implemented by array.
             (O(N) time complexcity at insertion/remove whereas LinkedList is O(1) at the first index node)
             (But, insertion here has more overhead because of dynamic allocation for creating temporary buffer task.)
 * Functions : 
        1. ArrayList initialize(array-list to init, list data to create) ::= create the arraylist containing the list data.
        2. ArrayList insertListData(At index, array-list to use, data to insert) ::= insert the data at the specific index
           of teh arraylist.
        3. ArrayList updateListData(At index, array-list to use, data to update) ::= update the data at the specific index
           of teh arraylist.
        4. ArrayList removeListData(At index, array-list to use, data to remove) ::= remove the data at the specific index
           of teh arraylist.
        5. NULL printAllListDate(array-list to use) ::= print all of element in the array-list.
        6. Element getListElement(At index, array-list to use) ::= get the element of the specific index in the array list.
 */

typedef struct DynamicArrList{
    void* listPointer;
    __int64_t currentIndex;
} dynamicArrList;

void printAll(dynamicArrList* ptr);
// init and create array-list.
dynamicArrList* initArrayList(dynamicArrList* ptr, __int64_t listToCreate[], __int64_t fullSizeOfBuffer);

// Create
dynamicArrList* insertValueAt(dynamicArrList* ptr, __int64_t indexToInsert, __int64_t valueToInsert);

// Read
int getValueAt(dynamicArrList* ptr, int indexToGet);

// Update
bool updateValueAt(dynamicArrList* ptr, int indexToUpdate, int valueToUpdate);

// Delete
dynamicArrList* removeWithValue(dynamicArrList* ptr, __int64_t valueToDelete);

#endif /* c_array_list_h */
