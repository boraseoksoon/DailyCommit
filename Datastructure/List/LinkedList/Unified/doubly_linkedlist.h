//
//  doubly_linkedlist.h
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef doubly_linkedlist_h
#define doubly_linkedlist_h

/* ADT) Doubly Linked-List.
 *
 *      (1) Object : Linear List data-structure linking by double line link pointer back and forth for each-other.
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
 *          2-9. Node getTail(headNode) : get Tail node for practically use.
 *          2-10. Void addNodeBefore(headNode) : append node before some specific node index.
 *          2-11. Void traverseList(headNode) : traverse and print all node in the list.
 *          2-12. Void reverseTraverseList(headNode) : reverse traverse and print all node in the list.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct doublyLinkedListNode {
    int data;
    struct doublyLinkedListNode* next;
    struct doublyLinkedListNode* prev;
} DLLNode;

void dll_deleteNode(DLLNode* node);

DLLNode* dll_createDLLNode(int _data);

DLLNode* dll_getNodeAt(DLLNode* leadNode, int nodeIndex);

int dll_getAllNodeCount(DLLNode* leadNode);

int dll_searchNode(DLLNode* leadNode, int data);

void dll_removeNode(DLLNode** leadNode, DLLNode* removeNode);

void dll_addNodeFirst(DLLNode** leadNode, DLLNode* newNode);

void dll_addNodeLast(DLLNode** leadNode, DLLNode* newNode);

void dll_addNodeAfter(DLLNode* currentNode, DLLNode* newNode);

void dll_printAllDLL(DLLNode* leadNode);

// additional functions in doubly linked-list.
DLLNode* dll_getTail(DLLNode* leadNode);

void dll_traverse(DLLNode* leadNode);       // works same as printAllDLL.

void dll_reverseTraverse(DLLNode* leadNode);

void dll_addNodeBefore(DLLNode** currentNode, DLLNode* newNode);

#endif /* doubly_linkedlist_h */
