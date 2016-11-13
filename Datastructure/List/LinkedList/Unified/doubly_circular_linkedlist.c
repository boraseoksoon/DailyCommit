//
//  doubly_circular_linkedlist.c
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "doubly_circular_linkedlist.h"

void dcll_deleteNode(DCLLNode* node) {
    
    if (node != NULL) {
        free(node);
    } else {
        perror("cannot free the node because node is already NULL.\n");
    }
}

DCLLNode* dcll_createDCLLNode(int _data) {
    
    DCLLNode* newNode = (DCLLNode*)malloc(sizeof(DCLLNode));
    newNode->next = NULL;
    newNode->prev = NULL;
    newNode->data= _data;
    
    return newNode;
}

DCLLNode* dcll_getNodeAt(DCLLNode* leadNode, int nodeIndex) {
    
    int runCount = 0;
    leadNode = leadNode->next;
    
    DCLLNode* runNode = leadNode;
    
    do {

        if(nodeIndex == runCount) {
            return runNode;
        }
        
        runCount++;
        runNode = runNode->next;
        
    } while (runNode != leadNode);
    
    return NULL;
}

int dcll_getAllNodeCount(DCLLNode* leadNode) {
    
    int runCount = 0;
    DCLLNode* runNode = leadNode->next;
    runCount++;
    
    do {
        runCount++;
        runNode = runNode->next;
    } while (runNode != leadNode);
    
    return runCount;
}

int dcll_searchNode(DCLLNode* leadNode, int data) {
    
    DCLLNode* runNode = leadNode->next;
    int runCount = 0;
    
    do {
        
        if (runNode->data == data) {
            return runCount;
        }
        runCount++;
        runNode = runNode->next;
        
    } while (runNode != leadNode);
    
    if (runNode->data == data) {
        return runCount;
    }
    
    return -1;
}

void dcll_removeNode(DCLLNode** leadNode, DCLLNode* removeNode) {
    
    // if there is no node to remove
    if (*leadNode == NULL || removeNode == NULL) {
        perror("there is no node specified to remove, please create node before remove.\n");
        return ;
    }
    // Otherwise,
    else {
        
        DCLLNode* runNode = (*leadNode)->next;
        
        do {
            
            // if the node found,
            if (runNode->data == removeNode->data) {
                
                // if the node found is the first node(in the list traverse index, not head) linking the next node.
                if (runNode->prev == (*leadNode) && runNode->next != NULL) {
                    
                    runNode->prev->next = runNode->next;
                    runNode->next->prev = runNode->prev;
                    
                }
                // if the node found is the head node linking nothing.(the head node existing alone)
                else if (runNode->prev == runNode && runNode->next == runNode) {
                    (*leadNode) = NULL;
                }
                // if the node found is in the middle of the list.
                else if (runNode->next != NULL && runNode->prev != NULL) {
                    runNode->prev->next = runNode->next;
                    runNode->next->prev = runNode->prev;
                }
                
                dcll_deleteNode(runNode);
                return ;

            }
            
            runNode = runNode->next;
            
        } while (runNode != (*leadNode));
        
        
        if (runNode->data == removeNode->data) {
            
            // if the node found is the tail node
            if (runNode == *leadNode) {
                runNode->prev->next = runNode->next;
                runNode->next->prev = runNode->prev;
                
                (*leadNode) = runNode->prev;
                
                dcll_deleteNode(runNode);
                return ;
            }
        }
    }
    
    // after iteration finished, if the node not found.
    perror("tried to search to remove the node. However, no node to remove found.\n");
}

void dcll_addNodeFirst(DCLLNode** leadNode, DCLLNode* newNode) {
    
    // if there is no head node.
    if ((*leadNode) == NULL) {
        (*leadNode) = newNode;
        
        newNode->next = newNode;
        newNode->prev = newNode;
    }
    
    // if there is alerady head node linking to nothing.
    else if ((*leadNode)->prev == (*leadNode) && (*leadNode)->next == (*leadNode)) {
        
        newNode->next = (*leadNode);
        newNode->prev = (*leadNode);
        
        (*leadNode)->next = newNode;
        (*leadNode)->prev = newNode;
    }
    
    // if there is already head node linking to next node.
    else {
        
        newNode->next = (*leadNode)->next;
        (*leadNode)->next->prev = newNode;
        (*leadNode)->next = newNode;
        newNode->prev = (*leadNode);
    }
}

void dcll_addNodeLast(DCLLNode** leadNode, DCLLNode* newNode) {
    
    // if there is no head node.
    if ((*leadNode) == NULL) {
        perror("there is no head node to link, please DCLL_addNodeFirst before using it.\n");
        return ;
    }
    // else, good to go.
    else {
        newNode->next = (*leadNode)->next;
        (*leadNode)->next->prev = newNode;
        
        (*leadNode)->next = newNode;
        newNode->prev = (*leadNode);
        
        *leadNode = newNode;
    }
}

void dcll_addNodeAfter(DCLLNode* currentNode, DCLLNode* newNode) {
    
    // if there is no-node specified to link.
    if ((currentNode) == NULL) {
        perror("there is no node specified to link, please create node before linking.\n");
        return ;
    }
    // Otherwise,
    else {
        newNode->prev = currentNode;
        newNode->next = currentNode->next;
        
        currentNode->next->prev = newNode;
        currentNode->next = newNode;
    }
}

void dcll_printAllDCLL(DCLLNode* leadNode) {
        
    DCLLNode* runNode = NULL;
    
    if (leadNode == NULL) {
        return ;
    } else {
        leadNode = leadNode->next;
    }
    
    runNode = leadNode;
    
    do {
        printf("%d ", runNode->data);
        runNode = runNode->next;
        
    } while (runNode != leadNode);
    
    printf("\n");
}

void dcll_traverse(DCLLNode* leadNode) {
    
    printf("DCLL traverse begins!\n");
    
    DCLLNode* runNode = NULL;
    
    if (leadNode == NULL) {
        return ;
    } else {
        leadNode = leadNode->next;
    }
    
    runNode = leadNode;
    
    do {
        printf("%d ", runNode->data);
        runNode = runNode->next;
        
    } while (runNode != leadNode);
    
    printf("\n");

}

void dcll_reverseTraverse(DCLLNode* tailNode) {
    
    printf("DCLL reverse-traverse begins!\n");
    
    DCLLNode* runNode = tailNode;
    
    do {
        printf("%d ", runNode->data);
        runNode = runNode->prev;
        
    } while (runNode != tailNode);
    
    printf("\n");

}

void dcll_addNodeBefore(DCLLNode** currentNode, DCLLNode* newNode) {
    
    // if there is no-node specified to link.
    if ((currentNode) == NULL) {
        perror("there is no node specified to link, please create node before linking.\n");
        return ;
    }
    // Otherwise, good to go.
    else {

        newNode->next = (*currentNode);
        newNode->prev = (*currentNode)->prev;
        
        (*currentNode)->prev->next = newNode;
        (*currentNode)->prev = newNode;
        
    }
}
