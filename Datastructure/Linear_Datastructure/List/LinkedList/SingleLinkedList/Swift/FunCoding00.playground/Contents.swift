import Foundation

// TCO
func recurSummarization(to: Int, sum: Int) -> Int {
  return to == 0 ? sum : recurSummarization(to: to - 1, sum: sum == 0 ? to + to - 1 : sum + to - 1)
}

let res = recurSummarization(to: 10, sum: 0)
res

class Node <T> {
  public var data: T
  public var next: Node<T>?
  
  init(data: T) {
    self.data = data
  }
}

class RecurLinkedList <T> {
  private var _head: Node<T>?
  private var head: Node<T>? {
    get {
      return _head
    }
    set {
      _head = newValue
    }
  }
  
  init(initWithHead head: Node<T>) {
    self.head = head
  }
  
  public func append(node: Node<T>) -> Void {
    if self.head != nil {
      if self.head?.next == nil {
        self.head?.next = node
      } else {
        let lastNode = runTowardLastNode(from: self.head!)
        lastNode.next = node
      }
    } else {
      self.head = node
    }
  }
  
  public func printAll(isBackward: Bool = false) -> Void {
    var runNode = self.head!
    
    while runNode.next != nil {
      print(runNode.data)
      runNode = runNode.next!
    }
    print(runNode.data)
  }
  
  public func remove(at: Int) -> Void {
    if at == 0 {
      self.head = self.head?.next
    } else {
      var runNode = self.head!
      
      var iterationIndex = 0
      
      while runNode.next != nil {
        runNode = runNode.next!
        iterationIndex+=1
        
        if at == 1 {
          self.head?.next = runNode.next
          break
        } else if at == iterationIndex + 1 {
          print("fuck runnode : ", runNode.data)
          print("fuck iterationIndex : ", iterationIndex)
          runNode.next = runNode.next?.next
          break
        }
        
      }
    }
  }
  
  public func modify(at: Int, targetNode: Node<T>) -> Void {
    var runNode = self.head!
    
    var iterationIndex = 0
    while runNode.next != nil {
      runNode = runNode.next!
      iterationIndex+=1
      
      if iterationIndex == at {
        runNode.data = targetNode.data
      }
    }
  }
  
  public func getNode(at: Int) -> Node<T>? {
    return runTowardTheNode(from: self.head, at: at)
  }
  
  private func runTowardTheNode(from head: Node<T>?, at: Int, callStackIndex: Int? = nil) -> Node<T>? {
    if at == 0 {
      return self.head
    } else {
      if let next = head?.next {
        if let callStackIndex = callStackIndex {
          if callStackIndex == at {
            return head
          } else {
            return runTowardTheNode(from: next, at: at, callStackIndex: callStackIndex+1)
          }
        } else {
          return runTowardTheNode(from: next, at: at, callStackIndex: 1)
        }
      } else {
        return head!
      }
    }
  }
  
  private func runTowardLastNode(from head: Node<T>?) -> Node<T> {
    if let next = head?.next {
      return runTowardLastNode(from: next)
    } else {
      return head!
    }
  }
}

let linkedList = RecurLinkedList<Int>(initWithHead: Node<Int>(data: 0))
linkedList.append(node: Node<Int>(data:1))
linkedList.append(node: Node<Int>(data:2))
linkedList.append(node: Node<Int>(data:3))
linkedList.append(node: Node<Int>(data:4))
linkedList.append(node: Node<Int>(data:5))

linkedList.remove(at: 0)
linkedList.remove(at: 0)
linkedList.remove(at: 0)
linkedList.printAll()

if let fetched = linkedList.getNode(at: 4) {
  print("fetched : ", fetched.data)
}
