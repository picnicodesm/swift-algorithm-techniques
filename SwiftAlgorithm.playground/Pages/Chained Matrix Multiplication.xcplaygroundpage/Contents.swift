//: [Previous](@previous)

import Foundation

let matrices: [[Int]] = [[5, 2], [2, 3], [3, 4], [4, 6], [6, 7], [7, 8]]

func cmm(_ matrices: [[Int]], target: [Int]) -> Int {
    var dp: [[Int]] = Array(repeating: Array(repeating: Int.max, count: matrices.count), count: matrices.count)
    
    for i in 0..<dp.count { dp[i][i] = 0 }
    
    for line in 0..<dp.count {
        for point in 0..<dp.count-line {
            let i = point
            let j = point+line
            for k in i..<j {
                dp[i][j] = min(dp[i][j], dp[i][k] + dp[k+1][j] + matrices[i][0] * matrices[k+1][0] * matrices[j][1])
            }
        }
    }
    
    showMatrix(dp)
    
   return dp[target[0]-1][target[1]-1]
}

func showMatrix(_ table: [[Int]]) {
    for row in 0..<table.count {
        for col in 0..<table.count {
            if col < row { print(String(format: "%3d", -1), terminator: " ") }
            else { print(String(format: "%3d", table[row][col]), terminator: " ") }
        }
        print("")
    }
}

print(cmm(matrices, target: [1,3]))




//: [Next](@next)
