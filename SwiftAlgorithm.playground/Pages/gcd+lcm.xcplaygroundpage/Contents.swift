//: [Previous](@previous)

import Foundation

func gcd_loop(_ a: Int, _ b: Int) -> Int {
    var large = max(a, b)
    var small = min(a, b)
    
    while small != 0 {
        let r = large % small
        large = small
        small = r
    }
    
    return large
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    if a == 0 || b == 0 { return 0 }
    return (a * b) / gcd(a, b)
}

func gcd(_ numbers: [Int]) -> Int {
    return numbers.reduce(numbers[0]) { gcd($0, $1) }
}

func lcm(_ numbers: [Int]) -> Int {
    return numbers.reduce(numbers[0]) { lcm($0, $1) }
}

print(gcd([12, 18, 24])) // 6
print(gcd([7, 13, 29])) // 1
print(gcd([1000000, 500000, 250000])) // 250000
print(gcd([987654321, 123456789])) // 9
print(gcd([0, 20, 30])) // 10
print(gcd([0, 0, 0, 10])) // 10
print(gcd([42, 42, 42, 42])) // 42
print(gcd([1, 1, 1, 1])) // 1
print(gcd([8, 14, 28, 7])) // 1
print(gcd([10, 15, 25, 35])) // 5
print(gcd([17])) // 17
print(gcd([0])) // 0
print("")
print(lcm([4, 5]))       // 20
print(lcm([3, 7, 21]))   // 21
print(lcm([6, 8, 12]))   // 24
print(lcm([10, 10, 10])) // 10
print(lcm([9, 18, 9]))   // 18
print(lcm([13, 17, 19])) // 4199
print(lcm([2, 3, 5, 7])) // 210
print(lcm([0, 5, 10]))   // 0
print(lcm([0, 0, 7]))    // 0
print(lcm([1, 5, 10]))   // 10
print(lcm([1, 2, 3, 4])) // 12
print(lcm([100, 200, 300])) // 600
print(lcm([120, 150, 180])) // 1800
print(lcm([42]))  // 42
print(lcm([1]))   // 1

//: [Next](@next)
