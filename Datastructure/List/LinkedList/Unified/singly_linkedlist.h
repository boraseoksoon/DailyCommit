//
//  singly_linkedlist.h
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef singly_linkedlist_h
#define singly_linkedlist_h

/* ADT) Singly Linked-List.
 *
 *      (1) Object : Linear List data-structure linking by single line link pointer.
 *
 *      (2) Functions :
 *          2-1. Node createNode(data) := create node with data and return.
 *          2-2. Node getNode(index of list) : get a specific node.
 *          2-3. all-node-count getAllNodeCount(head) : return all node element count in the list using head pointer.
 *          2-4. Void removeNode(index) : remove specific node at the index given.
 *          2-5. Void appednNode(node) : append node to the last node(tail)
 *          2-6. Void appendNodeAfterIndex(node) : append node after some specific node index.
 *          2-7. Node searchNode(headNode, searchValue) :
                    if you give searchValue with headPointer, it'll return the Node you would like to find.
 *          2-8. Void printAllNode(headNode) : traverse and print all node in the list.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct singularlyLinkedListNode {
    int data;
    struct singularlyLinkedListNode* next;
} SLLNode;

SLLNode* createSLLNode(int _data);
SLLNode* getNodeAt(SLLNode* leadNode, int nodeIndex);
int getAllNodeCount(SLLNode* leadNode);
void removeNode(SLLNode** leadNode, SLLNode* removeNode);
void addNodeLast(SLLNode** leadNode, SLLNode* newNode);
void addNodeAfter(SLLNode* currentNode, SLLNode* newNode);
void addNodeFirst(SLLNode** leadNode, SLLNode* newNode);
int searchNode(SLLNode* leadNode, int data);
void printAllSLL(SLLNode* leadNode);

#endif /* singly_linkedlist_h */
