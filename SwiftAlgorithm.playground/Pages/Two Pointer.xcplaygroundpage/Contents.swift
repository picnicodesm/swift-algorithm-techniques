//: [Previous](@previous)

import Foundation

// input: 찾으려는 쌍의 합이되는 값, 배열
// output: 한 쌍의 인덱스
func hasPair(of num: Int, in arr: [Int]) -> Bool {
    var left = 0
    var right = arr.count - 1
    
    while left < right {
        let sum = arr[left] + arr[right]
        if sum == num {
            return true
        } else if sum < num {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return false
}

let testArray = [1, 2, 3, 5, 7, 8, 11]
let target = 13
print(hasPair(of: target, in: testArray))

//: [Next](@next)
