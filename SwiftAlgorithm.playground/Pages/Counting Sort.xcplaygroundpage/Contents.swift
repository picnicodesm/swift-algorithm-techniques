//: [Previous](@previous)

import Foundation

func countingSort(_ arr: [Int]) -> [Int] {
    let max = arr.max()!
    let min = arr.min()!
    
    var countArr = Array(repeating: 0, count: (max-min+1))
    var outputArr = Array(repeating: 0, count: arr.count)
    
    for n in arr {
        countArr[n-min] += 1
    }
    
    for i in 1..<countArr.count {
        countArr[i] += countArr[i-1]
    }
    
    for n in arr.reversed() {
        let index = n - min
        outputArr[countArr[index]-1] = n
        countArr[index] -= 1
    }
    
    return outputArr
}

let arr = [4, 2, 2, 8, 3, 3, 1]
let sorted = countingSort(arr)
print(sorted)


//: [Next](@next)
