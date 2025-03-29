import Foundation

func linearSearch<T: Equatable>(_ data: T, in arr: [T]) -> Bool {
    for element in arr {
        if element == data {
            return true
        }
    }
    
    return false
}

let arr = ["q", "w", "e", "r", "a", "s", "d", "f"]

print(linearSearch("a", in: arr))
print(linearSearch("i", in: arr))
