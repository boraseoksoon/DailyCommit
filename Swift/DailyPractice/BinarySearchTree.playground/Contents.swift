//: Playground - noun: a place where people can play

import Foundation

var str = "Binary Search Tree in Swift"

enum TraverseOrder {
  case preOrder
  case inOrder
  case postOrder
}

enum BSTError: Error {
  case traverseFailure(errorReason: String)
}

enum Result<T> {
  case success(T)
  case failure(Error)
}

class BinarySearchTree {
  class BSTNode {
    var left: BSTNode?
    var right: BSTNode?
    var value: Int
    
    init(left: BSTNode?, right: BSTNode?, value: Int) {
      self.left = left
      self.right = right
      self.value = value
    }
    
    deinit {
      print("deinit!")
    }
  }
  
  var root: BSTNode?
  
  init(rootNodeValue: Int) {
    self.root = BSTNode(left: nil, right: nil, value: rootNodeValue)
  }
  
  // search
  public func search(value: Int) -> Bool {
    return searchIn(value: value, currentNode: self.root)
  }
  
  private func searchIn(value: Int, currentNode: BSTNode?) -> Bool {
    guard currentNode != nil else { return false }
    
    if value == currentNode!.value {
      return true
    }
    
    if currentNode!.value < value {
      if let rightNode = currentNode!.right {
        return searchIn(value: value, currentNode: rightNode)
      } else {
        return false
      }
    } else if currentNode!.value > value {
      if let leftNode = currentNode!.left {
        return searchIn(value: value, currentNode: leftNode)
      } else {
        return false
      }
    }
    return false
  }
  
  // insert
  public func insert(value: Int) -> Bool {
    guard self.root != nil else {
      self.root = BSTNode(left: nil, right: nil, value: value)
      return true
    }
    guard self.root!.value != value else { return false }
    
    return insertIn(value: value, currentNode:self.root!)
  }
  
  private func insertIn(value: Int, currentNode: BSTNode) -> Bool {
    guard currentNode.value != value else { return false }
    
    if currentNode.value < value {
      if let rightNode = currentNode.right {
        return insertIn(value: value, currentNode: rightNode)
      } else {
        let nodeToInsert = BSTNode(left: nil, right: nil, value: value)
        currentNode.right = nodeToInsert
        return true
      }
    } else if currentNode.value > value {
      if let leftNode = currentNode.left {
        return insertIn(value: value, currentNode: leftNode)
      } else {
        let nodeToInsert = BSTNode(left: nil, right: nil, value: value)
        currentNode.left = nodeToInsert
        return true
      }
    }
    return false
  }
  // remove
  func remove(value: Int) -> Bool {
    // remove node
    return removeIn(value: value, currentNode: &self.root)
  }
  
  func removeIn(value: Int, currentNode: inout BSTNode?) -> Bool {
    guard currentNode != nil else { return false }
    
    if value == currentNode!.value {
      // remove node having no child node to be removed
      if currentNode!.left == nil && currentNode!.right == nil {
        currentNode = nil
      }
      
      // remove node having one child node to be removed
      if currentNode!.left != nil && currentNode!.right == nil {
        currentNode = currentNode!.left
        currentNode?.left = nil
      } else if currentNode!.left == nil && currentNode!.right != nil {
        currentNode = currentNode?.right
        currentNode!.right = nil
      }
      
      // remove node having two child node to be removed
      if currentNode!.left != nil && currentNode!.right != nil {
        let leastNodeValue = searchLeastNodeValueToLeft(from: currentNode!.right)
        // print("leastNodeValue : \(leastNodeValue)")
        currentNode?.value = leastNodeValue
        
        // remove
      }
      
      return true
    }
    
    if currentNode!.value < value {
      return removeIn(value: value, currentNode: &currentNode!.right)
    } else if currentNode!.value > value {
      return removeIn(value: value, currentNode: &currentNode!.left)
    }
    
    return false
  }
  
  private func removeLeastNodeToLeft(from currentNode: inout BSTNode?) -> Bool {
    if currentNode?.left != nil {
      return removeLeastNodeToLeft(from: &currentNode!.left)
    }
    
    currentNode = nil
    return true
  }
  
  private func searchLeastNodeValueToLeft(from currentNode: BSTNode?) -> Int {
    if currentNode?.left != nil {
      return searchLeastNodeValueToLeft(from: currentNode?.left)
    }
    return currentNode!.value
  }
  
  // traverse
  func traverse(_ traverseWay: TraverseOrder?, complete: @escaping (Result<TraverseOrder>) -> Void) -> Void {
    if let traverseWay = traverseWay {
      switch traverseWay {
      case .preOrder:
        preOrderTraverseIn(from: self.root)
        complete(Result.success(.preOrder))
        break
      case .inOrder:
        inOrderTraverseIn(from: self.root)
        complete(Result.success(.inOrder))
        break
      case .postOrder:
        postOrderTraverseIn(from: self.root)
        complete(Result.success(.postOrder))
        break
      }
    } else {
      complete(Result.failure(BSTError.traverseFailure(errorReason: "you select not defined traverse way.")))
    }
  }
  
  private func preOrderTraverseIn(from rootNode: BSTNode?) -> Void {
    guard rootNode != nil else { return }
    // VLR
    print("V : \(rootNode!.value)")
    preOrderTraverseIn(from: rootNode!.left)
    preOrderTraverseIn(from: rootNode!.right)
  }
  
  private func inOrderTraverseIn(from rootNode: BSTNode?) -> Void {
    guard rootNode != nil else { return }
    // LVR
    inOrderTraverseIn(from: rootNode!.left)
    print("V : \(rootNode!.value)")
    inOrderTraverseIn(from: rootNode!.right)
  }
  
  private func postOrderTraverseIn(from rootNode: BSTNode?) -> Void {
    guard rootNode != nil else { return }
    // LRV
    postOrderTraverseIn(from: rootNode!.left)
    postOrderTraverseIn(from: rootNode!.right)
    print("V : \(rootNode!.value)")
  }
}

print("** tree construction **")
let bst = BinarySearchTree(rootNodeValue: 5)
print(bst.insert(value: 4))
print(bst.insert(value: 1))
print(bst.insert(value: 7))
print(bst.insert(value: 3))
print(bst.insert(value: 6))
print(bst.insert(value: 2))
print(bst.insert(value: 9))
print(bst.insert(value: 8))

//           '5'
//         /    \
//       '4'    '7'
//       /      /  \
//     '1'    '6'  '9'
//       \         /
//       '3'     '8'
//       /
//     '2'


// Pre Order Traverse(VLR) : 5 -> 4 -> 1 -> 3 -> 2 -> 7 -> 6 -> 9 -> 8
// In Order Traverse(LVR) : 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8 -> 9
// Post Order Traverse(LRV) : 2 -> 3 -> 1 -> 4 -> 6 -> 8 -> 9 -> 7 -> 5

bst.traverse(.preOrder) { result in
  switch result {
  case .success(let traverseWay):
    switch traverseWay {
    case .preOrder:
      print("preOrder!")
      break
    case .inOrder:
      print("inOrder!")
      break
    case .postOrder:
      print("postOrder!")
      break
    }
    break
  case .failure(let errorReason):
    print("traverse failure : \(errorReason)")
    break
  }
}


bst.traverse(.inOrder) { result in
  switch result {
  case .success(let traverseWay):
    switch traverseWay {
    case .preOrder:
      print("preOrder!")
      break
    case .inOrder:
      print("inOrder!")
      break
    case .postOrder:
      print("postOrder!")
      break
    }
    break
  case .failure(let errorReason):
    print("traverse failure : \(errorReason)")
    break
  }
}

bst.traverse(.postOrder) { result in
  switch result {
  case .success(let traverseWay):
    switch traverseWay {
    case .preOrder:
      print("preOrder!")
      break
    case .inOrder:
      print("inOrder!")
      break
    case .postOrder:
      print("postOrder!")
      break
    }
    break
  case .failure(let errorReason):
    print("traverse failure : \(errorReason)")
    break
  }
}

bst.traverse(nil) { result in
  switch result {
  case .success(let traverseWay):
    switch traverseWay {
    case .preOrder:
      print("preOrder!")
      break
    case .inOrder:
      print("inOrder!")
      break
    case .postOrder:
      print("postOrder!")
      break
    }
    break
  case .failure(let errorReason):
    print("traverse failure : \(errorReason)")
    break
  }
}



//bst.traverse(.inOrder)
//bst.traverse(.postOrder)




/*
 print("** insert **")
 print(bst.insert(value: 10))
 print(bst.insert(value: 101))
 print(bst.insert(value: 50))
 print(bst.insert(value: 30))
 print(bst.insert(value: 204))
 
 print("** search ** ")
 print(bst.search(value: 5))
 print(bst.search(value: 10))
 print(bst.search(value: 101))
 print(bst.search(value: 50))
 print(bst.search(value: 30))
 print(bst.search(value: 10000))
 
 print("** remove ** ")
 print(bst.remove(value: 10000000))
 print(bst.remove(value: 100000))
 print(bst.remove(value: 5))
 print(bst.remove(value: 10))
 print(bst.remove(value: 30))
 print(bst.remove(value: 50))
 */

