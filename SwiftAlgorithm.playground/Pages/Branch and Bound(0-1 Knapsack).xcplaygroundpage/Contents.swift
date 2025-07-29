//: [Previous](@previous)

import Foundation

struct Queue<Element> {
    private var elements: [Element?]
    private var head: Int // 큐의 시작을 가리키는 인덱스
    private var tail: Int // 큐의 끝을 가리키는 인덱스 (다음 요소가 추가될 위치)
    private let initialCapacity: Int // 초기 용량 설정
    
    init(capacity: Int = 10) {
        self.initialCapacity = max(1, capacity)
        self.elements = Array(repeating: nil, count: initialCapacity)
        self.head = 0
        self.tail = 0
    }
    
    
    var isEmpty: Bool {
        return head == tail
    }
    
    var count: Int {
        return tail - head
    }
    
    var capacity: Int {
        return elements.count
    }
    
    var peek: Element? {
        guard !isEmpty else { return nil }
        return elements[head]
    }
    
    mutating func enqueue(_ element: Element) {
        if tail == elements.count {
            if count * 2 < elements.count {
                reorganize()
            } else {
                let newCapacity = elements.count * 2
                elements.reserveCapacity(newCapacity)
                elements.append(contentsOf: Array(repeating: nil, count: newCapacity - elements.count))
            }
        }
        
        elements[tail] = element
        tail += 1
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        
        let element = elements[head]
        elements[head] = nil // 메모리 해제를 위해 nil로 설정 (옵셔널 배열이므로 가능)
        head += 1
        
        if head > initialCapacity && count * 2 < elements.count {
            reorganize()
        }
        
        return element
    }
    
    mutating func clear() {
        elements = Array(repeating: nil, count: initialCapacity)
        head = 0
        tail = 0
    }
    private mutating func reorganize() {
        guard !isEmpty else {
            // 큐가 비어있다면 초기 상태로 재설정
            elements = Array(repeating: nil, count: initialCapacity)
            head = 0
            tail = 0
            return
        }
        
        let currentElements = elements[head..<tail].compactMap { $0 }
        
        let newCapacity = max(currentElements.count, initialCapacity)
        
        elements = Array(repeating: nil, count: newCapacity)
        for (index, element) in currentElements.enumerated() {
            elements[index] = element
        }
        
        head = 0
        tail = currentElements.count
    }
}

struct Item {
    let profit: Int
    let weight: Int
    let profitOfUnitWeight: Int
    
    init(profit: Int, weight: Int) {
        self.profit = profit
        self.weight = weight
        profitOfUnitWeight = profit / weight
    }
}

struct State {
    let profit: Int
    let weight: Int
    let level: Int
}

func knapsack(n: Int, profits: [Int], weights: [Int], maxBagWeight: Int) -> Int {
    var items: [Item] = []
    var queue = Queue<State>()
    var result = 0
        
    for (profit, weight) in zip(profits, weights) {
        items.append(Item(profit: profit, weight: weight))
    }
    items = items.sorted(by: { $0.profitOfUnitWeight > $1.profitOfUnitWeight })
    
    queue.enqueue(State(profit: 0, weight: 0, level: -1))
    
    // BFS
    while !queue.isEmpty {
        let state = queue.dequeue()!
        if state.weight >= maxBagWeight { continue }
        
        result = max(result, state.profit)
        
        if state.level + 1 == n { continue }
        
        // bound 계산
        let bound = getBound(state: state)
        
        print("curentProfit: \(state.profit), currentWeight: \(state.weight), bound: \(bound)")
        if bound > result {
            let nextItem = items[state.level + 1]
            queue.enqueue(State(profit: state.profit + nextItem.profit, weight: state.weight + nextItem.weight, level: state.level + 1))
            queue.enqueue(State(profit: state.profit, weight: state.weight, level: state.level + 1))
        }
    }

    return result
    
    func getBound(state: State) -> Int {
        var nextItemIndex = state.level + 1
        var remainWeight = maxBagWeight - state.weight
        var bound = state.profit
        
        while remainWeight > 0 && nextItemIndex < n {
            let nextItem = items[nextItemIndex]
            if remainWeight >= nextItem.weight {
                bound += nextItem.profit
                remainWeight -= nextItem.weight
                nextItemIndex += 1
            } else {
                bound += (remainWeight * nextItem.profitOfUnitWeight)
                remainWeight = 0
            }
        }
        
        return bound
    }
}

print(knapsack(n: 4, profits: [40, 30, 50, 10], weights: [2, 5, 10, 5], maxBagWeight: 16))


/*
curentProfit: 0, currentWeight: 0, bound: 115
curentProfit: 40, currentWeight: 2, bound: 115
curentProfit: 0, currentWeight: 0, bound: 82
curentProfit: 70, currentWeight: 7, bound: 115
curentProfit: 40, currentWeight: 2, bound: 98
curentProfit: 30, currentWeight: 5, bound: 82
curentProfit: 0, currentWeight: 0, bound: 60
curentProfit: 70, currentWeight: 7, bound: 80
curentProfit: 90, currentWeight: 12, bound: 98
curentProfit: 40, currentWeight: 2, bound: 50
curentProfit: 80, currentWeight: 15, bound: 82
curentProfit: 30, currentWeight: 5, bound: 40
90
*/

//: [Next](@next)
