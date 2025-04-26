//: [Previous](@previous)

import Foundation

// Recursive
func fibo_recursive(_ n: Int) -> Int {
    if n == 1 || n == 2 { return 1 }
    
    return fibo_recursive(n-1) + fibo_recursive(n-2)
}

print(fibo_recursive(5))

var memo: [Int] = Array(repeating: -1, count: 50)

@MainActor
func fibo_topDown(_ n: Int) -> Int {
    if n <= 1 { return n }
    
    if memo[n] != -1 {
        return memo[n]
    }
    
    memo[n] = fibo_topDown(n - 1) + fibo_topDown(n - 2)
    return memo[n]
}

print(fibo_topDown(5))

func fibo_bottomUp(_ n: Int) -> Int {
    if n <= 1 { return n }
    var table = [Int](repeating: 0, count: n + 1)
    table[0] = 0
    table[1] = 1
    
    for i in 2...n {
        table[i] = table[i-1] + table[i-2]
    }
    
    return table[n]
}

print(fibo_bottomUp(5))










//: [Next](@next)
