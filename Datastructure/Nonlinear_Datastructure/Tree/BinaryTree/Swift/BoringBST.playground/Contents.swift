import Foundation

// MARK: - So the most boring BST for fun -
class BinarySearchTree <T> where T: Comparable {
  // MARK: - Internal Declarations -
  class Node <T> {
    var data: T!
    fileprivate var left: Node<T>?
    fileprivate var right: Node<T>?
    fileprivate var parent: Node<T>?
    
    init(data: T, left: Node<T>?, right: Node<T>?, parent: Node<T>?) {
      self.data = data
      self.left = left
      self.right = right
      self.parent = parent
    }
  }
  
  private enum CompareResult {
    case less
    case equal
    case more
  }
  
  enum ChildNodeStatus {
    case empty
    case left
    case right
    case both
  }
  
  enum ParentBranchDirection {
    case left
    case right
  }
  
  
  enum TraverseStyle {
    case preOrder
    case inOrder
    case postOrder
  }
  
  enum BSTError: Error {
    case branchDirectionAssertion // branch must exist either way in 'the case' we ask which direction
  }
  
  // MARK: - Instance Variables -
  private var root: Node<T>!
  private var _traverseNodeList: [Node<T>] = []
  public var traverseNodeList: [Node<T>] {
    get {
      return _traverseNodeList
    }
    set {
      _traverseNodeList = newValue
    }
  }
  
  // MARK: - Initializers -
  init(rootData: T) {
    self.root = Node<T>(data: rootData, left: nil, right: nil, parent: nil)
  }
  
  // MARK: - Public Methods -
  public func insert(_ data: T) -> Bool {
    let resultTuple = traverseUntilEnd(data: data, currentNode: self.root)
    
    let isNotExist = resultTuple.0
    if isNotExist {
      guard let terminalNode = resultTuple.1 else { return false }
      return insertIn(data, inputNode: terminalNode) ? true : false
    } else {
      // same data exist.
      return false
    }
  }
  
  public func delete(_ data: T, from: Node<T>? = nil) -> Bool {
    if let foundNode = get(data) {
      guard let parent = foundNode.parent, foundNode !== self.root else {
        return false
      }
      
      switch evaluateChildNodeStatus(inputNode: foundNode) {
      case .both:
        if let leastNodeOnRightBranch = subTraverse(currentNode: foundNode.right)
          .sorted(by: { (f1, f2) -> Bool in f1.data < f2.data }).first {
          foundNode.data = leastNodeOnRightBranch.data
          
          switch evaluateChildNodeStatus(inputNode: leastNodeOnRightBranch) {
          case .both:
          break // it should not come.
          case .empty:
            if deleteLinkFrom(parentNode: leastNodeOnRightBranch.parent!,
                              compareNode: leastNodeOnRightBranch) {
              return true
            } else {
              return false
            }
          case .left:
            switch try! whichBranchFrom(parentNode: leastNodeOnRightBranch.parent!,
                                        compareNode: leastNodeOnRightBranch) {
            case .left:
              leastNodeOnRightBranch.parent!.left = leastNodeOnRightBranch.left
            case .right:
              leastNodeOnRightBranch.parent!.right = leastNodeOnRightBranch.left
            }
          case .right:
            switch try! whichBranchFrom(parentNode: leastNodeOnRightBranch.parent!,
                                        compareNode: leastNodeOnRightBranch) {
            case .left:
              leastNodeOnRightBranch.parent!.left = leastNodeOnRightBranch.right
            case .right:
              leastNodeOnRightBranch.parent!.right = leastNodeOnRightBranch.right
            }
          }
        }
      case .empty:
        if deleteLinkFrom(parentNode: parent, compareNode: foundNode) {
          return true
        } else {
          return false
        }
      case .left:
        switch try! whichBranchFrom(parentNode: parent, compareNode: foundNode) {
        case .left:
          parent.left = foundNode.left
        case .right:
          parent.right = foundNode.left
        }
        
      case .right:
        switch try! whichBranchFrom(parentNode: parent, compareNode: foundNode) {
        case .left:
          parent.left = foundNode.right
        case .right:
          parent.right = foundNode.right
        }
      }
    } else {
      return false
    }
    
    return true
  }
  
  public func get(_ data: T) -> Node<T>? {
    let resultTuple = traverseUntilEnd(data: data, currentNode: self.root)
    
    let isNotExist = resultTuple.0
    if !isNotExist {
      guard let foundNode = resultTuple.1 else { return nil }
      return foundNode
    } else {
      return nil
    }
  }
  
  public func traverse(style traverseStyle: TraverseStyle) -> [Node<T>] {
    self.traverseNodeList = []
    
    return traverseIn(style: traverseStyle, currentNode: self.root)
  }
  
  // MARK: - Private Methods -
  private func deleteLinkFrom(parentNode: Node<T>, compareNode: Node<T>) -> Bool {
    if parentNode.left === compareNode {
      parentNode.left = nil
      return true
    } else if parentNode.right === compareNode {
      parentNode.right = nil
      return true
    } else {
      return false
    }
  }
  
  private func whichBranchFrom(parentNode: Node<T>, compareNode: Node<T>) throws -> ParentBranchDirection {
    if parentNode.left === compareNode {
      return .left
    } else if parentNode.right === compareNode {
      return .right
    }
    
    throw BSTError.branchDirectionAssertion
  }
  
  private func evaluateIfTerminalNode(inputNode: Node<T>) -> Bool {
    if inputNode.left == nil && inputNode.right == nil {
      return true
    } else {
      return false
    }
  }
  
  private func evaluateChildNodeStatus(inputNode: Node<T>) -> ChildNodeStatus {
    if evaluateIfTerminalNode(inputNode: inputNode) {
      return .empty
    } else {
      if inputNode.left == nil && inputNode.right != nil {
        return .right
      } else if inputNode.left != nil && inputNode.right == nil {
        return .left
      } else {
        return .both
      }
    }
  }
  
  private func traverseIn(style traverseStyle: TraverseStyle, currentNode: Node<T>? = nil) -> [Node<T>] {
    switch traverseStyle {
    case .preOrder:
      // VLR
      if let currentNode = currentNode {
        self.traverseNodeList.append(currentNode)
        _ = self.traverseIn(style: traverseStyle, currentNode: currentNode.left)
        _ = self.traverseIn(style: traverseStyle, currentNode: currentNode.right)
      }
    case .inOrder:
      // LVR
      if let currentNode = currentNode {
        _ = self.traverseIn(style: traverseStyle, currentNode: currentNode.left)
        self.traverseNodeList.append(currentNode)
        _ = self.traverseIn(style: traverseStyle, currentNode: currentNode.right)
      }
    case .postOrder:
      // LRV
      if let currentNode = currentNode {
        _ = self.traverseIn(style: traverseStyle, currentNode: currentNode.left)
        _ = self.traverseIn(style: traverseStyle, currentNode: currentNode.right)
        self.traverseNodeList.append(currentNode)
      }
    }
    
    return self.traverseNodeList
  }
  
  private func subTraverse(currentNode: Node<T>? = nil) -> [Node<T>] {
    self.traverseNodeList = []
    return subTraverseIn(currentNode: currentNode)
  }
  
  private func subTraverseIn(currentNode: Node<T>? = nil) -> [Node<T>] {
    if let currentNode = currentNode {
      self.traverseNodeList.append(currentNode)
      _ = self.subTraverseIn(currentNode: currentNode.left)
      _ = self.subTraverseIn(currentNode: currentNode.right)
    }
    
    return self.traverseNodeList
  }
  
  private func insertIn(_ inputData: T, inputNode: Node<T>) -> Bool {
    switch compare(f1: inputNode.data, f2: inputData) {
    case .equal:
      return false
    case .less:
      inputNode.right = Node<T>(data: inputData, left: nil, right: nil, parent: inputNode)
      return true
    case .more:
      inputNode.left = Node<T>(data: inputData, left: nil, right: nil, parent: inputNode)
      return true
    }
  }
  
  private func compare(f1: T, f2: T) -> CompareResult {
    if f1 == f2 {
      return .equal
    } else if f1 > f2 {
      return .more
    } else {
      return .less
    }
  }
  
  private func traverseUntilEnd(data: T, currentNode: Node<T>) -> (Bool, Node<T>?) {
    switch compare(f1: currentNode.data, f2: data) {
    case .equal:
      return (false, currentNode)
    case .less:
      if let rightNode = currentNode.right {
        return traverseUntilEnd(data: data, currentNode: rightNode)
      } else {
        return (true, currentNode)
      }
    case .more:
      if let leftNode = currentNode.left {
        return traverseUntilEnd(data: data, currentNode: leftNode)
      } else {
        return (true, currentNode)
      }
    }
  }
  
  // MARK: - Unimplemented -
  public func modify(_ data: T) -> Bool {
    fatalError("[balancing branch required] modify not yet implemented")
  }
}

let BST = BinarySearchTree<Int>(rootData: 0)
if !BST.insert(1) {
  print("insert fail!")
}

if !BST.insert(3) {
  print("insert fail!")
}

if !BST.insert(2) {
  print("insert fail!")
}

if !BST.insert(4) {
  print("insert fail!")
}

if !BST.insert(-1) {
  print("insert fail!")
}

if !BST.insert(-2) {
  print("insert fail!")
}

if !BST.insert(-15) {
  print("insert fail!")
}

if !BST.insert(20) {
  print("insert fail!")
}

if !BST.insert(15) {
  print("insert fail!")
}

if !BST.insert(22) {
  print("insert fail!")
}

if !BST.insert(21) {
  print("insert fail!")
}

//let preOrderTraverseList = BST.traverse(style: .preOrder)
//preOrderTraverseList.forEach { print($0.data!) }
//print("///")
//
//let inOrderTraverseList = BST.traverse(style: .inOrder)
//inOrderTraverseList.forEach { print($0.data!) }
//
//print("///")
//let postOrderTraverseList = BST.traverse(style: .postOrder)
//postOrderTraverseList.forEach { print($0.data!) }
//
//if let foundNode = BST.get(-1) {
//  print("found? : ", foundNode.data!)
//} else {
//  print("retrieve failure.")
//}
//
//if let foundNode = BST.get(0) {
//  print("found? : ", foundNode.data!)
//} else {
//  print("retrieve failure.")
//}
//
//if let foundNode = BST.get(2) {
//  print("found? : ", foundNode.data!)
//} else {
//  print("retrieve failure.")
//}
//
//if let foundNode = BST.get(50) {
//  print("found? : ", foundNode.data!)
//} else {
//  print("retrieve failure.")
//}

BST.traverse(style: .preOrder).forEach { print($0.data!) }

//if BST.delete(-15) {
//  print("[success]delete -1!")
//}
//
//if BST.delete(-1) {
//  print("[success]delete -1!")
//}
//
//if BST.delete(1) {
//  print("[success]delete -1!")
//}
//
//if BST.delete(2) {
//  print("[success]delete -1!")
//}
//
//if BST.delete(4) {
//  print("[success]delete -1!")
//}

//if BST.delete(3) {
//  print("[success]delete 3!")
//}
//
//if BST.delete(4) {
//  print("[success]delete 4!")
//}

if BST.delete(20) {
  print("[success]delete 20!")
}

if BST.delete(21) {
  print("[success]delete 21!")
}

if BST.delete(1) {
  print("[success]delete 1!")
}

print(" !!! ")

BST.traverse(style: .preOrder).forEach { print($0.data!) }
