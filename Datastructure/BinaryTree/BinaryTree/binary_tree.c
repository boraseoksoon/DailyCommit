#include "binary_tree.h"

Node* createNode(char newData) {
	Node * newNode = (Node *)malloc(sizeof(Node));
	newNode->left = NULL;
	newNode->right = NULL;
	newNode->data = newData;
	return newNode;
}

void destroyNode(Node* Node) {
	free(Node);
}                                                             

void destroyTree(Node* Node) {
    /*
    if (Node->right != NULL) {
        destroyTree(Node->right);
    }
    if (Node->left != NULL) {
        destroyTree(Node->left);
    }
    Node->left = NULL;
    Node->right = NULL;
    destroyNode(Node);
    printf("%c ",Node->data);
    */
    
    if (Node == NULL) {
        return ;
    }
    
    destroyTree(Node->left);
    destroyTree(Node->right);
    destroyNode(Node);
    printf("%c ",Node->data);
    Node->left = NULL;
    Node->right = NULL;
    
}                                               
 
void preorderPrintTree(Node* Node) {
	if ( Node == NULL ) {
		return ;
	}
 
	printf("%c ",Node->data);
	preorderPrintTree(Node->left);
	preorderPrintTree(Node->right);
}                                                       

void inorderPrintTree(Node* Node) {

	if ( Node == NULL ) {
  		return ;
	}
 
 	inorderPrintTree(Node->left);
 	printf("%c ",Node->data);
	inorderPrintTree(Node->right);
}                                                        

void postorderPrintTree(Node* Node) {
	if (Node == NULL) {
		return ;
	}

    postorderPrintTree(Node->left);
	postorderPrintTree(Node->right);
	printf("%c ",Node->data);
}
