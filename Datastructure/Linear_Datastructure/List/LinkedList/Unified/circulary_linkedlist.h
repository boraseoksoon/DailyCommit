//
//  circulary_linkedlist.h
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef circulary_linkedlist_h
#define circulary_linkedlist_h

/* ADT) Circularly Linked-List.
 *
 *      (1) Object : Linear List data-structure linking by single line link pointer circularly.
 *                   This list has the tail node pointing to the head again.
 *                   By doing this, this data structue can traverse in circular way without NULL next-link.
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

typedef struct circularlyLinkedListNode {
    int data;
    struct circularlyLinkedListNode* next;
} CLLNode;

CLLNode* cll_createCLLNode(int _data);
CLLNode* cll_getNodeAt(CLLNode* leadNode, int nodeIndex);
int cll_getAllNodeCount(CLLNode* leadNode);
void cll_removeNode(CLLNode** leadNode, CLLNode* removeNode);
void cll_addNodeFirst(CLLNode** leadNode, CLLNode* newNode);
void cll_addNodeLast(CLLNode** leadNode, CLLNode* newNode);
void cll_addNodeAfter(CLLNode* currentNode, CLLNode* newNode);
int cll_searchNode(CLLNode* leadNode, int data);
void cll_printAllCLL(CLLNode* leadNode);

#endif /* circulary_linkedlist_h */
