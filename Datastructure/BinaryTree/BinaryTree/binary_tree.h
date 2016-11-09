#ifndef BINARY_TREE
#define BINARY_TREE

#include <stdio.h>
#include <stdlib.h>
 
typedef struct Node
{
	struct Node* left;
	struct Node* right;
	char data;
} Node;

Node*	createNode(char NewData);
void	destroyNode(Node* Node);
void	destroyTree(Node* Root);
void	preorderPrintTree(Node* Node);
void	inorderPrintTree(Node* Node);
void	postorderPrintTree(Node* Node);
    
#endif

