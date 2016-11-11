//
//  singly_linkedlist.c
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "singly_linkedlist.h"

void deleteNode(SLLNode* node) {
    
    if (node != NULL) {
        free(node);
    } else {
        perror("the node was already free or NULL.");
    }
    
}

SLLNode* createSLLNode(int _data) {
    
    SLLNode* node = (SLLNode*)malloc(sizeof(SLLNode));
    node->data = _data;
    node->next = NULL;
    
    return node;
}

SLLNode* getNodeAt(SLLNode* leadNode, int nodeIndex) {

    int allNodeCount = getAllNodeCount(leadNode);
    
    // if the requested index of node goes away out of scope.
    if (nodeIndex > allNodeCount -1) {
        perror("[errror] list out of bound requested!\n");
        exit(1);
    }
    // Otherwise, it is happy case. it should be always in it.
    else {
        
        int nodeIncrementalCount = 0;
        while(leadNode != NULL) {
            
            if (nodeIncrementalCount == nodeIndex) {
                return leadNode;
            }
            
            leadNode = leadNode->next;
            nodeIncrementalCount++;
        }
    }
    
    exit(1);
    return NULL;
}

int getAllNodeCount(SLLNode* leadNode) {
    
    int count = 0;

    while (leadNode != NULL) {
        leadNode = leadNode->next;
        count++;
    }
    
    return count;
}

int searchNode(SLLNode* leadNode, int data) {
    
    int index = 0;
    
    while(leadNode != NULL) {
        
        if (leadNode->data == data) {
            return index;
        }
        
        leadNode = leadNode->next;
        index++;
    }
    
    return -1;
}

void removeNode(SLLNode** leadNode, SLLNode* removeNode) {

    SLLNode* headNode = *leadNode;
    SLLNode* prevNode = NULL;
    
    // if there is ONLY head node in the list.
    if (headNode->next == NULL) {
        *leadNode = headNode->next;
    }
    
    // keep moving on until the tail.
    while (headNode != NULL) {
        
        // if node is found
        if (headNode == removeNode) {
            // if the node to remove has the next link.
            if (headNode->next != NULL) {
                
                // if the node to remvoe is in the middle of the list.
                if (prevNode != NULL) {
                    prevNode->next = headNode->next;
                    break;
                }
                // if the node to remvoe is the head node of the list.
                else {
                    *leadNode = headNode->next;
                    break;
                }
            }
            // if the node to remove is the tail of the list.
            else if (headNode->next == NULL && prevNode != NULL) {
                prevNode->next = NULL;
            }
        }
        
        prevNode = headNode;
        headNode = headNode->next;
    }
    
    deleteNode(removeNode);
}

void addNodeFirst(SLLNode** leadNode, SLLNode* newNode) {
    
    SLLNode* currentNode = *leadNode;
    
    // if head does not exist
    if (currentNode == NULL) {
        *leadNode = newNode;
    }
    // if head exists
    else {
        newNode->next = currentNode;
        *leadNode = newNode;
    }
}

void addNodeLast(SLLNode** leadNode, SLLNode* newNode) {
    
    SLLNode* currentNode = *leadNode;
    
    // if head does not exist
    if (currentNode == NULL) {
        *leadNode = newNode;
    }
    // if head exists
    else {
        while(currentNode->next != NULL) {
            currentNode = currentNode->next;
        }
        
        currentNode->next = newNode;
    }
}

void addNodeAfter(SLLNode* currentNode, SLLNode* newNode) {
    
    // if currentNode is head or tail.
    if (currentNode->next == NULL) {
        currentNode->next = newNode;
    }
    // if currentNode is in the middle of list.
    else if (currentNode->next != NULL) {
        newNode->next = currentNode->next;
        currentNode->next = newNode;
    }
}

void printAllSLL(SLLNode* leadNode) {
    
    if (leadNode != NULL) {
        
        while (leadNode != NULL) {
            printf("%d ", leadNode->data);
            leadNode = leadNode->next;
        }
        printf("\n");
    } else {
        perror("head of list is NULL!");
    }
}
