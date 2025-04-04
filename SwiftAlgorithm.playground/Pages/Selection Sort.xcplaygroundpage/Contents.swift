//: [Previous](@previous)

import Foundation

func selectionSort(_ arr: [Int]) -> [Int] {
    var sorted = arr
    
    for i in 0..<sorted.count-1 {
        var smallestIndex = i
        for j in i+1..<sorted.count {
            if sorted[j] < sorted[smallestIndex] {
                smallestIndex = j
            }
        }
        
        sorted.swapAt(i, smallestIndex)
    }

    return sorted
}

let arr = [100, 50, 25, 75, 0, -25]
let sorted = selectionSort(arr)
print(sorted)

//: [Next](@next)
