//
//  main.c
//  DynamicArrayList
//
//  Created by Seoksoon Jang on 2016. 11. 6..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>
#include "c_array_list.h"

int main(int argc, const char * argv[]) {
    
    dynamicArrList* p;
    __int64_t arr[] = {1,2,3,4,5};
    p = initArrayList(p, arr, sizeof(arr));
    
    printf("ptr->currentIndex : %d\n", p->currentIndex);
    insertValueAt(p, 3, 4);
    printf("ptr->currentIndex : %d\n", p->currentIndex);
    removeWithValue(p, 4);
    printAll(p);
    printf("ptr->currentIndex : %d\n", p->currentIndex);
    removeWithValue(p, 5);
    printAll(p);
    removeWithValue(p, 4);
    printAll(p);
    removeWithValue(p, 1);
    printAll(p);
    removeWithValue(p, 2);
    printAll(p);
    printf("ptr->currentIndex : %d\n", p->currentIndex);
    removeWithValue(p, 3);
    printAll(p);
    insertValueAt(p, 100, 1000);
    printAll(p);
    insertValueAt(p, 1, 1);
    printAll(p);
    insertValueAt(p, 1, 11);
    printAll(p);
    
    removeWithValue(p, 1000);
    printAll(p);
    removeWithValue(p, 11);
    printAll(p);
    removeWithValue(p, 222);
    removeWithValue(p, 1);
    printAll(p);
    printAll(p);
    
    insertValueAt(p, 1, 111);
    printAll(p);
    
    insertValueAt(p, 0, 0);
    printAll(p);
    
    updateValueAt(p, 0, 999);
    printAll(p);
    
    updateValueAt(p, 1, 888);
    printAll(p);
    
    printf("getIndex[0] : %d\n", getValueAt(p, 0));
    printf("getIndex[1] : %d\n", getValueAt(p, 1));
    
    removeWithValue(p, 999);
    removeWithValue(p, 888);

    insertValueAt(p, 100, 1000);
    
    printf("getIndex[0] : %d\n", getValueAt(p, 0));
    
    printAll(p);
    
    
    
    /*
    removeWithValue(p, 5);
    printAll(p);

    removeWithValue(p, 4);
    printAll(p);
    removeWithValue(p, 1);
    printAll(p);
    removeWithValue(p, 3);
    printAll(p);
    removeWithValue(p, 22);
    printAll(p);
    removeWithValue(p, 2);
    printAll(p);
    
    insertValueAt(p, 100, 1000);
    printAll(p);
    */

    // printAll(p);
    // removeWithValue(p, 100);
    
    
    return 0;
}
