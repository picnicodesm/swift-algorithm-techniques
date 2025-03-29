//: [Previous](@previous)

import Foundation

func binarySearch<T: Comparable>(_ data: T, in arr: [T]) -> Bool {
    var startIndex = 0
    var endIndex = arr.count-1
    
    while startIndex <= endIndex {
        let centerIndex = (startIndex + endIndex) / 2
        
        if data == arr[centerIndex] { return true }
        if data < arr[centerIndex] {
            endIndex = centerIndex - 1
        } else {
            startIndex = centerIndex + 1
        }

    }
    
    return false
}

let arr = Array(1...18)
print(binarySearch(4, in: arr))
print(binarySearch(1, in: arr))
print(binarySearch(-1, in: arr))
print(binarySearch(20, in: arr))


//: [Next](@next)
