//: [Previous](@previous)

import Foundation

struct Edge {
    let from: Int
    let to: Int
    let weight: Int
}

func bellmanFord(_ vertexCount: Int, _ edges: [Edge], start: Int) -> ([Int], Bool) {
    var distance = Array(repeating: Int.max, count: vertexCount+1)
    distance[start] = 0
    
    for _ in 0..<vertexCount-1 {
        for edge in edges {
            if distance[edge.from] != Int.max && distance[edge.from] + edge.weight < distance[edge.to] {
                distance[edge.to] = distance[edge.from] + edge.weight
            }
        }
    }
    
    for edge in edges {
        if distance[edge.from] != Int.max && distance[edge.from] + edge.weight < distance[edge.to] {
            print("음수 사이클 발견됨")
            return (distance, true)
        }
    }
    
    return (distance, false)
}

// 간선 목록
let edges: [Edge] = [
    Edge(from: 1, to: 2, weight: 1), // A
    Edge(from: 1, to: 3, weight: 1), // B
    Edge(from: 2, to: 4, weight: 3), // C
    Edge(from: 2, to: 3, weight: 2), // D
    Edge(from: 4, to: 3, weight: 4), // E
    Edge(from: 3, to: 4, weight: 2)  // F
]

print(bellmanFord(4, edges, start: 1))

// ([9223372036854775807, 0, 1, 1, 3], false)

let edges2: [Edge] = [
    Edge(from: 1, to: 2, weight: 5),
    Edge(from: 2, to: 3, weight: 5),
    Edge(from: 3, to: 2, weight: -10),
    Edge(from: 3, to: 4, weight: 5),
]

print(bellmanFord(4, edges2, start: 1))

// 음수 사이클 발견됨
// ([9223372036854775807, 0, -10, 0, 5], true)


//: [Next](@next)
