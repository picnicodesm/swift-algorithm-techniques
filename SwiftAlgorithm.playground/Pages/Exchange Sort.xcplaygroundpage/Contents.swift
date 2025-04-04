//: [Previous](@previous)

import Foundation

func exchangeSort(_ arr: [Int]) -> [Int] {
    var sorted = arr
    
    for i in 0..<sorted.count-1 {
        for j in i+1..<sorted.count {
            if sorted[j] < sorted[i] {
                sorted.swapAt(i, j)
            }
        }
    }
    
    return sorted
}

let arr = [10, -3, 0, 8, 7, 2]
let sorted = exchangeSort(arr)
print(sorted)

//: [Next](@next)
