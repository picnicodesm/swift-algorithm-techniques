//: [Previous](@previous)

import Foundation

func bubbleSort(_ arr: [Int]) -> [Int] {
    var sorted = arr
    
    for i in 0..<sorted.count-1 {
        var isSwapped = false
        for j in 0..<sorted.count-1-i {
            if sorted[j] > sorted[j+1] {
                sorted.swapAt(j, j+1)
                isSwapped = true
            }
        }
        
        if !isSwapped { break }
    }
    
    return sorted
}


let arr = [5, 2, 9, 1, 5, 6]
let sorted = bubbleSort(arr)
print(sorted)

//: [Next](@next)
