//: [Previous](@previous)

import Foundation

func insertionSort(_ arr: [Int]) -> [Int] {
    var sorted = arr
    
    for i in 1..<sorted.count {
        for j in stride(from: i, to: 0, by: -1) {
            if sorted[j] < sorted[j-1] {
                sorted.swapAt(j, j-1)
            } else {
                break
            }
        }
    }
    
    return sorted
}

let arr = [100, 50, 25, 75, 0, -25]
let sorted = insertionSort(arr)
print(sorted)

//: [Next](@next)
