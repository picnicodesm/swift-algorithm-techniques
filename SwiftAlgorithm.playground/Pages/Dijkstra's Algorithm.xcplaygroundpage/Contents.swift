//: [Previous](@previous)

import Foundation

struct Heap<T: Comparable> { // 최소 힙으로 구현
    enum DownDirection { case left, right, none }
    private var heap: [T] = []
    
    init(_ data: T) {
        heap.append(data)
        heap.append(data)
    }
    
    mutating func insert(_ data: T) {
        heap.append(data)
        var currentIndex = heap.count-1
        var parentIndex = currentIndex / 2
        
        while parentIndex > 0 && heap[currentIndex] < heap[parentIndex] {
            heap.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
            parentIndex = currentIndex / 2
        }
    }
    
    mutating func pop() -> T? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.removeLast() }
        
        let returnValue = heap[1]
        var currentIndex =  1
        var changeIndex = currentIndex
        
        heap[1] = heap.removeLast()
        
        func choiceDirection(_ currentIndex: Int) -> DownDirection {
            let leftChildIndex = currentIndex * 2
            let rightChildIndex = currentIndex * 2 + 1
            
            if leftChildIndex >= heap.count { return .none }
            
            if rightChildIndex >= heap.count {
                if heap[leftChildIndex] < heap[currentIndex] { return .left }
                else { return .none }
            }
            
            if heap[leftChildIndex] > heap[currentIndex] && heap[rightChildIndex] > heap[currentIndex] {
                return .none
            }
            
            if heap[leftChildIndex] < heap[currentIndex] && heap[rightChildIndex] < heap[currentIndex] {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            return heap[leftChildIndex] < heap[currentIndex] ? .left : .right
        }
        
        while true {
            switch choiceDirection(currentIndex) {
            case .left:
                changeIndex = currentIndex * 2
            case .right:
                changeIndex = currentIndex * 2 + 1
            case .none:
                return returnValue
            }
            
            heap.swapAt(changeIndex, currentIndex)
            currentIndex = changeIndex
        }
    }
    
    var isEmpty: Bool {
        if heap.count <= 1 { return true }
        else { return false }
    }
}

struct Node: Comparable {
    let name: String
    var cost: Int
    
    static func <(lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
}

func dijkstra(_ graph: [String: [String: Int]], start: String ) -> [String: Int] {
    var willVisit = Heap(Node(name: start, cost: 0))
    var result: [String: Int] = [:]
    
    for name in graph.keys {
        result[name] = Int.max
    }
    result[start]! = 0
    
    while !willVisit.isEmpty {
        guard let visit = willVisit.pop() else { return [:] }

        if result[visit.name]! < visit.cost { continue }
        
        for (nearNode, cost) in graph[visit.name]! {
            if visit.cost + cost < result[nearNode]! {
                result[nearNode]! = visit.cost + cost
                willVisit.insert(Node(name: nearNode, cost: result[nearNode]!))
            }
        }
    }
    
    return result
}

let graph = [
    "V1": ["V2": 1, "V3": 1],
    "V2": ["V3": 2, "V4": 3],
    "V3": ["V4": 2],
    "V4": ["V3": 4, "V2": 1]
]

let graph2 = [
    "V1": ["V2": 10, "V3": 5],
       "V2": ["V3": -6],
    "V3": [:]
]

let graph3 = [
    "A": ["B": 1, "C": 4],
    "B": ["C": -2],
    "C": [:]
]
//print(dijkstra(graph3, start: "A"))

print(dijkstra(graph2, start: "V1"))

//: [Next](@next)
