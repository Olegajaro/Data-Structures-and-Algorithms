import UIKit

/*
 Detect a cycle
 
    A linked list is said to contain a cycle if any node is visited more than
 once while traversing the list. For example, in the following graph there is
 a cycle formed when node 5 points back to node 3.
        4
      /   \
 1 2 3     5
      \___/
 */

class Node {
    var data: Int
    weak var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

//func length(head: Node?) -> Int? {
//
//    guard head != nil else { return 0 }
//
//    var length = 0
//    var node = head
//
//    while node != nil {
//        length += 1
//        node = node?.next
//    }
//
//    return length
//}

func hasCycle(first: Node) -> Bool {
    var slow: Node? = first
    var fast: Node? = first
    
    while fast != nil && fast!.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow?.data == fast?.data {
            return true
        }
    }
    
    return false
}

let node5 = Node(5)
let node4 = Node(4)
let node3 = Node(3)
let node2 = Node(2)
let head = Node(1)

head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node3

hasCycle(first: head)
