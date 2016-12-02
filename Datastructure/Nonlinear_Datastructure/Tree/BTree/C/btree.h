#ifndef _B_TREE_
#define _B_TREE_

#include "btreedef.h"

typedef struct BTreeType
{
	BTreeNode *pRootNode;
} BTree;

BTree* createBTree();

BTreeNode* createBTreeNode(BTreeNodeData element);

void deleteBTree(BTree* pBTree);

void deleteBTreeNode(BTreeNode* pBTreeNode);

int insertNodeBT(BTree* pBTree, BTreeNodeData element);

void insertNodeElementBT(BTreeNode* pCurrentNode, 
				BTreeNodeData element,
				BTreeNode* pRChildNode);

void splitNodeBT(BTree* pBTree, struct LinkedStackType* pStack);

int deleteNodeBT(BTree* pBTree, int key);

int isLeafNode(BTreeNode* pParentNode);

BTreeNode* replaceLeafNodeBT(BTree *pBTree, BTreeNode* pDelNode, int index,
								struct LinkedStackType* pStack);

void deleteKeyBT(BTreeNode* pNode, int index);

void balanceBTree(BTree* pBTree, struct LinkedStackType* pStack);

int getIndexInfo(BTreeNode* pParentNode, BTreeNode* pCurrentNode);

void borrowRightNodeBT(BTreeNode* pParentNode, BTreeNode* pCurrentNode, int index, BTreeNode* pRightNode);

void borrowLeftNodeBT(BTreeNode* pParentNode, BTreeNode* pCurrentNode, int index, BTreeNode* pLeftNode);

void mergeNodeBT(BTree *pBTree, struct LinkedStackType* pStack, BTreeNode* pParentBTreeNode, BTreeNode* pCurrentBTreeNode, int index);

BTreeNodeData* searchBT(BTree* pBTree, int key);

void displayBTree(BTree *pTree);

void displayBTreeNode(BTreeNode *pNode);

#endif

#ifndef _COMMON_TREE_DEF_
#define _COMMON_TREE_DEF_

#endif
