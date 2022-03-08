import UIKit

// A Linked list is a simly a node with a pointer to next
class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// We can print them out by walking the list
func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    guard var node = head else { return }
    print(node.data)
    
    while node.next != nil {
        print(node.next!.data)
        node = node.next!
    }
}

printLinkedListSimple(node1)
