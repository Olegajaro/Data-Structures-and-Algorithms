import Foundation

public struct LinkedList<Value> {
    
    // голова связанного списка
    public var head: Node<Value>?
    // конец связанного списка
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }

    // MARK: - Добавление элемента в начало списка
    public mutating func push(_ value: Value) {
        
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    // MARK: - Добавление элемента в конец списка
    public mutating func append(_ value: Value) {
        
        // 1
        // если список пуст, обновляем как начало так и конец нового узла
        // добавление к пустому списку идентично push
        guard !isEmpty else {
            push(value)
            return
        }
        
        // 2
        // создание нового узла после хвостового узла
        tail!.next = Node(value: value)
        
        // 3
        // новый узел также является концом списка
        tail = tail!.next
    }
    
    // MARK: - Добавление элемента в определенное место
    // Состоит из 2 шагов
    
    // нахождение конкретного узла в списке
    public func node(at index: Int) -> Node<Value>? {
        // 1
        // создание новой ссылки на голову
        // отслеживание текущего количество обходов
        var currentNode = head
        var currentIndex = 0
        
        // 2
        // перемещаем ссылку вниз по списку, пока не достигнем нужного индекса
        // пустые списки или за пределами индекса приведут к значению nil
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // вставка нового узла
    // 1
    /*
     @discardableResult позволяет вызывающим объектам игнорировать
     возвращаемое значение этого метода, при этом компилятор
     не будет прыгать вверх и вниз, предупреждая вас об этом.
     */
//    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
        // 2
        // случай, когда этот метод вызывается с хвостовым узлом
        // происходит эквивалентный метод добавления в конец
        guard tail !== node else {
            append(value)
            return tail!
        }
        // 3
        // связывание нового узла с остальными элементами списка
        node.next = Node(value: value, next: node.next)
        
        // возвращаем новый узел
        return node.next!
    }
    
    // MARK: - Удаление элемента в начале списка
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    // MARK: - Удаление элемента в конце списка
    @discardableResult
    public mutating func removeLast() -> Value? {
        // 1
        // голова равнил nil, так что возвращется nil
        guard let head = head else {
            return nil
        }
        // 2
        // если список состоит только из одного узла
        // удалить последний элемент эквиваленто удалить первый элемент
        // метод pop() обрабатывает обновление ссылок на начало и конец
        guard head.next != nil else {
            return pop()
        }
        // 3
        // поиск следующего индекса, пока значение current.next не станет равно 0
        // это означает, что текущий узел является последним узлом списка
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        // 4
        // посколько текущий узел является последним
        // мы просто отключаем его, используя предыдущую и следующую ссылку
        // обновляем хвостовую ссылку
        prev.next = nil
        tail = prev
        return current.value
    }
    
    // MARK: - Удаление элемента элемента из определенного места
    /*
     Отключение узлов происходит в блоке отсрочки.
     Следует соблюдать особую осторожность,
     если удаленный узел является хвостовым узлом,
     поскольку ссылку на хвост нужно будет обновить.
     */
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
}

// MARK: - CustomStringConvertible
extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        
        return String(describing: head)
    }
}
