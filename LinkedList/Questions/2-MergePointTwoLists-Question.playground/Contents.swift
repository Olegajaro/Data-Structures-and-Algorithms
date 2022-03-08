import UIKit

/*
 Find merge point of two lists
 
    Given pointers to the head nodes of 2 linked lists that merge together
 at some point, fint the node where the two lists merge. The merge point
 is where both lists point to the same node, i.e. they reference the same
 memory location. It is guaranteed that the two head nodes will be different,
 and neither will be NULL. If the lists share a common node, return that node's
 data value.
 
 Note: After the merge point, both lists will share the same node pointers.
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    guard head != nil else { return 0 }
    
    var length = 0
    var node = head
    
    while node != nil {
        length += 1
        node = node?.next
    }
    
    return length
}

func printLinkedList(_ head: Node?) {
    guard head != nil else { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

// Brute Solution O(n^2)
func findMerge(headA: Node?, headB: Node?) -> Int? { // O(m*n) -> O(n^2)
    let lengthA = length(headA) // O(m)
    let lengthB = length(headB) // O(n)
    
    var currentA = headA
    
    for _ in 0..<lengthA { // O(m)
        var currentB = headB
        
        for _ in 0..<lengthB { // O(n)
            let A = currentA?.data
            let B = currentB?.data
            print("A: \(A ?? 0) B: \(B ?? 0)")
            
            if A == B {
                return currentA?.data
            }
            
            currentB = currentB?.next
        }
        
        currentA = currentA?.next
    }
    
    return nil
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 12 13 4 5 6
let node13 = Node(13, node4)
let node12 = Node(12, node13)
let node11 = Node(11, node12)
let node10 = Node(10, node11)

printLinkedList(node1)
printLinkedList(node10)

findMerge(headA: node1, headB: node10)
