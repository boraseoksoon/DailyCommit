//
//  main.c
//  Tree
//
//  Created by Seoksoon Jang on 2016. 11. 12..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>
#include "btree.h"

int main(int argc, const char * argv[]) {
    
    BTree *pTree = NULL;
    BTreeNodeData *pSearchElement = NULL;
    int key = 0;
    
    BTreeNodeData eA = {9, 'A'};
    BTreeNodeData eB = {12, 'B'};
    BTreeNodeData eC = {19, 'C'};
    BTreeNodeData eD = {39, 'D'};
    BTreeNodeData eE = {65, 'E'};
    BTreeNodeData eF = {53, 'F'};
    BTreeNodeData eG = {63, 'G'};
    BTreeNodeData eH = {89, 'H'};
    BTreeNodeData eI = {48, 'I'};
    BTreeNodeData eJ = {36, 'J'};
    
    pTree = createBTree();
    
    if (pTree != NULL)
    {
        insertNodeBT(pTree, eA);
        insertNodeBT(pTree, eB);
        insertNodeBT(pTree, eC);
        insertNodeBT(pTree, eD);
        printf("--------------------\n");
        displayBTree(pTree);
        
        insertNodeBT(pTree, eE);
        printf("--------------------\n");
        displayBTree(pTree);
        
        insertNodeBT(pTree, eF);
        insertNodeBT(pTree, eG);
        insertNodeBT(pTree, eH);
        printf("--------------------\n");
        displayBTree(pTree);
        
        insertNodeBT(pTree, eI);
        insertNodeBT(pTree, eJ);
        
        printf("--------------------\n");
        displayBTree(pTree);
        
        deleteNodeBT(pTree, 9);
        printf("--------------------\n");
        displayBTree(pTree);
        
        deleteNodeBT(pTree, 89);
        printf("--------------------\n");
        displayBTree(pTree);
        
        deleteNodeBT(pTree, 39);
        printf("--------------------\n");
        displayBTree(pTree);
        
        deleteNodeBT(pTree, 63);
        deleteNodeBT(pTree, 53);
        printf("--------------------\n");
        displayBTree(pTree);
        
        deleteNodeBT(pTree, 36);
        printf("--------------------\n");
        displayBTree(pTree);
        
        key = 19;
        
        pSearchElement = searchBT(pTree, key);
        
        if (pSearchElement != NULL) {
            printf("search --> index %d, value : %c\n", key, pSearchElement->value);
        }
        else {
            printf("[%d] search found\n", key);
        }
        
        deleteBTree(pTree);
    }
    
}
