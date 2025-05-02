//: [Previous](@previous)

import Foundation

// 그래프 예시: [node] = [연결된 노드 리스트]
let graph = [
    0: [1, 2],
    1: [0, 3, 4],
    2: [0],
    3: [1],
    4: [1, 5],
    5: [4]
]

// 방문 표시를 위한 배열
var visited = Array(repeating: false, count: 6)

@MainActor
func dfs(_ node: Int) {
    
    // 현재 노드를 방문했다 표시
    visited[node] = true
    print(node, terminator: " ")
    
    // 연결된 노드들 중 방문하지 않은 곳을 계속 탐색
    for neighbor in graph[node]! {
        if !visited[neighbor] {
            dfs(neighbor)
        }
    }
}

print("dfs with recursive")
dfs(0)
print("\n")
// 0 1 3 4 5 2

let test = [
    0: [1, 2],
    1: [0, 3],
    2: [0, 3],
    3: [1, 2],
]

func dfs_stack(graph: [Int: [Int]], start: Int) {
    var visited = Set<Int>()
    var needVisitStack: [Int] = [start]
    var order: [Int] = []
    
    while !needVisitStack.isEmpty {
        let node = needVisitStack.removeLast()
        
        if !visited.contains(node) {
            visited.insert(node)
            order.append(node)
            print(node, terminator: " ")
            
            for neighbor in graph[node] ?? [] {
                if !visited.contains(neighbor) {
                    needVisitStack.append(neighbor)
                }
            }
        }
    }
}

print("dfs with stack")
dfs_stack(graph: graph, start: 0)
print("")
print("dfs with stack(circle graph)")
dfs_stack(graph: test, start: 0)
print("\n")

// 0 2 1 4 5 3
// 0 2 3 1

let tree = [
    0: [1, 2],
    1: [3, 4],
    2: [],
    3: [],
    4: [5],
    5: []
]

func dfs_tree(tree: [Int: [Int]], start: Int) {
    var stack: [Int] = [start]
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        print(node, terminator: " ")
        
        for child in tree[node] ?? [] {
            stack.append(child)
        }
    }
}

print("dfs in tree")
dfs_tree(tree: tree, start: 0)
print("")

//: [Next](@next)
