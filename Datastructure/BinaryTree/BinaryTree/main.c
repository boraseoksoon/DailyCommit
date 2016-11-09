//
//  main.c
//  binary_tree
//
//  Created by Seoksoon Jang on 2016. 11. 9..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>
#include <time.h>
#include "binary_tree.h"

int main(int argc, const char * argv[]) {
    
    clock_t begin = clock();

    /*  Create Node */
    Node* A = createNode('A');
    Node* B = createNode('B');
    Node* C = createNode('C');
    Node* D = createNode('D');
    Node* E = createNode('E');
    
    /*  Append Node to the tree */
    A->left  = B;
    B->left  = C;
    B->right = D;
    A->right = E;
    
    /*  Print Node */
    printf("[Preorder Sequence]\n");
    preorderPrintTree(A);
    printf("\n\n");
    
    printf("[Inorder Sequence]\n");
    inorderPrintTree(A);
    printf("\n\n");
 
    printf("[Postorder Sequence]\n");
    postorderPrintTree(A);
    printf("\n\n");
    
    /*  Destroy */
    printf("[Post-oder-traversing, destroy the tree]\n");
    printf("order of free -> ");
    destroyTree(A);
    printf("\n\n");
    
    
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("Program exited with elapsed time : %f\n", time_spent);

    return 0;
}
