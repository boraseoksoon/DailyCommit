//
//  circulary_linkedlist.c
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "circulary_linkedlist.h"

void cll_deleteNode(CLLNode* node) {
    
    if (node != NULL) {
        free(node);
    } else {
        perror("the node was already free or NULL.");
    }
    
}

CLLNode* cll_createCLLNode(int _data) {
    
    CLLNode* node = (CLLNode*)malloc(sizeof(CLLNode));
    node->data = _data;
    node->next = NULL;
    
    return node;
}

CLLNode* cll_getNodeAt(CLLNode* leadNode, int nodeIndex) {
    
    int allNodeCount = cll_getAllNodeCount(leadNode);
    
    // if the requested index of node goes away out of scope.
    if (nodeIndex > allNodeCount -1) {
        perror("[errror] list out of bound requested!\n");
        exit(1);
    }
    // Otherwise, it is happy case. it should be always in it.
    else {
        
        CLLNode* p;
        int nodeIncrementalCount = 0;
        
        if (leadNode == NULL) {
            perror("leadNode is NULL.\n");
            return NULL;
        } else {
            leadNode = leadNode->next;
        }
        
        p = leadNode;
        
        do {
            if (nodeIndex == nodeIncrementalCount) {
                return p;
            }
            p = p->next;
            nodeIncrementalCount++;
            
        } while (p != leadNode);
    }
    
    return NULL;
}

int cll_getAllNodeCount(CLLNode* leadNode) {
    
    int count = 0;
    
    CLLNode* p;
    
    if (leadNode == NULL) {
        perror("leadNode is NULL.\n");
        return -1;
    } else {
        leadNode = leadNode->next;
    }
    
    p = leadNode;
    
    do {
        count++;
        p = p->next;
    } while (p != leadNode);
    
    return count;
}

int cll_searchNode(CLLNode* leadNode, int data) {
    
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

void cll_removeNode(CLLNode** leadNode, CLLNode* removeNode) {
    
    CLLNode* headNode = *leadNode;
    CLLNode* prevNode = NULL;
    
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
    
    cll_deleteNode(removeNode);
}

void cll_addNodeFirst(CLLNode** leadNode, CLLNode* newNode) {
    
    if (*leadNode == NULL) {
        *leadNode = newNode;
        newNode->next = newNode;
    } else {
        newNode->next = (*leadNode)->next;
        (*leadNode)->next = newNode;
    }
}

void cll_addNodeLast(CLLNode** leadNode, CLLNode* newNode) {
    
    if (*leadNode == NULL) {
        *leadNode = newNode;
        newNode->next = newNode;
    } else {
        newNode->next = (*leadNode)->next;
        (*leadNode)->next = newNode;
        // head pointing.
        *leadNode = newNode;
    }
}

void cll_addNodeAfter(CLLNode* currentNode, CLLNode* newNode) {

    // if currentNode is head.
    if (currentNode == NULL) {
        currentNode = newNode;
        newNode->next = newNode;
    }
    // if currentNode is in the middle of list.
    else if (currentNode->next != NULL ) {        
        newNode->next = currentNode->next;
        currentNode->next = newNode;
    }
}

void cll_printAllCLL(CLLNode* leadNode) {
    
    CLLNode* p;
    
    if (leadNode == NULL) {
        return ;
    } else {
        leadNode = leadNode->next;
    }
    
    p = leadNode;
    
    do {
        printf("%d ", p->data);
        p = p->next;
        
    } while (p != leadNode);
    
    printf("\n");
}
