//: [Previous](@previous)

import Foundation

var arr = [3, 1, 4, 1, 5, 9]
var prefixSum = [0]

for n in arr {
    prefixSum.append(prefixSum.last! + n)
}

print(prefixSum)
print(prefixSum[5] - prefixSum[3]) // 4-5의 구간 합

var matrix = [
    [3, 1, 4, 1],
    [2, 5, 3, 9],
    [5, 7, 5, 4]
]
var prefixSumMatrix = Array(repeating: Array(repeating: 0, count: matrix[0].count+1), count: matrix.count+1)

for i in 1..<prefixSumMatrix.count {
    for j in 1..<prefixSumMatrix[0].count {
        
        prefixSumMatrix[i][j] = prefixSumMatrix[i-1][j] + prefixSumMatrix[i][j-1] - prefixSumMatrix[i-1][j-1] + matrix[i-1][j-1]
    }
}

print(prefixSumMatrix)
print(prefixSumMatrix[3][4] - prefixSumMatrix[3][2] - prefixSumMatrix[1][4] + prefixSumMatrix[1][2])


//: [Next](@next)
