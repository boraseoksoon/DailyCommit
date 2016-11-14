//
//  doubly_linkedlist.c
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "doubly_linkedlist.h"

void dll_deleteNode(DLLNode* node) {
    
    if (node != NULL) {
        free(node);
    } else {
        perror("caanot free the node because node is already NULL.\n");
    }
}

DLLNode* dll_createDLLNode(int _data) {
    
    DLLNode* newNode = (DLLNode*)malloc(sizeof(DLLNode));
    newNode->next = NULL;
    newNode->prev = NULL;
    newNode->data= _data;
    
    return newNode;
}

DLLNode* dll_getNodeAt(DLLNode* leadNode, int nodeIndex) {
    
    DLLNode* runNode = leadNode;
    int runCount = 0;
    
    while (runNode != NULL) {

        if(nodeIndex == runCount) {
            return runNode;
        }
        
        runCount+=1;
        runNode = runNode->next;
    }
    
    // the last node
    return runNode;
}

int dll_getAllNodeCount(DLLNode* leadNode) {
    
    DLLNode* runNode = leadNode;
    int runCount = 0;
    
    while (runNode != NULL) {
        runCount++;
        runNode = runNode->next;
    }
    
    return runCount;
}

int dll_searchNode(DLLNode* leadNode, int data) {
    
    DLLNode* runNode = leadNode;
    int runCount = 0;
    
    while (runNode != NULL) {
        
        if (runNode->data == data) {
            return runCount;
        }
        
        runCount++;
        runNode = runNode->next;
    }
    
    return -1;
}

void dll_removeNode(DLLNode** leadNode, DLLNode* removeNode) {
    
    // if there is no node to remove
    if (*leadNode == NULL || removeNode == NULL) {
        perror("there is no node specified to remove, please create node before remove.\n");
        return ;
    }
    // Otherwise,
    else {
        
        DLLNode* runNode = *leadNode;
        
        while (runNode != NULL) {
            
            // if the node found,
            if (runNode->data == removeNode->data) {
                
                // if the node found is the head node linking the next node.
                if (runNode->prev == NULL && runNode->next != NULL) {
                    (*leadNode) = runNode->next;
                    runNode->next->prev = NULL;
                }
                // if the node found is the head node linking nothing.(the head node existing alone)
                else if (runNode->prev == NULL && runNode->next == NULL) {
                    (*leadNode) = NULL;
                }
                // if the node found is in the middle of the list.
                else if (runNode->next != NULL && runNode->prev != NULL) {
                    runNode->prev->next = runNode->next;
                    runNode->next->prev = runNode->prev;
                }
                // if the node found is the tail node
                else if (runNode->next == NULL && runNode->prev != NULL) {
                    runNode->prev->next = NULL;
                }
                
                dll_deleteNode(runNode);
                return ;
            }
            
            runNode = runNode->next;
            
        }
        
    }
    
    // after iteration finished, if the node not found.
    perror("tried to search to remove the node. However, no node to remove found.\n");
}

void dll_addNodeFirst(DLLNode** leadNode, DLLNode* newNode) {
    
    // if there is no head node
    if ((*leadNode) == NULL) {
        
        newNode->next = NULL;
        newNode->prev = NULL;
        
        (*leadNode) = newNode;
    }
    
    // if there is alerady head node linking to nothing.
    else if ((*leadNode) != NULL && (*leadNode)->next == NULL) {
        
        newNode->next = (*leadNode);
        newNode->prev = NULL;
        
        (*leadNode)->prev = newNode;
        (*leadNode)->next = NULL;
        
        (*leadNode) = newNode;
    }
    
    // if there is already head node linking to next node.
    else if ((*leadNode) != NULL && (*leadNode)->next != NULL) {
        
        newNode->next = (*leadNode);
        newNode->prev = NULL;
        
        (*leadNode)->prev = newNode;
        
        (*leadNode) = newNode;
    }
}

void dll_addNodeLast(DLLNode** leadNode, DLLNode* newNode) {
    
    // if there is no head node.
    if ((*leadNode) == NULL) {
        perror("there is no head node to link, please dll_addNodeFirst before using it.\n");
        return ;
    }
    // else, good to go.
    else {
        DLLNode* runNode = (*leadNode);
        
        while (runNode->next != NULL) {
            runNode = runNode->next;
        }
        
        runNode->next = newNode;
        
        newNode->prev = runNode;
        newNode->next = NULL;
    }
}

void dll_addNodeAfter(DLLNode* currentNode, DLLNode* newNode) {

    // if there is no-node specified to link.
    if ((currentNode) == NULL) {
        perror("there is no node specified to link, please create node before linking.\n");
        return ;
    }
    // Otherwise, good to go.
    else {
        // if the currentNode specified is the tail node.
        if (currentNode->next == NULL && currentNode->prev != NULL) {
            
            newNode->prev = currentNode;
            newNode->next = NULL;
            
            currentNode->next = newNode;
        }
        // Otherwise, // if the currentNode specified is the node in the middle of the list or the head
        else {
            
            newNode->prev = currentNode;
            newNode->next = currentNode->next;
  
            currentNode->next->prev = newNode;
            currentNode->next = newNode;
        }
    }
}

void dll_printAllDLL(DLLNode* leadNode) {
    
    DLLNode* runNode = leadNode;
    
    while (runNode != NULL) {
        printf("%d ", runNode->data);
        runNode = runNode->next;
    }
    
    printf("\n");
}

DLLNode* dll_getTail(DLLNode* leadNode) {
    
    DLLNode* runNode = leadNode;
    
    while (runNode->next != NULL) {
        runNode = runNode->next;
    }
    
    return runNode;
}

void dll_traverse(DLLNode* leadNode) {
    
    printf("DLL traverse begins!\n");
    
    DLLNode* runNode = leadNode;
    
    while (runNode != NULL) {
        printf("%d ", runNode->data);
        runNode = runNode->next;
    }
    
    printf("\n");
}

void dll_reverseTraverse(DLLNode* tailNode) {
    
    printf("DLL reverse-traverse begins!\n");
    
    DLLNode* reverseRunNode = tailNode;
    
    while (reverseRunNode != NULL) {
        printf("%d ", reverseRunNode->data);
        reverseRunNode = reverseRunNode->prev;
    }
    
    printf("\n");
}

void dll_addNodeBefore(DLLNode** currentNode, DLLNode* newNode) {
    
    // if there is no-node specified to link.
    if ((currentNode) == NULL) {
        perror("there is no node specified to link, please create node before linking.\n");
        return ;
    }
    // Otherwise, good to go.
    else {
        // if the currentNode specified is the tail node.
        if ((*currentNode)->next == NULL && (*currentNode)->prev != NULL) {
            
            newNode->next = (*currentNode);
            newNode->prev = (*currentNode)->prev;
            
            (*currentNode)->prev->next = newNode;
            
            (*currentNode)->prev = newNode;
            (*currentNode)->next = NULL;
        }
        // if the currentNode specified is the head node.
        else if ((*currentNode)->prev == NULL){
            newNode->prev = NULL;
            newNode->next = (*currentNode);
            
            (*currentNode)->prev = newNode;
            
            (*currentNode) = newNode;
        }
        // Otherwise, if the currentNode specified is in the middle of the list.
        else {
            newNode->next = (*currentNode);
            newNode->prev = (*currentNode)->prev;
            
            (*currentNode)->prev->next = newNode;
            (*currentNode)->prev = newNode;
        }
    }
}
