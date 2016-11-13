//
//  doubly_circular_linkedlist.h
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef doubly_circular_linkedlist_h
#define doubly_circular_linkedlist_h

/* ADT) Doubly-Circular Linked-List.
 *
 *      (1) Object : Linear List data-structure linking by double line link pointer back and forth and circularly.
 *                   This list has the tail node pointing to the head again.
 *                   By doing this, this data structue can traverse in circular way without NULL next-link.
 *                   Not only will it get benefit of circular link, but also it has double pointer pointing each other.
 *                   Therefore, it can traverse in reverse and take advantage of double pointer for each left and right 
 *                   adjacent node.
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
 *          2-9. Void addNodeBefore(headNode) : append node before some specific node index.
 *          2-10. Void traverseList(headNode) : traverse and print all node in the list.
 *          2-11. Void reverseTraverseList(headNode) : reverse traverse and print all node in the list.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct doublyCircularLinkedListNode {
    int data;
    struct doublyCircularLinkedListNode* next;
    struct doublyCircularLinkedListNode* prev;
} DCLLNode;

DCLLNode* dcll_createDCLLNode(int _data);
DCLLNode* dcll_getNodeAt(DCLLNode* leadNode, int nodeIndex);
int dcll_getAllNodeCount(DCLLNode* leadNode);
void dcll_removeNode(DCLLNode** leadNode, DCLLNode* removeNode);
void dcll_addNodeFirst(DCLLNode** leadNode, DCLLNode* newNode);
void dcll_addNodeLast(DCLLNode** leadNode, DCLLNode* newNode);
void dcll_addNodeAfter(DCLLNode* currentNode, DCLLNode* newNode);
void dcll_addNodeBefore(DCLLNode** currentNode, DCLLNode* newNode);
int dcll_searchNode(DCLLNode* leadNode, int data);
void dcll_printAllDCLL(DCLLNode* leadNode);
void dcll_traverse(DCLLNode* leadNode);       // works same as printAllDLL.
void dcll_reverseTraverse(DCLLNode* leadNode);

#endif /* doubly_circular_linkedlist_h */
