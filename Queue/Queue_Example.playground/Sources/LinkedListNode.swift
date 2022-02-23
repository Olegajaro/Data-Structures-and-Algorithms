import Foundation

public class LinkedListNode<T> {
    public var value: T
    public var next: LinkedListNode?
    public weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}
