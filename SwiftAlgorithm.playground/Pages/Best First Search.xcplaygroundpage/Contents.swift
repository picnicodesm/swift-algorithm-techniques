//: [Previous](@previous)

import Foundation

struct Heap<T: Comparable> {
    var heap: [T]
    var orderCriteria: (T, T) -> Bool
    
    init(_ heap: [T] = [], orderCriteria: @escaping (T, T) -> Bool) {
        self.heap = heap
        self.orderCriteria = orderCriteria
        
        if !heap.isEmpty {
            for i in stride(from: (heap.count / 2) - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    var isEmpty: Bool { heap.isEmpty }
    var peek: T? { heap.first }
    var count: Int { heap.count }
    
    mutating func insert(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count-1)
    }
    
    mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        
        if heap.count == 1 { return heap.removeLast() }
        else {
            let value = heap[0]
            heap[0] = heap.removeLast()
            siftDown(from: 0)
            
            return value
        }
    }
}

extension Heap {
    private func getParentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func getLeftChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func getRightChildIndex(of index: Int) -> Int {
        return index * 2 + 2
    }
    
    private mutating func siftUp(from currentIndex: Int) {
        var childIndex = currentIndex
        var parentIndex = getParentIndex(of: childIndex)
        
        while childIndex > 0 && orderCriteria(heap[childIndex], heap[parentIndex]) {
            heap.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = getParentIndex(of: childIndex)
        }
    }
    
    private mutating func siftDown(from index: Int, until endIndex: Int? = nil) {
        let limit = endIndex ?? heap.count
        var parentIndex = index
        
        while true {
            let leftChildIndex = getLeftChildIndex(of: parentIndex)
            let rightChildIndex = getRightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex
            
            if leftChildIndex < limit && orderCriteria(heap[leftChildIndex], heap[candidateIndex]) {
                candidateIndex = leftChildIndex
            }
            
            if rightChildIndex < limit && orderCriteria(heap[rightChildIndex], heap[candidateIndex]) {
                candidateIndex = rightChildIndex
            }
            
            if candidateIndex == parentIndex { return }
            
            heap.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}

struct PriorityQueue<T: Comparable> {
    private var heap: Heap<T>
    
    init() {
        heap = Heap<T>(orderCriteria: <)
    }
    
    init(sort: @escaping (T, T) -> Bool) {
        heap = Heap<T>(orderCriteria: sort)
    }
    
    var isEmpty: Bool { heap.isEmpty }
    
    var count: Int { heap.count }
    
    var peek: T? { heap.peek }
    
    mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    mutating func dequeue() -> T? {
        return heap.pop()
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

struct State: Equatable {
    let profit: Int
    let weight: Int
    let level: Int
}

struct StateNode: Comparable {
    static func < (lhs: StateNode, rhs: StateNode) -> Bool {
        return lhs.bound < rhs.bound
    }
    
    static func == (lhs: StateNode, rhs: StateNode) -> Bool {
        return lhs.state == rhs.state && lhs.bound == rhs.bound
    }
    
    let state: State
    let bound: Int
}

func knapsack(n: Int, profits: [Int], weights: [Int], maxBagWeight: Int) -> Int {
    var items: [Item] = []
    var queue = PriorityQueue<StateNode>(sort: >)
    var result = 0
        
    for (profit, weight) in zip(profits, weights) {
        items.append(Item(profit: profit, weight: weight))
    }
    items = items.sorted(by: { $0.profitOfUnitWeight > $1.profitOfUnitWeight })
    
    let initialState = State(profit: 0, weight: 0, level: -1)
    let initialBound = getBound(state: initialState)
    queue.enqueue(StateNode(state: initialState, bound: initialBound))
    
    // bfs
    while !queue.isEmpty {
        let node = queue.dequeue()!
        let state = node.state
        if state.weight > maxBagWeight { continue }
        
        print("curentProfit: \(state.profit), currentWeight: \(state.weight), bound: \(node.bound)")

        result = max(result, state.profit)
        if state.level + 1 == n { continue }
        
        let bound = node.bound
        let nextItem = items[state.level + 1]
        let stateWithItem = State(profit: state.profit + nextItem.profit, weight: state.weight + nextItem.weight, level: state.level + 1)
        let stateWithoutItem = State(profit: state.profit, weight: state.weight, level: state.level + 1)
        let boundWithItem = getBound(state: stateWithItem)
        let boundWithoutItem = getBound(state: stateWithoutItem)
        
        if boundWithItem >= result { queue.enqueue(StateNode(state: stateWithItem, bound: boundWithItem)) }
        if boundWithoutItem > result { queue.enqueue(StateNode(state: stateWithoutItem, bound: boundWithoutItem)) }
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

//: [Next](@next)
