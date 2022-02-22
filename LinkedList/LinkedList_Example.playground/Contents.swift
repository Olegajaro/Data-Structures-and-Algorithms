import UIKit
import Foundation
import Darwin

// MARK: - создание и связывание узлов
func example() {
    print("--creating and linking nodes--")
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    
    print("\(node1)\n")
}

example()

// MARK: - добавление элементов в начало связанного списка
func push() {
    print("--Example of push--")
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("\(list)\n")
}

push()

// MARK: - добавление элементов в конец связанного списка
func append() {
    print("--Example of append--")
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("\(list)\n")
}

append()

// MARK: - добавление элемента в определенное место
func insert() {
    print("--Inserting at a particular index--")
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("--Before inserting: \(list)")
    var middleNode = list.node(at: 1)!
    
    for _ in 1...4 {
        middleNode = list.insert(-1, after: middleNode)
    }
    print("After inserting: \(list)\n")
}

insert()

// MARK: - удаление элемента в начале списка
func pop() {
    print("--Example of pop--")
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Before popping list: \(list)")
    let poppedValue = list.pop()
    
    print("After popping list: \(list)")
    print("Popped value: " + String(describing: poppedValue) + "\n")
}

pop()

// MARK: - удаление элемента в конце списка
func removeLast() {
    print("--Example of removing the last node--")
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Before removing last node: \(list)")
    let removedValue = list.removeLast()
    
    print("After removing last node: \(list)")
    print("Removed value: " + String(describing: removedValue) + "\n")
}

removeLast()

// MARK: - удаление элемента из определенного места в списке
func removeAt() {
    print("--Example of removing a node after a particular node--")
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Before removing at particular index: \(list)")
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    
    print("After removing at index \(index): \(list)")
    print("Removed value: " + String(describing: removedValue) + "\n")
}

removeAt()
