#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "btreedef.h"
#include "btlinkedstack.h"
#include "btree.h"

/*
BTree* createBTree()
BTreeNodeData* searchBT(BTree* pBTree, int key)
int pushBTreeNode(LinkedStack* pStack, BTreeNode* data)
int insertNodeBT(BTree* pBTree, BTreeNodeData element)
void splitNodeBT(BTree* pBTree, LinkedStack* pStack)
BTreeNode* createBTreeNode(BTreeNodeData element)
void insertNodeElementBT(BTreeNode* pCurrentNode,
				BTreeNodeData element,
				BTreeNode* pRChildNode)
int deleteNodeBT(BTree* pBTree, int key)
void balanceBTree(BTree *pBTree, LinkedStack* pStack)
void borrowRightNodeBT(BTreeNode* pParentNode,
					 BTreeNode* pCurrentNode, int index, 
					 BTreeNode* pRightNode)
void borrowLeftNodeBT(BTreeNode* pParentNode,
					BTreeNode* pCurrentNode, int index, 
					BTreeNode* pLeftNode)
void mergeNodeBT(BTree *pBTree, LinkedStack* pStack,
				BTreeNode* pParentBTreeNode, 
				BTreeNode* pCurrentBTreeNode, int index)
BTreeNode* replaceLeafNodeBT(BTree *pBTree, BTreeNode* pDelNode, int index,
								LinkedStack* pStack)
int isLeafNode(BTreeNode* pParentNode)
int getIndexInfo(BTreeNode* pParentNode, BTreeNode* pCurrentNode)
void deleteKeyBT(BTreeNode* pNode, int index)
void displayBTree(BTree *pTree)
void displayBTreeNode(BTreeNode *pNode)
void deleteBTree(BTree* pBTree)
void deleteBTreeNode(BTreeNode* pBTreeNode)
*/
