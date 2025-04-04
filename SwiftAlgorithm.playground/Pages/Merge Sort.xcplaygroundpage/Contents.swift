//: [Previous](@previous)

import Foundation

func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 { return arr }
    let center = arr.count/2
    let left = Array(arr[0..<center])
    let right = Array(arr[center..<arr.count])
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var output: [Int] = []
        let leftLength = left.count
        let rightLength = right.count
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftLength && rightIndex < rightLength {
            if left[leftIndex] <= right[rightIndex] {
                output.append(left[leftIndex])
                leftIndex += 1
            } else {
                output.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        if leftIndex >= leftLength {
            output.append(contentsOf: Array(right[rightIndex..<rightLength]))
        } else {
            output.append(contentsOf: Array(left[leftIndex..<leftLength]))
        }
        
        return output
    }
    
    return merge(mergeSort(left), mergeSort(right))
}

let arr = [100, 50, 25, 75, 0, -25]
let sorted = mergeSort(arr)
print(sorted)

//: [Next](@next)
