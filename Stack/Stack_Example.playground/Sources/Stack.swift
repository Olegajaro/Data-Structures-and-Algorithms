import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public var isEmpty: Bool {
        return peek() == nil
    }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    // добавление элемента на верх стэка
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    // удаление верхнего элемента из стэка
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    // просмотр верхнего элемента стэка
    public func peek() -> Element? {
        return storage.last
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        
        let stackElements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

extension Stack: ExpressibleByArrayLiteral {
    // Расширение позволяет сделать стэк инициализируемым из литерала массива
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
