import UIKit
import Foundation
import Darwin

public protocol Queue {
    associatedtype Element
    
    // вставить элемент в конец очереди
    mutating func enqueue(_ element: Element) -> Bool
    
    // удалить элемент в начале очереди и вернуть его
    mutating func dequeue() -> Element?
    
    // проверка пуста ли очередь
    var isEmpty: Bool { get }
    // возвращает элемент в начале очереди (не удаляя его)
    var peek: Element? { get }
}

// MARK: - Использование массива для создания очереди
public struct QueueArray<T>: Queue {
    // связанный тип Element определяется параметром типа Т
    public typealias Element = T
    
    private var array: [T] = []
    
    // При помощи возможностей массива получаем следующее
    
    // 1
    // Проверка пуста ли очередь
    public var isEmpty: Bool {
        return array.isEmpty
    }
    // 2
    // Возвращает элемент в начале очереди
    public var peek: T? {
        return array.first
    }
    
    public init() { }
    
    // добавление в конец очереди
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    // если очередь пуста возвращает nil
    // иначе удаляет первый элемент из очереди и возвращает его
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}

// MARK: - Test QueueArray
var queue = QueueArray<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue.dequeue()
queue
queue.peek

/*
                  Array-Based Queue
 
 Operations       |   Best case    |  Worst case
 -----------------|----------------|-------------
 enqueue(_:)      |      O(1)      |     O(1)
 ------------------------------------------------
 dequeue(_:)      |      O(n)      |     O(n)
 ------------------------------------------------
 Space Complexity |      O(n)      |     O(n)
 */

// MARK: - Использование двусвязного списка для создания очереди
public class QueueLinkedList<T>: Queue {
    public typealias Element = T
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public var peek: T? {
        list.first?.value
    }
    
    private var list = DoublyLinkedList<T>()
    
    public init() { }
    
    public func enqueue(_ element: T) -> Bool {
        list.append(value: element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty,  let element = list.first else {
            return nil
        }
        
        return list.remove(element)
    }
}

var queueLinked = QueueLinkedList<String>()
queueLinked.enqueue("Ray")
queueLinked.enqueue("Brian")
queueLinked.enqueue("Eric")
queueLinked.dequeue()
queueLinked
queueLinked.peek

/*
                Linked-List Based Queue
 
 Operations       |   Best case    |  Worst case
 -----------------|----------------|-------------
 enqueue(_:)      |      O(1)      |     O(1)
 ------------------------------------------------
 dequeue(_:)      |      O(1)      |     O(1)
 ------------------------------------------------
 Space Complexity |      O(n)      |     O(n)
 */
