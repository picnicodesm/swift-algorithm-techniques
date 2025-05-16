//: [Previous](@previous)

import Foundation

let graph = [
    0: [1, 2],
    1: [0, 3, 4],
    2: [0],
    3: [1],
    4: [1, 5],
    5: [4]
]

func bfs(_ graph: [Int: [Int]], _ start: Int) {
    var visited: Set<Int> = []
    var willVisit: [Int] = [start]
    var visitIndex = 0
    
    while visitIndex < willVisit.count {
        let visitNode = willVisit[visitIndex]
        visitIndex += 1
        
        if !visited.contains(visitNode) {
            visited.insert(visitNode)
            print(visitNode, terminator: " ")

            
            for child in graph[visitNode] ?? [] {
                if !visited.contains(child) {
                    willVisit.append(child)
                }
            }
            
        }
    }
    
    print("")
}

bfs(graph, 0)


let tree = [
    0: [1, 2],
    1: [3, 4],
    2: [],
    3: [],
    4: [5],
    5: []
]

func bfs_tree(_ tree:[Int: [Int]], _ start: Int) {
    var willVisit: [Int] = [start]
    var index = 0
    
    while index < willVisit.count {
        let visitNode = willVisit[index]
        index += 1
        print(visitNode, terminator: " ")
        
        for node in tree[visitNode] ?? [] {
            willVisit.append(node)
        }
    }
    
    print("")
}

bfs_tree(tree, 0)

//: [Next](@next)
