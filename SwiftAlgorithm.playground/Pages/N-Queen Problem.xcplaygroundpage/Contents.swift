//: [Previous](@previous)

import Foundation

func nQueen(_ n: Int) -> Int {
    var result = 0
    var board = Array(repeating: -1, count: n)
    
    func promising(_ row: Int) -> Bool {
        for i in 0..<row {
            if board[i] == board[row] || abs(board[i] - board[row]) == abs(i-row)  {
                return false
            }
        }
        
        return true
    }
    
    func dfs(_ row: Int) {
        if row == n {
            result += 1
            return
        }
        
        for i in 0..<n {
            board[row] = i
            
            if promising(row) { dfs(row+1) }
        }
    }
    
    dfs(0)
    return result
}

func nQueen2(_ n: Int) -> Int {
    var result = 0
       
       // 열, ↘ 대각선, ↙ 대각선 충돌 여부를 기록하는 배열
       var colUsed = [Bool](repeating: false, count: n)
       var diag1Used = [Bool](repeating: false, count: 2 * n)       // ↘ row + col
       var diag2Used = [Bool](repeating: false, count: 2 * n)       // ↙ row - col + (n - 1)

       func dfs(_ row: Int) {
           if row == n {
               result += 1
               return
           }

           for col in 0..<n {
               if colUsed[col] || diag1Used[row + col] || diag2Used[row - col + n - 1] {
                   continue // 해당 위치는 퀸을 놓을 수 없음 (가지치기)
               }

               // 현재 위치에 퀸을 놓음
               colUsed[col] = true
               diag1Used[row + col] = true
               diag2Used[row - col + n - 1] = true

               // 다음 행으로
               dfs(row + 1)

               // 상태 복구 (백트래킹)
               colUsed[col] = false
               diag1Used[row + col] = false
               diag2Used[row - col + n - 1] = false
           }
       }

       dfs(0)
       return result
}


let clock = ContinuousClock()
print("========= nQueen =========")
for n in 1...12 {
    let time = clock.measure {
        nQueen(n)
    }
    
    print("\(n): \(time)")
}
print("")

print("========= 최적화 nQueen =========")
for n in 1...12 {
    let time = clock.measure {
        nQueen2(n)
    }
    
    print("\(n): \(time)")
}

/*
 ========= nQueen =========
 1: 0.000183791 seconds
 2: 9.0542e-05 seconds
 3: 0.000194667 seconds
 4: 0.0005795 seconds
 5: 0.04062 seconds
 6: 0.008824458 seconds
 7: 0.035520458 seconds
 8: 0.157197625 seconds
 9: 0.731220542 seconds
 10: 3.507638458 seconds
 11: 18.363061040999998 seconds
 12: 104.386612833 seconds

 ========= 최적화 nQueen =========
 1: 0.000190125 seconds
 2: 0.000125042 seconds
 3: 0.000217583 seconds
 4: 0.000542042 seconds
 5: 0.001564125 seconds
 6: 0.004609375 seconds
 7: 0.014903459 seconds
 8: 0.055852209 seconds
 9: 0.236406792 seconds
 10: 0.99982275 seconds
 11: 4.735026792 seconds
 12: 24.455623958999997 seconds
 */

//: [Next](@next)
