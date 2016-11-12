//
//  main.c
//  LinkedList
//
//  Created by Seoksoon Jang on 2016. 11. 10..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>
#include "singly_linkedlist.h"
#include "doubly_linkedlist.h"
#include "circulary_linkedlist.h"
#include "doubly_circular_linkedlist.h"

int main(int argc, const char * argv[]) {
    
    printf("DLL begins ----> \n");
    DLLNode* dll_leadNode = NULL;
    
    dll_addNodeFirst(&dll_leadNode, dll_createDLLNode(1));
    
    dll_addNodeLast(&dll_leadNode, dll_createDLLNode(6));
    dll_addNodeLast(&dll_leadNode, dll_createDLLNode(7));
    dll_addNodeLast(&dll_leadNode, dll_createDLLNode(8));
    dll_addNodeLast(&dll_leadNode, dll_createDLLNode(9));
    
    dll_addNodeAfter(dll_getNodeAt(dll_leadNode, 0), dll_createDLLNode(1000));
    // dll_addNodeAfter(dll_getNodeAt(dll_leadNode, 2), dll_createDLLNode(66));

    dll_printAllDLL(dll_leadNode);
    
    dll_traverse(dll_leadNode);
    DLLNode* dll_tailNode = dll_getTail(dll_leadNode);
    dll_reverseTraverse(dll_tailNode);
    
    DLLNode* dll_node = dll_getNodeAt(dll_leadNode, 0);
    // caution : if head changes, it assigns given pointer the changed head.
    dll_addNodeBefore(&dll_node, dll_createDLLNode(999));
    dll_traverse(dll_node);
    DLLNode* dll_node2 = dll_getNodeAt(dll_node, 1);
    dll_addNodeBefore(&dll_node2, dll_createDLLNode(888));
    dll_traverse(dll_node);

    printf("all node count of dll : %d\n", dll_getAllNodeCount(dll_node));
    
    printf("DLL ends ----> \n");
    printf("\n\n");
    
    printf("CLL begins ----> \n");
    CLLNode* cll_leadNode = NULL;
    cll_addNodeFirst(&cll_leadNode, cll_createCLLNode(1));
    cll_addNodeFirst(&cll_leadNode, cll_createCLLNode(0));
    cll_addNodeLast(&cll_leadNode, cll_createCLLNode(2));
    cll_addNodeLast(&cll_leadNode, cll_createCLLNode(3));
    cll_addNodeLast(&cll_leadNode, cll_createCLLNode(4));
    cll_addNodeFirst(&cll_leadNode, cll_createCLLNode(9));
    cll_addNodeAfter(cll_getNodeAt(cll_leadNode, 0), cll_createCLLNode(1000));
    cll_addNodeAfter(cll_getNodeAt(cll_leadNode, 1), cll_createCLLNode(2000));
    cll_addNodeAfter(cll_getNodeAt(cll_leadNode, 3), cll_createCLLNode(3000));
    cll_addNodeLast(&cll_leadNode,  cll_createCLLNode(8000));
    cll_printAllCLL(cll_leadNode);
    
    printf("CLL ends ----> \n");
    

    printf("SLL begins ----> \n");
    SLLNode* leadNode = createSLLNode(1);
    SLLNode* node2 = createSLLNode(100);
    SLLNode* node3 = createSLLNode(110);
    SLLNode* node4 = createSLLNode(200);
    SLLNode* node5 = createSLLNode(150);
    SLLNode* node6 = createSLLNode(6);
    addNodeLast(&leadNode, node2);
    addNodeLast(&leadNode, node3);
    addNodeLast(&leadNode, node4);
    addNodeLast(&leadNode, node5);
    addNodeLast(&leadNode, node6);
    printAllSLL(leadNode);
    addNodeFirst(&leadNode, createSLLNode(0));
    printAllSLL(leadNode);
    
    
    addNodeAfter(getNodeAt(leadNode, 0), createSLLNode(1000));
    printAllSLL(leadNode);
    
    addNodeAfter(getNodeAt(leadNode, 3), createSLLNode(333));
    printAllSLL(leadNode);
    
    addNodeAfter(getNodeAt(leadNode, 1), createSLLNode(111));
    printAllSLL(leadNode);

    removeNode(&leadNode, getNodeAt(leadNode, 1));
    printAllSLL(leadNode);
    
    removeNode(&leadNode, getNodeAt(leadNode, 2));
    printAllSLL(leadNode);
    
    removeNode(&leadNode, getNodeAt(leadNode, 0));
    printAllSLL(leadNode);
    removeNode(&leadNode, getNodeAt(leadNode, 0));
    printAllSLL(leadNode);
    removeNode(&leadNode, getNodeAt(leadNode, 0));
    printAllSLL(leadNode);
    removeNode(&leadNode, getNodeAt(leadNode, 0));
    printAllSLL(leadNode);
    removeNode(&leadNode, getNodeAt(leadNode, 0));
    printAllSLL(leadNode);
    
    addNodeLast(&leadNode, createSLLNode(1000));
    printAllSLL(leadNode);
    addNodeLast(&leadNode, createSLLNode(2000));
    printAllSLL(leadNode);
    addNodeLast(&leadNode, createSLLNode(99));
    printAllSLL(leadNode);
    
    int index = searchNode(leadNode, 99);
    printf("found in index : %d\n", index);
    
    removeNode(&leadNode, getNodeAt(leadNode, 2));
    printAllSLL(leadNode);
    removeNode(&leadNode, getNodeAt(leadNode, 0));
    printAllSLL(leadNode);
    removeNode(&leadNode, getNodeAt(leadNode, 0));
    printAllSLL(leadNode);
    printf("SLL ends ----> \n");
    
    return 0;
}
