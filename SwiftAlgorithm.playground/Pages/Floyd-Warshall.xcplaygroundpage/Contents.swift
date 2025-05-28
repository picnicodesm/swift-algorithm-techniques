//: [Previous](@previous)

import Foundation

func floydWarshall(_ arr: [[Int]]) -> [[Int]] {
    var dp = arr
    
    for k in 0..<arr.count {
        for i in 0..<arr.count {
            for j in 0..<arr.count {
                dp[i][j] = min(dp[i][j], dp[i][k] + dp[k][j])
            }
        }
    }
    
    return dp
}

let intMax = Int.max / 2

let graph = [
    [0, 1, intMax, 1, 5],
    [9, 0, 3, 2, intMax],
    [intMax, intMax, 0, 4, intMax],
    [intMax, intMax, 2, 0, 3],
    [3, intMax, intMax, intMax, 0]
]

print(floydWarshall(graph))
// [[0, 1, 3, 1, 4], [8, 0, 3, 2, 5], [10, 11, 0, 4, 7], [6, 7, 2, 0, 3], [3, 4, 6, 4, 0]]

//: [Next](@next)
