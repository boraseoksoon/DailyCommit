// package com.boraseoksoon.datastructure.nonlinear.tree;

class Node {
    char data;
    Node left;
    Node right;
    
    public Node(){
        this.left = null;
        this.right = null;
    }
    
    public Node(char data){
        this.data = data;
        this.left = null;
        this.right = null;
    }
    
    public Object getNodeData(){
        return data;
    }
}

public class BinarySearchTree {
	
    private Node rootNode = new Node();
    
    public Node insertKey(Node root, char data) {
    	
        Node currentNode = root;
        Node newNode = new Node(data);
        
        if(currentNode == null){
            return newNode;
        } else if (currentNode.data > newNode.data) {
            currentNode.left = insertKey(currentNode.left, data);
            return currentNode;
        } else if (currentNode.data < newNode.data) {
            currentNode.right = insertKey(currentNode.right, data);
            return currentNode;
        }else{
            return currentNode;
        }
    }
    
    public void insertNodeOnBSTWith(char x){
        rootNode = insertKey(rootNode, x);
    }
    
    public Node searchBST(char searchData ){
        
    	Node currentNode = rootNode;
        
        while(currentNode != null) {
        	
            if(searchData < currentNode.data) {
            	currentNode = currentNode.left;
            }
            else if(searchData > currentNode.data) {
            	currentNode = currentNode.right;
            }
            else {
            	return currentNode;
            }
        }
        return currentNode;
    }
    
    public void inorder(Node root){
        if (root == null) {
        	return ;
        }
        
        inorder(root.left);
        System.out.print(root.data + " ");
        inorder(root.right);
    }
    
    public void preorder(Node root) {
    	
    	if (root != null) {
    		System.out.print(root.data + " ");
            preorder(root.left);
            preorder(root.right);
        }
    }
    
    public void postorder(Node root) {
    	
    	if (root != null) {
    		
            postorder(root.left);
            postorder(root.right);
            System.out.print(root.data + " ");
        }
    }
    
    public void printBST(){
        inorder(rootNode);
        System.out.println();
    }
    
	public static void main(String[] args) {
		
		BinarySearchTree binarySearchTree = new BinarySearchTree();
        
		binarySearchTree.insertNodeOnBSTWith('V');
		binarySearchTree.insertNodeOnBSTWith('C');
        binarySearchTree.insertNodeOnBSTWith('G');
        binarySearchTree.insertNodeOnBSTWith('H');
        binarySearchTree.insertNodeOnBSTWith('D');
        binarySearchTree.insertNodeOnBSTWith('A');
        binarySearchTree.insertNodeOnBSTWith('B');
        binarySearchTree.insertNodeOnBSTWith('M');
        binarySearchTree.insertNodeOnBSTWith('Z');
        binarySearchTree.insertNodeOnBSTWith('J');
        binarySearchTree.insertNodeOnBSTWith('E');
        binarySearchTree.insertNodeOnBSTWith('Q');
        binarySearchTree.insertNodeOnBSTWith('I');
        
        System.out.println("Now, print Binary Tree ->");
        binarySearchTree.printBST();
        
        System.out.println("Traversing BST... : ");
        binarySearchTree.preorder(binarySearchTree.rootNode);
        System.out.println("");
        binarySearchTree.inorder(binarySearchTree.rootNode);
        System.out.println("");
        binarySearchTree.postorder(binarySearchTree.rootNode);
        System.out.println("");
        
        System.out.println("Try searching A in BST : ");
        Node resultNode = binarySearchTree.searchBST('A');
        
        if(resultNode != null) {
            System.out.println(resultNode.data + " search success");
        } else {
            System.out.println("search failure");
        }
        
        System.out.println("Try searching O in BST : ");
        Node resultNode2 = binarySearchTree.searchBST('O');
        if(resultNode2 != null) {
            System.out.println(resultNode2.data + " search success.");
        } else {
            System.out.println("search failure");
        }
	}
}
