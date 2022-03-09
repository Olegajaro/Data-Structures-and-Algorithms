import Foundation

public class DoublyLinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else { return nil }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    public init() { }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public subscript(index: Int) -> T {
        let node = node(atIndex: index)
        return node.value
    }
    
    public func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            
            for _ in 1..<index {
                node = node?.next
                
                if node == nil {
                    break
                }
            }
            
            return node!
        }
    }
    
    public func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(atIndex: index - 1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = prev.next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    public func removeAll() {
        head = nil
    }
    
    public func remove(_ node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

// For playground
//let list = DoublyLinkedList<String>()
//list.isEmpty
//list.first
//list.append(value: "Hello")
//list.isEmpty
//list.first!.value
//list.last!.value
//
//list.append(value: "World")
//list.first!.value
//list.last!.value
//
//list.first!.previous
//list.first!.next!.value
//list.last!.previous!.value
//list.last!.next
//
//list.count
//
//list.node(atIndex: 0).value
//list.node(atIndex: 1).value
////list.node(atIndex: 2) error
//
//list[0]
//list[1]
////list[2] // error
//
//
//list.insert(LinkedListNode(value: "Swift"), atIndex: 1)
//list[0]
//list[1]
//list[2]
