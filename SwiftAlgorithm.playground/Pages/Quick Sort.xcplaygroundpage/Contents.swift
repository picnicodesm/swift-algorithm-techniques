//: [Previous](@previous)

import Foundation

func quickSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 { return arr }
    var left: [Int] = []
    let pivot = arr[0]
    var right: [Int] = []
    
    for i in 1..<arr.count {
        if arr[i] <= pivot {
            left.append(arr[i])
        } else {
            right.append(arr[i])
        }
    }
    
    return quickSort(left) + [pivot] + quickSort(right)
}

let arr = [100, 50, 25, 75, 0, -25]
let sorted = quickSort(arr)
print(sorted)

//: [Next](@next)
