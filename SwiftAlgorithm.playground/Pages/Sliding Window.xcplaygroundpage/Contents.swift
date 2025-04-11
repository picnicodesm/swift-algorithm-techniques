//: [Previous](@previous)

import Foundation

let testArray = [1, 3, 2, 6, 2, 5, 1, 7, 2, 4]
let windowSize = 3
var windowSum = testArray[0..<windowSize].reduce(0, +)
var maxSubSum = windowSum

for i in windowSize..<testArray.count {
    windowSum += testArray[i] - testArray[i - windowSize]
    maxSubSum = max(maxSubSum, windowSum)
}

print(maxSubSum)

//: [Next](@next)
