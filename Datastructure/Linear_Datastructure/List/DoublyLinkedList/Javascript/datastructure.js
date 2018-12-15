// implement doubly linked list
function Node(data, next, prev) {
    this.data = data
    this.next = next
    this.prev = prev
}

function DoublyLinkedList(node) {
    this.head = node
    this.size = 1
}

// "instance" method added to the prototype
DoublyLinkedList.prototype.appendAtEnd = function (node) {
    if (this.head != null) {
        let lastNode = this.fetchAtLast()
        lastNode.next = node
        node.prev = lastNode    
    } else {
        this.head = node
    }

    this.size+=1
};

DoublyLinkedList.prototype.fetchAt = function (index) {
    if (!this.assertion(index)) { return null }

    if (index == 0) {
        return this.head
    }
    
    let iterateCount = 0
    let runNode = this.head
    while (runNode.next != null) {
        runNode = runNode.next
        iterateCount+=1;

        if (iterateCount == index) {
            return  runNode
        }
    }
    return runNode
};

DoublyLinkedList.prototype.search = function (data) {
    if (!this.headCheck()) { return null }

};

DoublyLinkedList.prototype.updateAt = function (index, updateData) {
    if (!this.assertion(index)) { return null }

    this.fetchAt(index).data = updateData
};

DoublyLinkedList.prototype.nullifyNode = function (targetNode) {
    targetNode = null
};

DoublyLinkedList.prototype.initialize = function (targetNode) {
    this.head.next = null
    this.head.prev = null
    this.head = null
    
    this.size = 0
};

DoublyLinkedList.prototype.removeAt = function (index) {
    if (!this.headCheck()) { return false }
    if (this.size < 0) { return false }

    let targetNode = this.fetchAt(index)
    if (targetNode == null) {
        return false
    }
    if (this.head === targetNode) {
        /// when in operations for head node, 

        // when head exists only
        if (this.size == 1) {
            this.initialize()
        } else {
            this.head = this.head.next
            this.head.prev = null
        } 
    } else if (targetNode === this.fetchAtLast()) {
        /// when in operations for last node, 
        let prevNode = targetNode.prev
        prevNode.next = null
    } else {
        /// when in the middle of operations, 
        let prevNode = targetNode.prev
        let nextNode = targetNode.next
    
        prevNode.next = nextNode
        nextNode.prev = prevNode
    }

    this.size-=1
    this.nullifyNode(targetNode)

    return true
};

DoublyLinkedList.prototype.fetchAtLast = function () {
    let runNode = this.head 
    while (runNode.next != null) {
        runNode = runNode.next
    }
    return runNode
};

DoublyLinkedList.prototype.traverseForward = function () {
    if (!this.headCheck()) {
        return false
    }

    console.log("***** traverse start from beginning ******")
    let runNode = this.head
    while (runNode.next != null) {
        console.log("Running runNode : ", runNode.data)
        runNode = runNode.next
    }
    
    console.log("Running runNode : ", runNode.data)
    console.log("***** end of traverse  ******")

    return true
};

DoublyLinkedList.prototype.traverseInReverse = function (index) {
    if (!this.headCheck()) {
        return false
    }
    
    console.log("***** traverse start from beginning ******")
    let runNode = this.fetchAtLast()
    while (runNode.prev != null) {
        console.log("Running runNode toward the head : ", runNode.data)
        runNode = runNode.prev
    }
    console.log("Running runNode toward the head : ", runNode.data)
    console.log("***** end of traverse  ******")

    return true
};

DoublyLinkedList.prototype.headCheck = function () {
    if (!this.head) {
        console.log("head does not exist! :(")
        return false
    } 
    return true
};

DoublyLinkedList.prototype.boundCheck = function (indexToOperate) {
    // console.log("this.size : ", this.size)
    // console.log("indexToOperate : ", indexToOperate)
    if (this.size - 1  >= indexToOperate) {
        return true
    } else {
        return false
    }
};

DoublyLinkedList.prototype.assertion = function (index) {
    if (!this.headCheck()) {
        return false
    }
    
    if (!this.boundCheck(index)) {
        console.log("bound overflow!")
        return false
    } 

    return true
};

const head = new Node(0,null,null)
var doublyList = new DoublyLinkedList( head );
doublyList.appendAtEnd(new Node(1,null,null)) 
doublyList.appendAtEnd(new Node(2,null,null)) 
doublyList.appendAtEnd(new Node(3,null,null)) 
doublyList.appendAtEnd(new Node(4,null,null)) 

if (!doublyList.traverseForward())  {
    console.log("traverseForward failed!")
}
if (!doublyList.traverseInReverse())  {
    console.log("traverseInReverse failed!")
}

// console.log("****")
// let fetchedNode = doublyList.fetchAt(1)
// console.log(fetchedNode.data)

// fetchedNode = doublyList.fetchAt(0)
// console.log(fetchedNode.data)

// fetchedNode = doublyList.fetchAt(2)
// console.log(fetchedNode.data)

// fetchedNode = doublyList.fetchAt(3)
// console.log(fetchedNode.data)

// fetchedNode = doublyList.fetchAt(4)
// console.log(fetchedNode.data)

// fetchedNode = doublyList.fetchAt(5)
// if (fetchedNode != null) {
//     console.log(fetchedNode.data)
// } else {
//     console.log("fetch failed.")
// }

// fetchedNode = doublyList.fetchAt(3)
// console.log(fetchedNode.data)

// doublyList.updateAt(3,300)
// fetchedNode = doublyList.fetchAt(3)
// console.log(fetchedNode.data)

console.log("remove test....")
if (!doublyList.removeAt(2)) {
    console.log("remove failed!")
}
if (!doublyList.removeAt(0)) {
    console.log("remove failed!")
}
if (!doublyList.removeAt(0)) {
    console.log("remove failed!")
}
// if (!doublyList.removeAt(0)) {
//     console.log("remove failed!")
// }

// if (!doublyList.removeAt(0)) {
//     console.log("remove failed!")
// }
// doublyList.removeAt(3)
// doublyList.removeAt(4)

if (!doublyList.traverseForward())  {
    console.log("traverseForward failed!")
}

if (!doublyList.traverseInReverse())  {
    console.log("traverseInReverse failed!")
}
// doublyList.





// prototype based 
// constructor
// var Car = function () {};

// // a static method
// Car.isShiny = function () {
//     return "bling bling";
// };

// // "instance" method added to the prototype
// Car.prototype.setPrice = function (price) {
//     this.price = price;
// };


// // Way of Javascript Inheritance
// function Person( name, age ) {
//     this.name = name;
//     this.age = age;
// }

// function Student( name, age, grade ) {
//     Person.call( this, name, age ); // call super-class with sub-class properties
//     this.grade = grade;
// }

// Student.prototype = new Person();
// Student.prototype.constructor = Student;
// var roger = new Student( 'Roger', 18, 'A+' );



// class-based from ES6
