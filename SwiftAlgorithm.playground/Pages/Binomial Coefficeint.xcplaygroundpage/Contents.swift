//: [Previous](@previous)

import Foundation

func bin(_ n: Int, _ k: Int) -> Int {
    if k == 0 || k == n { return 1 }
    return bin(n-1, k-1) + bin(n-1, k)
}


// DP
func bin2(_ n: Int, _ k: Int) -> Int {
    var arr = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
    for i in 0...n {
        for j in 0...min(i, k) {
            if j == 0 || j == i {
                arr[i][j] = 1
            } else {
                arr[i][j] = arr[i-1][j-1] + arr[i-1][j]
            }
        }
    }
    return arr[n][k]
}

//: [Next](@next)
